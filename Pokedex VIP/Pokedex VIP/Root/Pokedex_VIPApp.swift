//
//  Pokedex_VIPApp.swift
//  Pokedex VIP
//
//  Created by Gabriel Rocha Gandur on 16/09/25.
//

import SwiftUI
import SwiftData

@main
struct Pokedex_VIPApp: App {
    private let scenesBuilder: PokedexScenesBuilder
    private let scenes: AppScenes

    init() {
        self.scenesBuilder = PokedexScenesBuilder()
        self.scenes = AppScenes(sceneBuilder: scenesBuilder)
    }
    
    var body: some Scene {
        WindowGroup {
            RouterView(scenesBuilder: scenesBuilder, scenes: scenes)
        }
    }
}
