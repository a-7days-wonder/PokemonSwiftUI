import DataStore

public enum PokemonDetailUseCaseProvider {
    public static func provide() -> PokemonDetailUseCaseContract {
        PokemonDetailUseCase(pokemonDetailRepository: PokemonDetailRepositoryProvider.provide())
    }
}

public protocol PokemonDetailUseCaseContract {
}

struct PokemonDetailUseCase {
    private let pokemonDetailRepository: PokemonDetailRepositoryContract

    init(pokemonDetailRepository: PokemonDetailRepositoryContract) {
        self.pokemonDetailRepository = pokemonDetailRepository
    }
}

extension PokemonDetailUseCase: PokemonDetailUseCaseContract {
}
