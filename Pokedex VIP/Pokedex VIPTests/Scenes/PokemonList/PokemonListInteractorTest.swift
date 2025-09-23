//
//  PokemonListInteractorTest.swift
//  Pokedex VIPTests
//
//  Created by Gabriel Rocha Gandur on 22/09/25.
//

import Testing
@testable import Pokedex_VIP

struct PokemonListInteractorTest {
    @Test("Interactor Did Fetch Pokemons Success")
    func testFetchPokemonsSuccess() async throws {
        let presenterSpy = PokemonListPresenterSpy()
        let apiServiceStub = PokemonApiServiceStub()
        let sut = PokemonListInteractor(presenter: presenterSpy, apiService: apiServiceStub)

        await sut.fetchPokemons()
        
        #expect(presenterSpy.didUpdateLoading)
        #expect(!presenterSpy.didUpdateError)
    }

    @Test("Interactor Did Handle Network Error")
    func testFetchPokemonsNetworkError() async throws {
        let presenterSpy = PokemonListPresenterSpy()
        let apiServiceStub = PokemonApiServiceStubNetworkError()
        let sut = PokemonListInteractor(presenter: presenterSpy, apiService: apiServiceStub)
        
        await sut.fetchPokemons()
        
        #expect(presenterSpy.didUpdateError)
        #expect(presenterSpy.didUpdateLoading)
    }

    @Test("Interactor Did Handle Decoding Error")
    func testFetchPokemonsDecodingError() async throws {
        let presenterSpy = PokemonListPresenterSpy()
        let apiServiceStub = PokemonApiServiceStubDecodingError()
        let sut = PokemonListInteractor(presenter: presenterSpy, apiService: apiServiceStub)
        
        await sut.fetchPokemons()
        
        #expect(presenterSpy.didUpdateError)
        #expect(presenterSpy.didUpdateLoading)
    }
}
