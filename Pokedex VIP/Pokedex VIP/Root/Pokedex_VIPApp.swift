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
    private let assembler: PokedexAppAssembler
    private let scenes: AppScenes

    init() {
        self.assembler = PokedexAppAssembler()
        self.scenes = AppScenes(assembler: assembler)
    }
    
    var body: some Scene {
        WindowGroup {
            RouterView(scenes: scenes)
        }
    }
}
