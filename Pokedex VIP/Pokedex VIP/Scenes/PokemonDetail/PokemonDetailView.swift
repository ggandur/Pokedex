//
//  PokemonDetailView.swift
//  Pokedex VIP
//
//  Created by Gabriel Rocha Gandur on 16/09/25.
//

import SwiftUI

struct PokemonDetailView: View {
    @EnvironmentObject var router: Router<Path>
    @ObservedObject var data: PokemonDetailData
    
    var body: some View {
        if let pokemon = data.pokemon {
            Text(pokemon.name)
        } else {
            Text("Sem dados de Pokémon")
        }
    }
}

//#Preview {
//    PokemonDetailView()
//}
