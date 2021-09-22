import Combine
import Domain

@MainActor
final class PokemonDetailViewModel: ObservableObject {
    private let pokemonDetailUseCase: PokemonDetailUseCaseContract

    init(pokemonDetailUseCase: PokemonDetailUseCaseContract) {
        self.pokemonDetailUseCase = pokemonDetailUseCase
    }
}
