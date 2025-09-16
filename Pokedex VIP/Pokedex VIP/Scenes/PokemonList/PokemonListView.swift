//
//  PokemonListView.swift
//  Pokedex VIP
//
//  Created by Gabriel Rocha Gandur on 16/09/25.
//

import SwiftUI

struct PokemonListView: View {
    @EnvironmentObject var router: Router<Path>
    
    var body: some View {
        VStack {
            Text("PokemonListView")
            Button(
                action: {
                    router.push(.pokemonDetail)
                },
                label: {
                    Text("Go to Pokemon Detail")
                })
        }
    }
}

#Preview {
    PokemonListView()
}
