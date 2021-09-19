import Domain
import SwiftUI

public struct PokemonListView: View {
    @StateObject var viewModel: PokemonListViewModel

    public init(viewModel: PokemonListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    public var body: some View {
        List(viewModel.pokemons, id: \.number) { pokemon in
            PokemonListCell(thumbnailUrl: pokemon.thumbnailUrl, name: pokemon.name)
        }.task {
            await viewModel.fetchPokemons()
        }.refreshable {
            await viewModel.fetchPokemons()
        }
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView(viewModel: PokemonListViewModel(pokemonListUseCase: PokemonListUseCaseProvider.provide()))
    }
}
