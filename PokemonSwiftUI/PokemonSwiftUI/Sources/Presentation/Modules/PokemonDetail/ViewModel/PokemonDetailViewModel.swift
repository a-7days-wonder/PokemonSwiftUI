import Combine
import Domain

@MainActor
public final class PokemonDetailViewModel: ObservableObject {
    private let pokemonDetailUseCase: PokemonDetailUseCaseContract

    public init(pokemonDetailUseCase: PokemonDetailUseCaseContract) {
        self.pokemonDetailUseCase = pokemonDetailUseCase
    }
}
