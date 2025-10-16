//
//  PokemonDetailConfigurator.swift
//  Pokedex VIP
//
//  Created by Gabriel Rocha Gandur on 16/10/25.
//

final class PokemonDetailConfigurator {
    private var data = PokemonDetailData()
    
    private lazy var presenter: PokemonDetailPresenter = .init(data: data)
    
    private lazy var interactor: PokemonDetailInteractor = .init(presenter: presenter)
    
    func configure(pokemon: Pokemon) -> PokemonDetailView {
        data.pokemon = pokemon
        return PokemonDetailView(data: data, interactor: interactor)
    }
}
