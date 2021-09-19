import DataStore

public struct PokemonList {
    public let count: Int
    public let pokemons: [Pokemon]

    public init(from response: PokemonListApiResponse) {
        count = response.count
        pokemons = response.results.map(Pokemon.init(from:))
    }
}
