//
//  RouterView.swift
//  Pokedex VIP
//
//  Created by Gabriel Rocha Gandur on 16/09/25.
//

import SwiftUI

struct RouterView: View {
    @ObservedObject var router = Router<Path>()
    let scenesBuilder: PokedexScenesBuilder
    
    var body: some View {
        NavigationStack(path: $router.paths) {
            scenesBuilder.makePokemonListScene()
                .navigationTitle("Pokédex")
                .navigationDestination(for: Path.self) { path in
                    switch path {
                    case .pokemonList:
                        scenesBuilder.makePokemonListScene()
                            .navigationTitle("Pokédex")

                    case .pokemonDetail(let pokemon):
                        scenesBuilder.makePokemonDetailScene(pokemon: pokemon)
                            .navigationTitle(pokemon.name)
                    }
                }
        }
        .environmentObject(router)
    }
}
