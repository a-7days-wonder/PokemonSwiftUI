import Domain
import PokemonList
import SwiftUI

public struct AppRootView: View {
    public init() {}

    public var body: some View {
        PokemonListBuilder.build()
    }
}

struct AppRootView_Previews: PreviewProvider {
    static var previews: some View {
        AppRootView()
    }
}
