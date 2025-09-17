//
//  Pokemon.swift
//  Pokedex VIP
//
//  Created by Gabriel Rocha Gandur on 16/09/25.
//

import Foundation

struct PokemonListResponse: Decodable {
    let next: String?
    let results: [Pokemon]
}

struct Pokemon: Decodable {
    let name: String
    let url: String
}

struct PokemonDetails {
    let id: Int
    let sprites: Sprites
}

struct Sprites {
    let front_default: String
}
