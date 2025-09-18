//
//  PokemonListInteractor.swift
//  Pokedex VIP
//
//  Created by Gabriel Rocha Gandur on 17/09/25.
//

import Foundation

protocol PokemonListInteractorProtocol {
    func fetchPokemons() async
    func fetchSprite(id: Int) async
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
            let response = try await apiService.fetchPokemons()
            presenter.didFetchPokemons(pokemons: response.results)
        } catch let decodingError as DecodingError {
            presenter.updateError(.decodingError(decodingError))
        } catch {
            presenter.updateError(.networkError(error))
        }
        
        presenter.updateLoading(false)
    }
    
    @MainActor
    func fetchSprite(id: Int) async {
        do {
            let sprite = try await apiService.fetchPokemonImage(id: id)
        } catch {
            print("Error fetching sprite for id: \(id)")
        }
    }
}
