//
//  PokemonApiService.swift
//  Pokedex VIP
//
//  Created by Gabriel Rocha Gandur on 16/09/25.
//

import Foundation

protocol PokemonApiServiceProtocol {
    func fetchPokemons() async throws -> PokemonListResponse
//    func fetchPokemonDetails(id: Int) async throws -> PokemonDetails
//    func fetchPokemonImage(url: String) async throws -> Data
}

final class PokemonApiService: PokemonApiServiceProtocol {
    private let constants = ApiServiceConstants()
//    func fetchPokemonDetails(id: Int) async throws -> PokemonDetails {
//        <#code#>
//    }
//    
//    func fetchPokemonImage(url: String) async throws -> Data {
//        <#code#>
//    }
    
    func fetchPokemons() async throws -> PokemonListResponse {
        let url = URL(string: constants.pokeApiUrl)!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(PokemonListResponse.self, from: data)
    }
}
