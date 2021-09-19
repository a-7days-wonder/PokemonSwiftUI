struct PokemonList {
    let count: Int
    let pokemons: [Pokemon]

    init(from response: PokemonListApiResponse) {
        count = response.count
        pokemons = response.results.map(Pokemon.init(from:))
    }
}
