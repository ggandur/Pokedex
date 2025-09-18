//
//  PokemonApiService.swift
//  Pokedex VIP
//
//  Created by Gabriel Rocha Gandur on 16/09/25.
//

import Foundation

protocol PokemonApiServiceProtocol {
    func fetchPokemonsList() async throws -> PokemonListResponse
    func fetchPokemons(pokemonEntries: [PokemonEntry]) async throws -> [Pokemon]
    func fetchPokemonImage(url: String) async throws -> Data
}

final class PokemonApiService: PokemonApiServiceProtocol {
    private let constants = ApiServiceConstants()
    
    func fetchPokemonImage(url: String) async throws -> Data {
        let url = URL(string: url)!
        let (data, _) = try await URLSession.shared.data(from: url)
        return data
    }
    
    func fetchPokemonsList() async throws -> PokemonListResponse {
        let url = URL(string: constants.pokeApiUrl)!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(PokemonListResponse.self, from: data)
    }
    
    func fetchPokemons(pokemonEntries: [PokemonEntry]) async throws -> [Pokemon] {
        var pokemons: [Pokemon] = []
        
        for pokemonEntry in pokemonEntries {
            let url = URL(string: pokemonEntry.url)!
            let (data, _) = try await URLSession.shared.data(from: url)
            let pokemonData = try JSONDecoder().decode(Pokemon.self, from: data)
            pokemons.append(pokemonData)
        }
        
        return pokemons
    }
}
