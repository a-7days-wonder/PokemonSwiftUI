import Alamofire
import Foundation

protocol ApiDataStore {
    func call<T: ApiRequestable>(_ request: T) async -> Result<T.Response, ApiError>
}

struct ApiDataStoreImpl {
    private let reachabilityDataStore: ReachabilityDataStore
    private let session: URLSession
    private let decoder: JSONDecoder

    init(
        reachabilityDataStore: ReachabilityDataStore = ReachabilityDataStoreProvider.provide(),
        session: URLSession = .shared,
        decoder: JSONDecoder = .default
    ) {
        self.reachabilityDataStore = reachabilityDataStore
        self.session = session
        self.decoder = decoder
    }

    private var isReachable: Bool {
        reachabilityDataStore.isReachable
    }

    private func validate(response: URLResponse) -> ApiError? {
        guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
            return .network
        }

        guard (200..<300).contains(statusCode) else {
            if (400..<500).contains(statusCode) {
                return .server(.client)
            } else if (500..<600).contains(statusCode) {
                return .server(.server)
            } else {
                return .server(.other(statusCode: statusCode))
            }
        }

        return nil
    }
}

extension ApiDataStoreImpl: ApiDataStore {
    func call<T>(_ request: T) async -> Result<T.Response, ApiError> where T: ApiRequestable {
        guard isReachable else {
            return .failure(.connection)
        }

        guard let urlRequest = request.toUrlRequest() else {
            return .failure(.buildingRequestFailed)
        }

        guard let (data, response) = try? await session.data(for: urlRequest) else {
            return .failure(.requestFailed)
        }

        if let error = validate(response: response) {
            return .failure(error)
        }

        guard let success = try? decoder.decode(T.Response.self, from: data) else {
            return .failure(.decodingFailure)
        }

        return .success(success)
    }
}
