//
//  PokemonDetailPresenter.swift
//  Pokedex VIP
//
//  Created by Gabriel Rocha Gandur on 16/10/25.
//

import Foundation

protocol PokemonDetailPresenterProtocol {
    func updateFavorites(pokemon: Pokemon)
}

final class PokemonDetailPresenter: PokemonDetailPresenterProtocol {
    private var data: PokemonDetailData
    
    init(data: PokemonDetailData) {
        self.data = data
    }
    
    func updateFavorites(pokemon: Pokemon) {
        if data.userData.user.favoritePokemons.contains(pokemon) {
            data.userData.user.favoritePokemons.remove(pokemon)
        } else {
            data.userData.user.favoritePokemons.insert(pokemon)
        }
    }
}
