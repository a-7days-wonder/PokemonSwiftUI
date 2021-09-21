public enum PokemonDetailRepositoryProvider {
    public static func provide() -> PokemonDetailRepositoryContract {
        PokemonDetailRepository(apiDataStore: ApiDataStoreProvider.provide())
    }
}

public protocol PokemonDetailRepositoryContract {
}

struct PokemonDetailRepository {
    private let apiDataStore: ApiDataStoreContract

    init(apiDataStore: ApiDataStoreContract) {
        self.apiDataStore = apiDataStore
    }
}

extension PokemonDetailRepository: PokemonDetailRepositoryContract {
}
