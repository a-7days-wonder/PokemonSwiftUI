import Domain
import SwiftUI

@MainActor
public enum PokemonListBuilder {
    public static func build() -> some View {
        let pokemonListUseCase = PokemonListUseCaseProvider.provide()
        let viewModel = PokemonListViewModel(pokemonListUseCase: pokemonListUseCase)
        return PokemonListView(viewModel: viewModel)
    }
}
