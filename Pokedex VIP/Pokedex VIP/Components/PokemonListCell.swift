//
//  PokemonListCell.swift
//  Pokedex VIP
//
//  Created by Gabriel Rocha Gandur on 18/09/25.
//

import SwiftUI

struct PokemonListCell: View {
    @Environment(UserData.self) var userData
    let pokemon: Pokemon
    
    init(pokemon: Pokemon) {
        self.pokemon = pokemon
    }
    
    var body: some View {
        HStack {
            if let pokemonSpriteUrl = pokemon.sprites.front_default {
                AsyncImage(url: URL(string: pokemonSpriteUrl)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                } placeholder: {
                    ProgressView()
                        .frame(width: 64)
                }
                .frame(height: 64)
                
            } else {
                Image("pokeball_8bit")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(height: 64)
            }
            Text(pokemon.name.capitalized)
                .padding()
            Spacer()
            
            if userData.user.favoritePokemons.contains(pokemon) {
                Image(systemName: "heart.fill").foregroundColor(.red)
                    .padding()
            }

        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    PokemonListCell(pokemon: Pokemon.mock)
}
