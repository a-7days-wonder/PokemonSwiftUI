import Domain
import PokemonList
import SwiftUI

struct AppRootView: View {
    var body: some View {
        PokemonListBuilder.build()
    }
}

struct AppRootView_Previews: PreviewProvider {
    static var previews: some View {
        AppRootView()
    }
}
