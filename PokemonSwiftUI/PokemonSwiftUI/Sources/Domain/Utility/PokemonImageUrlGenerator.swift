import Foundation

enum PokemonImageURLGenerator {
    static func generateThumbnailURL(from number: Int) -> URL? {
        // 3桁0埋め文字列生成
        let formatId = String(format: "%03d", number)
        let imageUrl = "https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/thumbnails/\(formatId).png"
        return URL(string: imageUrl)
    }

    static func generateImageURL(from number: Int) -> URL? {
        // 3桁0埋め文字列生成
        let formatId = String(format: "%03d", number)
        let imageUrl = "https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/\(formatId).png"
        return URL(string: imageUrl)
    }
}
