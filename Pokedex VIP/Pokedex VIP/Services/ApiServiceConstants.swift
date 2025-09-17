//
//  ApiServiceConstants.swift
//  Pokedex VIP
//
//  Created by Gabriel Rocha Gandur on 17/09/25.
//

import Foundation

struct ApiServiceConstants {
    let pokemonFetchLimit: Int = 100
    let spritesUrl = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/"
    let pokeApiUrl: String
    
    init() {
        self.pokeApiUrl = "https://pokeapi.co/api/v2/pokemon/?limit=\(pokemonFetchLimit)"
    }
}
