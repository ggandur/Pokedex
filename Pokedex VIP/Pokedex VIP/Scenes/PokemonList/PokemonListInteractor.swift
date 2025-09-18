//
//  PokemonListInteractor.swift
//  Pokedex VIP
//
//  Created by Gabriel Rocha Gandur on 17/09/25.
//

import Foundation

protocol PokemonListInteractorProtocol {
    func fetchPokemons() async
}

final class PokemonListInteractor: PokemonListInteractorProtocol {
    private let presenter: PokemonListPresenterProtocol
    private let apiService: PokemonApiServiceProtocol
    
    init(presenter: PokemonListPresenterProtocol, apiService: PokemonApiServiceProtocol) {
        self.presenter = presenter
        self.apiService = apiService
    }
    
    @MainActor
    func fetchPokemons() async {
        presenter.updateLoading(true)

        do {
            let response = try await apiService.fetchPokemonsList()
            let pokemons = try await apiService.fetchPokemons(pokemonEntries: response.results)
            presenter.didFetchPokemons(pokemons: pokemons)
        } catch let decodingError as DecodingError {
            presenter.updateError(.decodingError(decodingError))
        } catch {
            presenter.updateError(.networkError(error))
        }
        
        presenter.updateLoading(false)
    }
}
