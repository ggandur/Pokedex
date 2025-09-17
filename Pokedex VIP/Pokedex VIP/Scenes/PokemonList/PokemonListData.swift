//
//  PokemonListData.swift
//  Pokedex VIP
//
//  Created by Gabriel Rocha Gandur on 17/09/25.
//

import Foundation
import SwiftUI

protocol PokemonListDataProtocol {
    var pokemons: [Pokemon] { get set }
    var isLoading: Bool { get set }
    var error: PokemonListError? { get set }
}

final class PokemonListData: PokemonListDataProtocol, ObservableObject {
    @Published var pokemons: [Pokemon] = []
    @Published var isLoading: Bool = false
    var error: PokemonListError?
}

enum PokemonListError: Error {
    case networkError(Error)
    case decodingError(Error)
}
