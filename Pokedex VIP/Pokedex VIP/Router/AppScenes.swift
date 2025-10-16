//
//  AppScenes.swift
//  Pokedex VIP
//
//  Created by Gabriel Rocha Gandur on 17/09/25.
//

import Foundation

struct AppScenes {
    let pokemonListScene: PokemonListView

    init(sceneBuilder: PokedexScenesBuilder) {
        self.pokemonListScene = sceneBuilder.makePokemonListScene()
    }
}
