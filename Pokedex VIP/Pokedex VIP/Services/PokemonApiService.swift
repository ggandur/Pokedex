//
//  PokemonApiService.swift
//  Pokedex VIP
//
//  Created by Gabriel Rocha Gandur on 16/09/25.
//

import Foundation

protocol PokemonApiServiceProtocol {
    func fetchPokemonsList(from url: String) async throws -> PokemonListResponse
    func fetchPokemons(pokemonEntries: [PokemonEntry]) async throws -> [Pokemon]
}

final class PokemonApiService: PokemonApiServiceProtocol {
    private let constants = ApiServiceConstants()
    private lazy var requestUrl = constants.pokeApiUrl
    private var shouldMakeMoreRequests: Bool = true
        
    func fetchPokemonsList(from url: String) async throws -> PokemonListResponse {
        let url = URL(string: url)!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(PokemonListResponse.self, from: data)
    }
    
    func fetchPokemons(pokemonEntries: [PokemonEntry]) async throws -> [Pokemon] {
        var fetchedPokemons: [Pokemon] = []
        
        for pokemonEntry in pokemonEntries {
            let url = URL(string: pokemonEntry.url)!
            let (data, _) = try await URLSession.shared.data(from: url)
            let fetchedPokemonData = try JSONDecoder().decode(Pokemon.self, from: data)
            fetchedPokemons.append(fetchedPokemonData)
        }
        
        return fetchedPokemons
    }
}
