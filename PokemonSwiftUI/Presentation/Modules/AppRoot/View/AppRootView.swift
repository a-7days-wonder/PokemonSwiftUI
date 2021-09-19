import SwiftUI

struct AppRootView: View {
    var body: some View {
        PokemonListView(viewModel: PokemonListViewModelProvider.provide())
    }
}

struct AppRootView_Previews: PreviewProvider {
    static var previews: some View {
        AppRootView()
    }
}
