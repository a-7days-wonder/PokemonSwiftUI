import Alamofire

struct PokemonListApiRequest: ApiRequestable {
    typealias Response = PokemonListApiResponse

    var method: HTTPMethod {
        .get
    }

    var path: String {
        "pokemon"
    }

    var parameters: Parameters

    init(offset: Int, limit: Int) {
        parameters = [
            "offset": offset,
            "limit": limit
        ]
    }
}
