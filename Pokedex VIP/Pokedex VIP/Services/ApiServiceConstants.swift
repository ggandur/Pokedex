//
//  ApiServiceConstants.swift
//  Pokedex VIP
//
//  Created by Gabriel Rocha Gandur on 17/09/25.
//

import Foundation

struct ApiServiceConstants {
    let pokemonFetchLimit: Int = 25
    let pokeApiUrl: String
    
    init() {
        self.pokeApiUrl = "https://pokeapi.co/api/v2/pokemon/?limit=\(pokemonFetchLimit)"
    }
}
