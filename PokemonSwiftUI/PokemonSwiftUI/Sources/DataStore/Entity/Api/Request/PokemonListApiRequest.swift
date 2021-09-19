import Alamofire

struct PokemonListApiRequest: ApiRequestable {
    typealias Response = PokemonListApiResponse

    var method: HTTPMethod {
        .get
    }

    var path: String {
        "pokemon"
    }
}
