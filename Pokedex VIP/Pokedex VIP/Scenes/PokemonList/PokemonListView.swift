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
    @State var searchText: String = ""
    let interactor: PokemonListInteractorProtocol
    
    var body: some View {
        List {
            ForEach(data.filteredPokemons) { pokemon in
                Button {
                    print("\(pokemon.name) selected")
                    router.push(.pokemonDetail)
                } label: {
                    PokemonListCell(pokemon: pokemon)
                }
                .listRowInsets(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
                .buttonStyle(.glass)
                .onAppear {
                    Task {
                        if pokemon == data.pokemons.last && !data.isLoading {
                            await interactor.fetchPokemons()
                        }
                    }
                }
            }            
        }
        .searchable(text: $data.searchText, prompt: "Search Pokémon")
        .listStyle(.plain)
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

#Preview {
    let assembler = PokedexAppAssembler()
    assembler.makePokemonListScene()
}
