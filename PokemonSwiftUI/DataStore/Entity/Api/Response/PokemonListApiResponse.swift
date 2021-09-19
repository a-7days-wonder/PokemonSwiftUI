struct PokemonListApiResponse: Decodable {
    let count: Int
    let previous: String?
    let next: String?
    let results: [NamedUrlResource]
}
