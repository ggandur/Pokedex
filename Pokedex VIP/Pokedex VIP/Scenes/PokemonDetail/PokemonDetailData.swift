//
//  PokemonDetailData.swift
//  Pokedex VIP
//
//  Created by Gabriel Rocha Gandur on 16/10/25.
//

import Foundation
import SwiftUI

protocol PokemonDetailDataProtocol {
    var pokemon: Pokemon? { get set }
    var userData: UserData? { get set }
}

@Observable
final class PokemonDetailData: PokemonDetailDataProtocol {
    var pokemon: Pokemon?
    var userData: UserData?
    
    init(pokemon: Pokemon? = nil) {
        self.pokemon = pokemon
    }
}
