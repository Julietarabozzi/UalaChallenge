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

    var body: some View {
        VStack(spacing: .spacing12) {
            SearchBar(text: $viewModel.searchText)
                .padding()

            List(viewModel.filteredCities) { city in
                VStack(alignment: .leading, spacing: .spacing8) {
                    Text(city.title)
                        .font(UalaFont.medium(.fontSize14))
                        .foregroundColor(.primary)

                    Text(city.subtitle)
                        .font(UalaFont.light(.fontSize12))
                        .foregroundColor(.textSecondary)
                }
                .padding(.vertical, .padding8)
                .contentShape(Rectangle())
                .onTapGesture {
                    selectedCity = city
                }
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
        }
        .background(Color.backgroundLight)
    }
}
