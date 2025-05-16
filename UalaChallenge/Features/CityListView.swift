//
//  CityListView.swift
//  UalaCities
//
//  Created by Julieta Rabozzi on 11/05/2025.
//

import Foundation
import SwiftUI

struct CitiesListView: View {
    @ObservedObject var viewModel: CitiesListViewModel
    @StateObject var router = CitiesRouterImpl()
    @State private var showOnlyFavorites = false

    var body: some View {
        NavigationStack(path: $router.routes) {
            CitiesListContentView(
                viewModel: viewModel,
                onCityTap: { city in router.push(.cityMap(city: city)) },
                onInfoTap: { city in router.push(.cityDetails(city: city)) },
                showCompactStyle: false,
                showOnlyFavorites: $showOnlyFavorites
            )
            .navigationDestination(for: CitiesRoutes.self) { $0.destination }
        }
    }
}
