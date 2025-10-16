//
//  PokemonDetailInteractor.swift
//  Pokedex VIP
//
//  Created by Gabriel Rocha Gandur on 16/10/25.
//

import Foundation

protocol PokemonDetailInteractorProtocol {
    func toggleFavorite(_ pokemon: Pokemon)
}

final class PokemonDetailInteractor: PokemonDetailInteractorProtocol {
    private let presenter: PokemonDetailPresenterProtocol
    
    init(presenter: PokemonDetailPresenterProtocol) {
        self.presenter = presenter
    }
    
    func toggleFavorite(_ pokemon: Pokemon) {
        presenter.updateFavorites(pokemon: pokemon)
    }
}
