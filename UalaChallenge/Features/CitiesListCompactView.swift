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
        VStack(spacing: .spacing12) {
            Text(String.citiesListTitle)
                .font(UalaFont.bold(.fontSize40))
                .foregroundColor(.backgroundBlue)
                .padding(.top, .padding12)

            Toggle(isOn: $showOnlyFavorites) {
                Text(String.showFavoritesToggleLabel)
                    .font(UalaFont.medium(.fontSize14))
                    .foregroundColor(.textsecondary)
            }
            .toggleStyle(SwitchToggleStyle(tint: .accentRed))
            .padding(.horizontal, .padding16)
            .onChange(of: showOnlyFavorites) {
                viewModel.applyFilter(showOnlyFavorites: showOnlyFavorites)
            }

            SearchBar(text: $viewModel.searchText)
                .padding(.horizontal, .padding16)

            List(viewModel.filteredCities) { city in
                VStack(alignment: .leading, spacing: .spacing8) {
                    Text(city.title)
                        .font(UalaFont.medium(.fontSize14))
                        .foregroundColor(.primary)

                    Text(city.subtitle)
                        .font(UalaFont.light(.fontSize12))
                        .foregroundColor(.textSecondary)

                    HStack {
                        Button {
                            selectedCity = city
                            detailMode = .map
                        } label: {
                            Text("Ver en mapa")
                                .font(UalaFont.regular(.fontSize14))
                        }
                        .buttonStyle(.cityInfoStyle())

                        Button {
                            selectedCity = city
                            detailMode = .info
                        } label: {
                            Text("+ Info")
                                .font(UalaFont.regular(.fontSize14))
                        }
                        .buttonStyle(.cityInfoStyle())
                    }
                }
                .padding(.vertical, .padding8)
                .contentShape(Rectangle())
                .overlay(alignment: .topTrailing) {
                    Button(action: {
                        viewModel.toggleFavorite(id: city.id)
                    }) {
                        (city.isFavorite ? Image.starfill : Image.star)
                            .foregroundColor(city.isFavorite ? .accentRed : .gray)
                            .imageScale(.medium)
                    }
                    .buttonStyle(BorderlessButtonStyle())
                    .padding(.top, .padding4)
                }
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
        }
        .background(Color.backgroundLight)
    }
}
