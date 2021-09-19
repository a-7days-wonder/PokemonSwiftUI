import Alamofire
import Foundation

enum ApiDataStoreProvider {
    static func provide() -> ApiDataStoreContract {
        ApiDataStore(
            reachabilityDataStore: ReachabilityDataStoreProvider.provide(),
            session: Alamofire.AF,
            decoder: .default
        )
    }
}

protocol ApiDataStoreContract {
    func call<T: ApiRequestable>(_ request: T) async throws -> T.Response
}

struct ApiDataStore {
    private let reachabilityDataStore: ReachabilityDataStore
    private let session: Alamofire.Session
    private let decoder: JSONDecoder

    init(
        reachabilityDataStore: ReachabilityDataStore,
        session: Alamofire.Session,
        decoder: JSONDecoder
    ) {
        self.reachabilityDataStore = reachabilityDataStore
        self.session = session
        self.decoder = decoder
    }

    private var isReachable: Bool {
        reachabilityDataStore.isReachable
    }
}

extension ApiDataStore: ApiDataStoreContract {
    func call<T: ApiRequestable>(_ request: T) async throws -> T.Response {
        guard isReachable else {
            throw ApiError.connection
        }

        return try await withCheckedThrowingContinuation { continuation in
            session.request(
                request.url,
                method: request.method,
                parameters: request.parameters,
                encoding: request.encoding,
                headers: request.headers
            ).validate(statusCode: 200..<300).responseData { response in
                if response.response?.statusCode == 204,
                   let noContents = NoContents() as? T.Response {
                    continuation.resume(returning: noContents)
                }

                switch response.result {
                case let .success(data):
                    do {
                        let success = try decoder.decode(T.Response.self, from: data)
                        continuation.resume(returning: success)
                    } catch {
                        continuation.resume(throwing: ApiError.decodingFailure)
                    }
                case let .failure(error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
