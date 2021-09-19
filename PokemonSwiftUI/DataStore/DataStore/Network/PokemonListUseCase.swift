enum PokemonListUseCaseProvider {
    static func provide() -> PokemonListUseCaseContract {
        PokemonListUseCase(pokemonListRepository: PokemonListRepositoryProvider.provide())
    }
}

protocol PokemonListUseCaseContract {
}

struct PokemonListUseCase {
    private let pokemonListRepository: PokemonListRepositoryContract

    init(pokemonListRepository: PokemonListRepositoryContract) {
        self.pokemonListRepository = pokemonListRepository
    }
}

extension PokemonListUseCase: PokemonListUseCaseContract {
}
