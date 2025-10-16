//
//  UserData.swift
//  Pokedex VIP
//
//  Created by Gabriel Rocha Gandur on 16/10/25.
//

import Foundation

@Observable
final class UserData {
    var user: User
    
    init(user: User) {
        self.user = user
    }
}

struct User: Hashable, Codable {
    var name: String
    var favoritePokemons: Set<Pokemon> = []
}
