import DataStore

public enum PokemonListUseCaseProvider {
    public static func provide() -> PokemonListUseCaseContract {
        PokemonListUseCase(pokemonListRepository: PokemonListRepositoryProvider.provide())
    }
}

public protocol PokemonListUseCaseContract {
    func fetch(offset: Int) async throws -> PokemonList
}

struct PokemonListUseCase {
    private let pokemonListRepository: PokemonListRepositoryContract

    init(pokemonListRepository: PokemonListRepositoryContract) {
        self.pokemonListRepository = pokemonListRepository
    }
}

extension PokemonListUseCase: PokemonListUseCaseContract {
    func fetch(offset: Int) async throws -> PokemonList {
        let response = try await pokemonListRepository.fetch(offset: offset, limit: 20)
        return .init(from: response)
    }
}
