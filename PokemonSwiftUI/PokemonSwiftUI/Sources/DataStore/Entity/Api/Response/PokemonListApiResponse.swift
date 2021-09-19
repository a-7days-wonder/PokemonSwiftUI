public struct PokemonListApiResponse: Decodable {
    public let count: Int
    public let previous: String?
    public let next: String?
    public let results: [NamedUrlResource]
}
