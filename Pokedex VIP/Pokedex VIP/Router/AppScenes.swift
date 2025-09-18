//
//  AppScenes.swift
//  Pokedex VIP
//
//  Created by Gabriel Rocha Gandur on 17/09/25.
//

import Foundation

struct AppScenes {
    let pokemonListScene: PokemonListView
    let pokemonDetailScene: PokemonDetailView

    init(assembler: PokedexAppAssembler) {
        self.pokemonListScene = assembler.makePokemonListScene()
        self.pokemonDetailScene = PokemonDetailView()
    }
}
