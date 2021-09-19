import SwiftUI

struct AppRootView: View {
    var body: some View {
        PokemonListView(viewModel: .init(pokemonListUseCase: PokemonListUseCaseProvider.provide()))
    }
}

struct AppRootView_Previews: PreviewProvider {
    static var previews: some View {
        AppRootView()
    }
}
