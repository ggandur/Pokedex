//
//  RouterView.swift
//  Pokedex VIP
//
//  Created by Gabriel Rocha Gandur on 16/09/25.
//

import SwiftUI

struct RouterView: View {
    @ObservedObject var router = Router<Path>()
    
    var body: some View {
        NavigationStack(path: $router.paths) {
            PokemonListView()
                .navigationDestination(for: Path.self) { path in
                    switch path {
                    case .pokemonList: PokemonListView()
                    case .pokemonDetail: PokemonDetailView()
                    }
                }
        }.environmentObject(router)
    }
}

#Preview {
    RouterView()
}
