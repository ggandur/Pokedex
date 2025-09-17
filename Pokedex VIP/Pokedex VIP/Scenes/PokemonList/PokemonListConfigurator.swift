//
//  PokemonListConfigurator.swift
//  Pokedex VIP
//
//  Created by Gabriel Rocha Gandur on 17/09/25.
//

import Foundation

final class PokemonListConfigurator {
    private let data = PokemonListData()
    
    private lazy var presenter: PokemonListPresenter = {
        .init(data: data)
    }()
    
    private lazy var interactor: PokemonListInteractor = {
        .init(
            presenter: presenter,
            apiService: PokemonApiService())
    }()
    
    func configure() -> PokemonListView {
        .init(data: self.data, interactor: self.interactor)
    }
}
