import Foundation
import SwiftUI

struct PokemonListCell: View {
    let number: Int
    let thumbnailUrl: URL?
    let name: String

    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 8) {
                Text(String(number))
                    .frame(width: geometry.size.width / 10)

                AsyncImage(url: thumbnailUrl) { image in
                    image.resizable().scaledToFit()
                } placeholder: {
                    ProgressView()
                }.frame(
                    width: geometry.size.height,
                    height: geometry.size.height,
                    alignment: .center
                ).padding(8)

                Text(name)
            }.padding(8)
        }
    }
}

struct PokemonListCell_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListCell(
            number: 0,
            thumbnailUrl: nil,
            name: "カイオーガ"
        ).previewLayout(.fixed(width: 375, height: 100))
    }
}
