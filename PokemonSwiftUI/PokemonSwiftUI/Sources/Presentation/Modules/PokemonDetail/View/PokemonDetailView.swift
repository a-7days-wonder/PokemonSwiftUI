import Domain
import SwiftUI

public struct PokemonDetailView: View {
    @StateObject private var viewModel: PokemonDetailViewModel

    public init(viewModel: PokemonDetailViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    public var body: some View {
        Text(String(describing: type(of: self)))
    }
}

struct PokemonDetailIView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(viewModel: .init(pokemonDetailUseCase: PokemonDetailUseCaseProvider.provide()))
    }
}
