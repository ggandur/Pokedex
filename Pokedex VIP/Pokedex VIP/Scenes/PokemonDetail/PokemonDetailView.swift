//
//  PokemonDetailView.swift
//  Pokedex VIP
//
//  Created by Gabriel Rocha Gandur on 16/09/25.
//

import SwiftUI

struct PokemonDetailView: View {
    @Environment(Router<Path>.self) var router
    @Environment(UserData.self) var userData
    @Bindable var data: PokemonDetailData
    let interactor: PokemonDetailInteractor
    
    var body: some View {
        if let pokemon = data.pokemon {
            VStack {
                AsyncImage(url: URL(string: pokemon.sprites.other.officialArtwork.front_default)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 320)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        interactor.toggleFavorite(pokemon)
                    } label: {
                        Image(systemName: isFavorite(pokemon) ? "heart.fill" : "heart")
                            .foregroundColor(isFavorite(pokemon) ? .red : .primary)
                    }
                    .accessibilityLabel(isFavorite(pokemon) ? "Unfavorite Pokémon" : "Favorite Pokémon")
                }
            }
            Spacer()
        } else {
            Text("Sem dados de Pokémon")
        }
    }
}

#Preview {
    let sceneBuilder = PokedexScenesBuilder()
    sceneBuilder.makePokemonDetailScene(pokemon: Pokemon.mock, userData: UserData.mock)
}

extension PokemonDetailView {
    private func isFavorite(_ pokemon: Pokemon) -> Bool {
        userData.user.favoritePokemons.contains(pokemon)
    }
    
}
