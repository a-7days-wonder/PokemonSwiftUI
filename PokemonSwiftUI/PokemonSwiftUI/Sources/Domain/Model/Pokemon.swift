import DataStore
import Foundation

public struct Pokemon {
    public let name: String
    public let number: Int
    public let thumbnailUrl: URL?

    init(from resource: NamedUrlResource) {
        name = resource.name
        number = PokemonNumberGenerator.generate(from: resource.url)
        thumbnailUrl = PokemonImageURLGenerator.generateThumbnailURL(from: number)
    }
}
