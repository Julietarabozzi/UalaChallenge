//
//  CitiesListViewModelTests.swift
//  UalaChallengeTests
//
//  Created by Julieta Rabozzi on 16/05/2025.
//

import Foundation
import XCTest
@testable import UalaChallenge

final class CitiesListViewModelTests: XCTestCase {

    var sut: CitiesListViewModel!
    var mockService: MockCityService!
    var mockStorage: MockFavoritesStorage!

    override func setUp() {
        super.setUp()
        mockService = MockCityService()
        mockStorage = MockFavoritesStorage()
        sut = CitiesListViewModel(service: mockService, storage: mockStorage)
    }

    override func tearDown() {
        sut = nil
        mockService = nil
        mockStorage = nil
        super.tearDown()
    }

    func testApplyFilter_whenSearchIsEmpty_thenReturnsAllSorted() {

        let cities = [
            City(id: 1, name: "Zurich", country: "CH", coord: .init(lon: 8.5, lat: 47.3)),
            City(id: 2, name: "Amsterdam", country: "NL", coord: .init(lon: 4.9, lat: 52.3)),
        ]
        sut.searchText = ""
        sut.applyTestCities(cities)
        sut.applyFilter()

        XCTAssertEqual(sut.filteredCities.map(\.title), ["Amsterdam, NL", "Zurich, CH"])
    }

    func testApplyFilter_whenQueryMatchesOne_thenReturnsOnlyThatOne() {

        let cities = [
            City(id: 1, name: "Zurich", country: "CH", coord: .init(lon: 8.5, lat: 47.3)),
            City(id: 2, name: "Amsterdam", country: "NL", coord: .init(lon: 4.9, lat: 52.3)),
        ]
        sut.searchText = "Amst"
        sut.applyTestCities(cities)
        sut.applyFilter()

        XCTAssertEqual(sut.filteredCities.count, 1)
        XCTAssertEqual(sut.filteredCities.first?.title, "Amsterdam, NL")
    }

    func testApplyFilter_whenShowOnlyFavorites_thenFiltersAccordingly() {

        let cities = [
            City(id: 1, name: "Zurich", country: "CH", coord: .init(lon: 8.5, lat: 47.3)),
            City(id: 2, name: "Amsterdam", country: "NL", coord: .init(lon: 4.9, lat: 52.3)),
        ]
        mockStorage.savedFavorites = [2]
        sut = CitiesListViewModel(service: mockService, storage: mockStorage)
        sut.applyTestCities(cities)


        sut.applyFilter(showOnlyFavorites: true)


        XCTAssertEqual(sut.filteredCities.count, 1)
        XCTAssertEqual(sut.filteredCities.first?.id, 2)
    }
}

// MARK: - Mocks

final class MockCityService: CityServiceProtocol {
    func fetchCities() async throws -> [City] {
        return []
    }
}

final class MockFavoritesStorage: FavoritesStorageProtocol {
    var savedFavorites: Set<Int> = []
    
    func getFavorites() -> Set<Int> {
        return savedFavorites
    }

    func saveFavorites(_ favorites: Set<Int>) {
        savedFavorites = favorites
    }
}

// MARK: - Extension for Testing

extension CitiesListViewModel {
    func applyTestCities(_ cities: [City]) {
        self.allCities = cities
    }
}
