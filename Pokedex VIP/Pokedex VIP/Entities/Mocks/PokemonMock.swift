//
//  PokemonMock.swift
//  Pokedex VIP
//
//  Created by Gabriel Rocha Gandur on 16/10/25.
//

import Foundation

extension Pokemon {
    static let mock = Pokemon(
        id: 9,
        name: "Blastoise",
        sprites: Sprites(
            front_default: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/9.png",
            other: Other(
                officialArtwork: OfficialArtwork(
                    front_default: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/9.png"
                )
            )
        )
    )
}
