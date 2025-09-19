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
    var searchText: String { get set }
}

final class PokemonListData: PokemonListDataProtocol, ObservableObject {
    @Published var pokemons: [Pokemon] = []
    @Published var isLoading: Bool = false
    @Published var searchText: String = ""
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
