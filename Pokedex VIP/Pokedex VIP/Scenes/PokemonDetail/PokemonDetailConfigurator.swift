//
//  PokemonDetailConfigurator.swift
//  Pokedex VIP
//
//  Created by Gabriel Rocha Gandur on 16/10/25.
//

final class PokemonDetailConfigurator {
    private let data = PokemonDetailData()
    
    func configure(pokemon: Pokemon) -> PokemonDetailView {
        data.pokemon = pokemon
        return PokemonDetailView(data: data)
    }
}
