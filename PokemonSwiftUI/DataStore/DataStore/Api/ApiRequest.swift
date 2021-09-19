import Alamofire
import Foundation

protocol ApiRequestable {
    associatedtype Response: Decodable

    var method: Alamofire.HTTPMethod { get }
    var baseURL: URL { get }
    var path: String { get }
    var headers: Alamofire.HTTPHeaders { get }
    var parameters: Alamofire.Parameters { get }
    var encoding: Alamofire.ParameterEncoding { get }
}

extension ApiRequestable {
    var headers: Alamofire.HTTPHeaders {
        .init()
    }

    var parameters: Alamofire.Parameters {
        .init()
    }

    var encoding: Alamofire.ParameterEncoding {
        if case .get = method {
            return Alamofire.URLEncoding.default
        } else {
            return Alamofire.JSONEncoding.default
        }
    }

    func toUrlRequest() -> URLRequest? {
        guard let request = try? URLRequest(
            url: baseURL.appendingPathComponent(path),
            method: method,
            headers: headers
        ) else {
            return nil
        }
        return try? encoding.encode(request, with: parameters)
    }
}
