import Domain
import SwiftUI

public struct PokemonListView: View {
    @StateObject var viewModel: PokemonListViewModel

    public init(viewModel: PokemonListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    public var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.pokemons, id: \.number) { pokemon in
                    PokemonListCell(
                        number: pokemon.number,
                        thumbnailUrl: pokemon.thumbnailUrl,
                        name: pokemon.name
                    ).frame(height: 100)
                }
                if viewModel.canFetchMore {
                    ProgressView()
                        .task {
                            await viewModel.fetchMore()
                        }
                }
            }
        }.task {
            await viewModel.fetchPokemons()
        }
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView(viewModel: PokemonListViewModel(pokemonListUseCase: PokemonListUseCaseProvider.provide()))
    }
}
