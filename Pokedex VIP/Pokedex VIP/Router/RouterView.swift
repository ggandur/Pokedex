//
//  RouterView.swift
//  Pokedex VIP
//
//  Created by Gabriel Rocha Gandur on 16/09/25.
//

import SwiftUI

struct RouterView: View {
    @State var router = Router<Path>()
    @State var userData = UserData(user: User(name: "Gandur"))
    let scenesBuilder: PokedexScenesBuilder
    let scenes: AppScenes
    
    var body: some View {
        NavigationStack(path: $router.paths) {
            scenes.pokemonListScene
                .navigationTitle("Pokédex")
                .navigationDestination(for: Path.self) { path in
                    switch path {
                    case .pokemonList:
                        scenes.pokemonListScene
                            .navigationTitle("Pokédex")

                    case .pokemonDetail(let pokemon):
                        scenesBuilder.makePokemonDetailScene(pokemon: pokemon)
                            .navigationTitle(pokemon.name.capitalized)
                    }
                }
        }
        .environment(router)
        .environment(userData)
    }
}
