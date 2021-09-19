import Combine
import Domain

@MainActor
public final class PokemonListViewModel: ObservableObject {
    private let pokemonListUseCase: PokemonListUseCaseContract

    @Published private(set) var pokemons = [Pokemon]()

    public init(pokemonListUseCase: PokemonListUseCaseContract) {
        self.pokemonListUseCase = pokemonListUseCase
    }

    func fetchPokemons() async {
        do {
            pokemons = try await pokemonListUseCase.fetch().pokemons
        } catch {
            debugPrint(error)
        }
    }
}
