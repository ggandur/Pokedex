//
//  RouterView.swift
//  Pokedex VIP
//
//  Created by Gabriel Rocha Gandur on 16/09/25.
//

import SwiftUI

struct RouterView: View {
    @ObservedObject var router = Router<Path>()
    let scenes: AppScenes
            
    var body: some View {
        NavigationStack(path: $router.paths) {
            scenes.pokemonListScene
                .navigationTitle("Pokédex")
                .navigationDestination(for: Path.self) { path in
                    switch path {
                    case .pokemonList: scenes.pokemonListScene.navigationTitle("Pokédex")
                    case .pokemonDetail: scenes.pokemonDetailScene.navigationTitle("Pokemon Detail")
                    }
                }
        }.environmentObject(router)
    }
}

//#Preview {
//    RouterView()
//}
