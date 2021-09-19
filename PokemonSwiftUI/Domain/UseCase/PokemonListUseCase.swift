enum PokemonListUseCaseProvider {
    static func provide() -> PokemonListUseCaseContract {
        PokemonListUseCase(pokemonListRepository: PokemonListRepositoryProvider.provide())
    }
}

protocol PokemonListUseCaseContract {
    func fetch() async throws -> PokemonList
}

struct PokemonListUseCase {
    private let pokemonListRepository: PokemonListRepositoryContract

    init(pokemonListRepository: PokemonListRepositoryContract) {
        self.pokemonListRepository = pokemonListRepository
    }
}

extension PokemonListUseCase: PokemonListUseCaseContract {
    func fetch() async throws -> PokemonList {
        let response = try await pokemonListRepository.fetch()
        return .init(from: response)
    }
}
