//
//  Router.swift
//  Pokedex VIP
//
//  Created by Gabriel Rocha Gandur on 16/09/25.
//

import Foundation
import SwiftUI

enum Path {
    case pokemonList
    case pokemonDetail
}

final class Router<T: Hashable>: ObservableObject {
    @Published var paths: [T] = []
    
    func push(_ path: T) {
        paths.append(path)
    }
    
    func pop() {
        paths.removeLast()
    }
}
