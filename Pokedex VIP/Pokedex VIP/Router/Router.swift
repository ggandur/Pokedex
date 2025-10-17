//
//  Router.swift
//  Pokedex VIP
//
//  Created by Gabriel Rocha Gandur on 16/09/25.
//

import Foundation
import SwiftUI

enum Path: Hashable {
    case pokemonList
    case pokemonDetail(Pokemon)
}

@Observable
final class Router<Path: Hashable> {
    var paths: [Path] = []
    
    func push(_ path: Path) {
        paths.append(path)
    }
    
    func pop() {
        paths.removeLast()
    }
}
