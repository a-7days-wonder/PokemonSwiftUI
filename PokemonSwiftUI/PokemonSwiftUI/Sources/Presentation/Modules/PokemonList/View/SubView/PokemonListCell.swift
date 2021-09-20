import Foundation
import SwiftUI

struct PokemonListCell: View {
    let number: Int
    let thumbnailUrl: URL?
    let name: String

    var body: some View {
        HStack {
            Text(String(number))
            AsyncImage(url: thumbnailUrl) { image in
                image.resizable().scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 75, height: 75, alignment: .center)
            .padding(8)

            Text(name)
        }
    }
}

struct PokemonListCell_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListCell(number: 0, thumbnailUrl: nil, name: "カイオーガ")
    }
}
