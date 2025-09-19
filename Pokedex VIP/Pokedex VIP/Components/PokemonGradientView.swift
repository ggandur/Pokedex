//
//  PokemonGradientView.swift
//  Pokedex VIP
//
//  Created by Gabriel Rocha Gandur on 18/09/25.
//

import SwiftUI

struct PokemonGradientView: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [
                Color(red: 0.0, green: 0.5, blue: 1.0), // Pokémon Blue
                Color(red: 1.0, green: 0.85, blue: 0.0) // Pokémon Yellow
            ]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
    }
}

#Preview {
    PokemonGradientView()
}
