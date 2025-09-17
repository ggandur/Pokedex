//
//  PokemonListView.swift
//  Pokedex VIP
//
//  Created by Gabriel Rocha Gandur on 16/09/25.
//

import SwiftUI

struct PokemonListView: View {
    @EnvironmentObject var router: Router<Path>
    @ObservedObject var data: PokemonListData
    let interactor: PokemonListInteractorProtocol
    
    var body: some View {
        VStack {
            Text("Pokémon List")
                .font(.headline)
            List(data.pokemons, id: \.name) { pokemon in
                Button {
                    print("\(pokemon.name) selected")
                    router.push(.pokemonDetail)
                } label: {
                    Text(pokemon.name.capitalized)
                }
            }
        }
        .overlay {
            if data.isLoading {
                ProgressView()
            }
        }
        .onAppear {
            Task {
                if data.pokemons.isEmpty {
                    await interactor.fetchPokemons()
                }
            }
        }
    }
}

//#Preview {
//    PokemonListView()
//}
