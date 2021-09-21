import Foundation
import SwiftUI

struct PokemonListCell: View {
    let number: Int
    let thumbnailUrl: URL?
    let name: String

    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 16) {
                Text("#" + .init(number))
                    .frame(width: geometry.size.width * 0.2)

                AsyncImage(url: thumbnailUrl) { image in
                    image.resizable().scaledToFit()
                } placeholder: {
                    ProgressView()
                }.frame(
                    width: geometry.size.height,
                    height: geometry.size.height
                )

                Text(name)
            }
        }.padding(8)
    }
}

struct PokemonListCell_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListCell(
            number: 10000,
            thumbnailUrl: nil,
            name: .init(repeating: "カイオーガ", count: 10)
        ).previewLayout(.fixed(width: 375, height: 100))
    }
}
