//
//  PokemonListData.swift
//  Pokedex VIP
//
//  Created by Gabriel Rocha Gandur on 17/09/25.
//

import Foundation
import SwiftUI
import Observation

protocol PokemonListDataProtocol {
    var pokemons: [Pokemon] { get set }
    var isLoading: Bool { get set }
    var error: PokemonListError? { get set }
    var searchText: String { get set }
}

@Observable
final class PokemonListData: PokemonListDataProtocol {
    var pokemons: [Pokemon] = []
    var isLoading: Bool = false
    var searchText: String = ""
    var error: PokemonListError?
    var filteredPokemons: [Pokemon] {
        if searchText.isEmpty { return pokemons }
        return pokemons.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
    }
}

enum PokemonListError: Error {
    case networkError(Error)
    case decodingError(Error)
}
