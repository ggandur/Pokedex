//
//  PokemonListPresenterSpy.swift
//  Pokedex VIPTests
//
//  Created by Gabriel Rocha Gandur on 23/09/25.
//

import Testing
@testable import Pokedex_VIP

final class PokemonListPresenterSpy: PokemonListPresenterProtocol {
    var didUpdateLoading = false
    var didUpdateError = false
    
    func didFetchPokemons(pokemons: [Pokemon]) {
        
    }
    
    func updateLoading(_ isLoading: Bool) {
        self.didUpdateLoading = true
    }
    
    func updateError(_ error: PokemonListError?) {
        self.didUpdateError = true
    }
}
