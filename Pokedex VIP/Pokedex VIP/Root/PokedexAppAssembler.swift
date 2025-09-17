//
//  PokedexAppAssembler.swift
//  Pokedex VIP
//
//  Created by Gabriel Rocha Gandur on 17/09/25.
//

import Foundation
import SwiftUI

struct PokedexAppAssembler {
    func makePokemonListScene() -> PokemonListView {
        PokemonListConfigurator().configure()
    }
}
