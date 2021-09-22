import Combine
import Domain

@MainActor
final class PokemonListViewModel: ObservableObject {
    private let pokemonListUseCase: PokemonListUseCaseContract

    private var count = 0
    @Published private(set) var pokemons = [Pokemon]()
    var canFetchMore: Bool {
        pokemons.count < count
    }

    init(pokemonListUseCase: PokemonListUseCaseContract) {
        self.pokemonListUseCase = pokemonListUseCase
    }

    func fetchPokemons() async {
        do {
            let result = try await pokemonListUseCase.fetch(offset: 0)
            pokemons = result.pokemons
            count = result.count
        } catch {
            debugPrint(error)
        }
    }

    func fetchMore() async {
        do {
            let result = try await pokemonListUseCase.fetch(offset: pokemons.count)
            pokemons.append(contentsOf: result.pokemons)
        } catch {
            debugPrint(error)
        }
    }
}
