//
//  PokedexAppAssembler.swift
//  Pokedex VIP
//
//  Created by Gabriel Rocha Gandur on 17/09/25.
//

import Foundation
import SwiftUI

struct PokedexScenesBuilder {
    func makePokemonListScene() -> PokemonListView {
        let pokemonListConfigurator = PokemonListConfigurator()
        return pokemonListConfigurator.configure()
    }
    
    func makePokemonDetailScene(pokemon: Pokemon, userData: UserData) -> PokemonDetailView {
        let pokemonDetailConfigurator = PokemonDetailConfigurator(pokemon: pokemon,
                                                                  userData: userData)
        return pokemonDetailConfigurator.configure()
    }
}
