enum PokemonListViewModelProvider {
    static func provide() -> PokemonListViewModelContract {
        PokemonListViewModel(pokemonListUseCase: PokemonListUseCaseProvider.provide())
    }
}

protocol PokemonListViewModelContract {
}

struct PokemonListViewModel {
    private let pokemonListUseCase: PokemonListUseCaseContract

    init(pokemonListUseCase: PokemonListUseCaseContract) {
        self.pokemonListUseCase = pokemonListUseCase
    }
}

extension PokemonListViewModel: PokemonListViewModelContract {
}
