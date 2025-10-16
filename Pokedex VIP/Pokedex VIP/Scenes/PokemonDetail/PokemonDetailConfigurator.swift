//
//  PokemonDetailConfigurator.swift
//  Pokedex VIP
//
//  Created by Gabriel Rocha Gandur on 16/10/25.
//

final class PokemonDetailConfigurator {
    private var pokemon: Pokemon
    private var userData: UserData
    
    init(pokemon: Pokemon, userData: UserData) {
        self.pokemon = pokemon
        self.userData = userData
    }
    
    private lazy var data: PokemonDetailData = .init(pokemon: pokemon, userData: userData)
    
    private lazy var presenter: PokemonDetailPresenter = .init(data: data)
    
    private lazy var interactor: PokemonDetailInteractor = .init(presenter: presenter)
    
    func configure() -> PokemonDetailView {
        return PokemonDetailView(data: data, interactor: interactor)
    }
}
