import Domain
import SwiftUI

struct PokemonDetailView: View {
    @StateObject private var viewModel: PokemonDetailViewModel

    init(viewModel: PokemonDetailViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        Text(String(describing: type(of: self)))
    }
}

struct PokemonDetailIView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(viewModel: .init(pokemonDetailUseCase: PokemonDetailUseCaseProvider.provide()))
    }
}
