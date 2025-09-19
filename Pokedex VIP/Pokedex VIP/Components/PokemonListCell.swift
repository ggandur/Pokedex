//
//  PokemonListCell.swift
//  Pokedex VIP
//
//  Created by Gabriel Rocha Gandur on 18/09/25.
//

import SwiftUI

struct PokemonListCell: View {
    let pokemon: Pokemon
    
    init(pokemon: Pokemon) {
        self.pokemon = pokemon
    }
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: pokemon.sprites.front_default)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
            } placeholder: {
                ProgressView()
            }
            .frame(height: 64)
            Text(pokemon.name.capitalized)
                .padding()
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    PokemonListCell(pokemon: Pokemon(id: 25, name: "pikachu", sprites: Sprites(front_default: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png")))
}
