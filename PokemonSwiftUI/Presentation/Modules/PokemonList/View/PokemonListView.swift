import SwiftUI

struct PokemonListView: View {
    private let viewModel: PokemonListViewModelContract

    init(viewModel: PokemonListViewModelContract) {
        self.viewModel = viewModel
    }

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView(viewModel: PokemonListViewModelProvider.provide())
    }
}
