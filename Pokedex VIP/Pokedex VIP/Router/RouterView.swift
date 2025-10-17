//
//  RouterView.swift
//  Pokedex VIP
//
//  Created by Gabriel Rocha Gandur on 16/09/25.
//

import SwiftUI

struct RouterView: View {
    @Environment(Router<Path>.self) var router
    @Environment(UserData.self) var userData
    
    let scenesBuilder: PokedexScenesBuilder
    let scenes: AppScenes
    
    var body: some View {
        @Bindable var router = router
        
        NavigationStack(path: $router.paths) {
            scenes.pokemonListScene
                .navigationTitle("Pokédex")
                .navigationDestination(for: Path.self) { path in
                    switch path {
                    case .pokemonList:
                        scenes.pokemonListScene
                            .navigationTitle("Pokédex")
                        
                    case .pokemonDetail(let pokemon):
                        scenesBuilder.makePokemonDetailScene(pokemon: pokemon, userData: userData)
                        .navigationTitle(pokemon.name.capitalized)
                    }
                }
        }
    }
}
