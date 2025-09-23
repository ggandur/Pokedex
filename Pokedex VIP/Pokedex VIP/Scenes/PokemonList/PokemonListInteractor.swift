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
    
    private var nextUrl: String? = ApiServiceConstants().pokeApiUrl
    
    init(presenter: PokemonListPresenterProtocol, apiService: PokemonApiServiceProtocol) {
        self.presenter = presenter
        self.apiService = apiService
    }
    
    @MainActor
    func fetchPokemons() async {
        
        guard let url = nextUrl else {
            return
        }
        
        presenter.updateLoading(true)
                    
        do {
            let response = try await apiService.fetchPokemonsList(from: url)
            let pokemons = await apiService.fetchPokemons(pokemonEntries: response.results)
            presenter.didFetchPokemons(pokemons: pokemons)
            nextUrl = response.next
        } catch let decodingError as DecodingError {
            presenter.updateError(.decodingError(decodingError))
        } catch {
            presenter.updateError(.networkError(error))
        }
        presenter.updateLoading(false)
    }
}
