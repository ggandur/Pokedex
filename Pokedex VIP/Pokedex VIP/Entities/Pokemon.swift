//
//  Pokemon.swift
//  Pokedex VIP
//
//  Created by Gabriel Rocha Gandur on 16/09/25.
//

import Foundation

struct PokemonListResponse: Decodable {
    let next: String?
    let results: [PokemonEntry]
}

struct PokemonEntry: Decodable, Equatable {
    let name: String
    let url: String
}

struct Pokemon: Decodable, Identifiable {
    let id: Int
    let name: String
    let sprites: Sprites
}

struct Sprites: Decodable {
    let front_default: String
}
