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
}

final class PokemonDetailData: PokemonDetailDataProtocol, ObservableObject {
    @Published var pokemon: Pokemon?
}
