import Domain
import PokemonDetail
import SwiftUI

struct PokemonListView: View {
    @StateObject var viewModel: PokemonListViewModel

    init(viewModel: PokemonListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.pokemons, id: \.number) { pokemon in
                        NavigationLink {
                            PokemonDetailBuilder.build()
                        } label: {
                            PokemonListCell(
                                number: pokemon.number,
                                thumbnailUrl: pokemon.thumbnailUrl,
                                name: pokemon.name
                            ).frame(height: 100)
                            .foregroundColor(.black)
                        }
                    }
                    if viewModel.canFetchMore {
                        ProgressView().task {
                            await viewModel.fetchMore()
                        }
                    }
                }
            }.task {
                await viewModel.fetchPokemons()
            }.navigationTitle("Pokemon List")
        }
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView(viewModel: PokemonListViewModel(pokemonListUseCase: PokemonListUseCaseProvider.provide()))
    }
}
