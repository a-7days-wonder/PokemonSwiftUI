import Foundation
import SwiftUI

struct PokemonListCell: View {
    let thumbnailUrl: URL?
    let name: String

    var body: some View {
        HStack {
            AsyncImage(url: thumbnailUrl) { image in
                image.resizable().scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 75, height: 75, alignment: .center)
            .padding(8)

            Text(name)
                .font(.body)
        }
    }
}

struct PokemonListCell_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListCell(thumbnailUrl: nil, name: "カイオーガ")
    }
}
