//
//  PokemonListDataDummy.swift
//  Pokedex VIPTests
//
//  Created by Gabriel Rocha Gandur on 22/09/25.
//

import Foundation

@testable import Pokedex_VIP
extension PokemonListData {
    func getDummy() -> PokemonListData {
        return PokemonListData()
    }
    
    func getDummyPokemonList() -> [Pokemon] {        
        let dummyPokemonsList = [
            Pokemon(id: 25, name: "Pikachu", sprites: Sprites(front_default: nil)),
            Pokemon(id: 25, name: "Pikachu", sprites: Sprites(front_default: nil)),
            Pokemon(id: 25, name: "Pikachu", sprites: Sprites(front_default: nil)),
            Pokemon(id: 25, name: "Pikachu", sprites: Sprites(front_default: nil)),
            Pokemon(id: 25, name: "Pikachu", sprites: Sprites(front_default: nil))
        ]
        
        return dummyPokemonsList
    }
}
