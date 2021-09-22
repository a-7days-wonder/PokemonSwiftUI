import Domain
import SwiftUI

@MainActor
public enum PokemonDetailBuilder {
    public static func build() -> some View {
        let pokemonDetailUseCase = PokemonDetailUseCaseProvider.provide()
        let viewModel = PokemonDetailViewModel(pokemonDetailUseCase: pokemonDetailUseCase)
        return PokemonDetailView(viewModel: viewModel)
    }
}
