//
//  CitiesList.swift
//  UalaCities
//
//  Created by Julieta Rabozzi on 11/05/2025.
//

import Foundation
import Combine

final class CitiesListViewModel: ObservableObject {

    @Published var searchText: String = ""
    
    @Published private(set) var filteredCities: [CityViewData] = []
    @Published private(set) var isLoading: Bool = false
    
    private let service: CityServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    private var favorites: Set<Int> = []
    private let storage: FavoritesStorageProtocol
    var allCities: [City] = []
    
    init(service: CityServiceProtocol, storage: FavoritesStorageProtocol = FavoritesStorage()) {
        self.service = service
        self.storage = storage
        self.favorites = storage.getFavorites()
        bindSearch()
    }

    func fetchCities() {
        isLoading = true
        Task {
            do {
                let cities = try await service.fetchCities()
                await MainActor.run {
                    self.allCities = cities
                    self.applyFilter()
                    self.isLoading = false
                }
            } catch {

                await MainActor.run {
                    self.isLoading = false
                }
            }
        }
    }

    private func bindSearch() {
        $searchText
            .removeDuplicates()
            .debounce(for: .milliseconds(300), scheduler: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.applyFilter()
            }
            .store(in: &cancellables)
    }

     func applyFilter(showOnlyFavorites: Bool = false) {
        let query = searchText.lowercased()
        let result = allCities
            .filter { query.isEmpty || $0.name.lowercased().hasPrefix(query) }
            .filter { !showOnlyFavorites || favorites.contains($0.id) }
            .sorted { $0.name < $1.name }
            .map { city in
                CityViewData(
                    id: city.id,
                    title: "\(city.name), \(city.country)",
                    subtitle: "Lat: \(city.coord.lat), Lon: \(city.coord.lon)",
                    isFavorite: favorites.contains(city.id),
                    coordinate: (city.coord.lat, city.coord.lon)
                )
            }

        filteredCities = result
    }


    func toggleFavorite(id: Int) {
        if favorites.contains(id) {
            favorites.remove(id)
        } else {
            favorites.insert(id)
        }
        storage.saveFavorites(favorites)
        applyFilter()
    }
}
