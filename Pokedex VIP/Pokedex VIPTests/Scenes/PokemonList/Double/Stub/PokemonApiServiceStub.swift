//
//  ApiServiceStub.swift
//  Pokedex VIPTests
//
//  Created by Gabriel Rocha Gandur on 23/09/25.
//

import Testing
import SwiftUI
@testable import Pokedex_VIP

final class PokemonApiServiceStub: PokemonApiServiceProtocol {
    func fetchPokemonsList(from url: String) async throws -> PokemonListResponse {
        return PokemonListResponse(count: 2,
                                   next: "Next URL",
                                   previous: nil,
                                   results: [PokemonEntry(name: "Pikachu",
                                                          url: "https://pokeapi.co/api/v2/pokemon/25/"),
                                             PokemonEntry(name: "Charizard",
                                                          url: "https://pokeapi.co/api/v2/pokemon/6/")])
    }
    
    func fetchPokemons(pokemonEntries: [PokemonEntry]) async -> [Pokemon] {
        return [Pokemon(id: 25,
                        name:  "Pikachu",
                        sprites: Sprites(front_default: "Pikachu sprite Url")),
                Pokemon(id: 25,
                        name:  "Charizard",
                        sprites: Sprites(front_default: "Charizard sprite Url"))]
    }
}

final class PokemonApiServiceStubNetworkError: PokemonApiServiceProtocol {
    func fetchPokemonsList(from url: String) async throws -> PokemonListResponse {
        throw URLError(.badURL)
    }
    
    func fetchPokemons(pokemonEntries: [PokemonEntry]) async -> [Pokemon] {
        return []
    }
}

final class PokemonApiServiceStubDecodingError: PokemonApiServiceProtocol {
    func fetchPokemonsList(from url: String) async throws -> PokemonListResponse {
        throw DecodingError.dataCorrupted(
            DecodingError.Context(codingPath: [], debugDescription: "Invalid data")
        )
    }
    
    func fetchPokemons(pokemonEntries: [PokemonEntry]) async -> [Pokemon] {
        return []
    }
}
