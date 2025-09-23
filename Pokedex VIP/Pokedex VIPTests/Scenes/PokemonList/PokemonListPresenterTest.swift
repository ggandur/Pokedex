//
//  PokemonListPresenterTest.swift
//  Pokedex VIPTests
//
//  Created by Gabriel Rocha Gandur on 22/09/25.
//

import Testing
@testable import Pokedex_VIP

struct PokemonListPresenterTest {
    
    private var dataStub: PokemonListData!
    private var sut: PokemonListPresenter!

    init() {
        dataStub = PokemonListData().getDummy()
        sut = PokemonListPresenter(data: dataStub)
    }

    @Test("Presenter Did Fetch Pokemons Success") func testFetchPokemons() async throws {
        let initialPokemonsCount = dataStub.pokemons.count
        sut.didFetchPokemons(pokemons: dataStub.getDummyPokemonList())
        #expect(dataStub.pokemons.count == initialPokemonsCount + 5)
    }    
}
