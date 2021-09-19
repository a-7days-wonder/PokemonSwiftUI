enum ApiError: Error {
    case connection
    case network
    case server(ServerError)
    case decodingFailure
    case other(message: String)
}

enum ServerError: Error {
    /// 400番台
    case client
    /// 500番台
    case server
    /// その他
    case other(statusCode: Int)
}
