//
//  CitiesListCompactView.swift
//  UalaChallenge
//
//  Created by Julieta Rabozzi on 16/05/2025.
//

import Foundation
import SwiftUI

struct CitiesListCompactView: View {
    @ObservedObject var viewModel: CitiesListViewModel
    @Binding var selectedCity: CityViewData?
    @Binding var detailMode: CityDetailDisplayMode
    @State private var showOnlyFavorites = false

    var body: some View {
        CitiesListContentView(
            viewModel: viewModel,
            onCityTap: { city in
                selectedCity = city
                detailMode = .map
            },
            onInfoTap: { city in
                selectedCity = city
                detailMode = .info
            },
            showCompactStyle: true,
            showOnlyFavorites: $showOnlyFavorites
        )
    }
}
