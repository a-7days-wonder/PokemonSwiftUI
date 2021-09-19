enum PokemonListRepositoryProvider {
    static func provide() -> PokemonListRepositoryContract {
        PokemonListRepository(apiDataStore: ApiDataStoreProvider.provide())
    }
}

protocol PokemonListRepositoryContract {
}

struct PokemonListRepository {
    private let apiDataStore: ApiDataStoreContract

    init(apiDataStore: ApiDataStoreContract) {
        self.apiDataStore = apiDataStore
    }
}

extension PokemonListRepository: PokemonListRepositoryContract {
}
