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
        PokemonListConfigurator().configure()
    }
    
    func makePokemonDetailScene(pokemon: Pokemon) -> PokemonDetailView {
        PokemonDetailConfigurator().configure(pokemon: pokemon)
    }
}
