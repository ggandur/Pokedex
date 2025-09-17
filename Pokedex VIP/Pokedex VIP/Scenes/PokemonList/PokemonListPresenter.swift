//
//  PokemonListPresenter.swift
//  Pokedex VIP
//
//  Created by Gabriel Rocha Gandur on 17/09/25.
//

import Foundation

protocol PokemonListPresenterProtocol {
//    func didSelect(pokemon: Pokemon)
    func didFetchPokemons(pokemons: [Pokemon])
    func updateLoading(_ isLoading: Bool)
    func updateError(_ error: PokemonListError?)
}

final class PokemonListPresenter: PokemonListPresenterProtocol {
    private var data: PokemonListDataProtocol
    
    init(data: PokemonListDataProtocol) {
        self.data = data
    }
    
    func didFetchPokemons(pokemons: [Pokemon]) {
        data.pokemons.append(contentsOf: pokemons)
    }
    
    func updateLoading(_ isLoading: Bool) {
        data.isLoading = isLoading
    }
    
    func updateError(_ error: PokemonListError?) {
        data.error = error
    }
}
