import Domain
import PokemonList
import SwiftUI

public struct AppRootView: View {
    public init() {}
    
    public var body: some View {
        PokemonListView(viewModel: .init(pokemonListUseCase: PokemonListUseCaseProvider.provide()))
    }
}

struct AppRootView_Previews: PreviewProvider {
    static var previews: some View {
        AppRootView()
    }
}
