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

struct Pokemon: Codable, Identifiable, Equatable, Hashable {
    let id: Int
    let name: String
    let sprites: Sprites
}

struct Sprites: Codable, Equatable, Hashable {
    let front_default: String?
    let other: Other
}

struct Other: Codable, Equatable, Hashable {
    let officialArtwork: OfficialArtwork

    private enum CodingKeys: String, CodingKey {
        case officialArtwork = "official-artwork"
    }
}

struct OfficialArtwork: Codable, Equatable, Hashable {
    let front_default: String
}
