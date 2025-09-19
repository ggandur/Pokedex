//
//  Pokemon.swift
//  Pokedex VIP
//
//  Created by Gabriel Rocha Gandur on 16/09/25.
//

import Foundation

struct PokemonListResponse: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [PokemonEntry]
    
    var hasNextPage: Bool {
        return next != nil
    }
}

struct PokemonEntry: Decodable, Equatable {
    let name: String
    let url: String
}

struct Pokemon: Decodable, Identifiable, Equatable {
    let id: Int
    let name: String
    let sprites: Sprites
}

struct Sprites: Decodable, Equatable {
    let front_default: String
}
