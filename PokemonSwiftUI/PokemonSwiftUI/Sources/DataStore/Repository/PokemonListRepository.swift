public enum PokemonListRepositoryProvider {
    public static func provide() -> PokemonListRepositoryContract {
        PokemonListRepository(apiDataStore: ApiDataStoreProvider.provide())
    }
}

public protocol PokemonListRepositoryContract {
    func fetch(offset: Int, limit: Int) async throws -> PokemonListApiResponse
}

struct PokemonListRepository {
    private let apiDataStore: ApiDataStoreContract

    init(apiDataStore: ApiDataStoreContract) {
        self.apiDataStore = apiDataStore
    }
}

extension PokemonListRepository: PokemonListRepositoryContract {
    func fetch(offset: Int, limit: Int) async throws -> PokemonListApiResponse {
        try await apiDataStore.call(PokemonListApiRequest(offset: offset, limit: limit))
    }
}
