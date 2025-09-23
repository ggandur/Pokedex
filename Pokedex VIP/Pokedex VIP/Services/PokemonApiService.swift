//
//  PokemonApiService.swift
//  Pokedex VIP
//
//  Created by Gabriel Rocha Gandur on 16/09/25.
//

import Foundation

protocol PokemonApiServiceProtocol {
    func fetchPokemonsList(from url: String) async throws -> PokemonListResponse
    func fetchPokemons(pokemonEntries: [PokemonEntry]) async -> [Pokemon]
}

final class PokemonApiService: PokemonApiServiceProtocol {
        
    func fetchPokemonsList(from url: String) async throws -> PokemonListResponse {
        guard let url = URL(string: url) else {
            throw PokemonListError.networkError(URLError(.badURL))
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            do {
                return try JSONDecoder().decode(PokemonListResponse.self, from: data)
            } catch {
                throw PokemonListError.decodingError(error)
            }
        } catch {
            throw PokemonListError.networkError(error)
        }
    }
    
    func fetchPokemons(pokemonEntries: [PokemonEntry]) async -> [Pokemon] {
        var fetchedPokemons: [Pokemon] = []
        
        for pokemonEntry in pokemonEntries {
            do {
                guard let url = URL(string: pokemonEntry.url) else {
                    print("Invalid URL for entry: \(pokemonEntry)")
                    continue
                }
                
                let (data, _) = try await URLSession.shared.data(from: url)
                let fetchedPokemonData = try JSONDecoder().decode(Pokemon.self, from: data)
                fetchedPokemons.append(fetchedPokemonData)
            } catch {
                print("Failed to fetch \(pokemonEntry.url): \(error)")
            }
        }
        return fetchedPokemons
    }
}
