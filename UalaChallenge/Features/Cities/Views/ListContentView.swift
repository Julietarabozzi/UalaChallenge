//
//  ListContentView.swift
//  UalaChallenge
//
//  Created by Julieta Rabozzi on 16/05/2025.
//

import Foundation
import SwiftUI

struct CitiesListContentView: View {
    @ObservedObject var viewModel: CitiesListViewModel
    let onCityTap: ((CityViewData) -> Void)?
    let onInfoTap: ((CityViewData) -> Void)?
    let showCompactStyle: Bool

    @Binding var showOnlyFavorites: Bool

    var body: some View {
        VStack(spacing: .spacing12) {
            if viewModel.isLoading {
                LoadingView()
            } else {
                header
                filterToggle
                searchBar
                listView
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
            }
        }
        .background(Color.backgroundLight)
        .onAppear {
            if viewModel.filteredCities.isEmpty && !viewModel.isLoading {
                viewModel.fetchCities()
            }
        }
    }

    private var header: some View {
        Text(String.citiesListTitle)
            .font(UalaFont.bold(.fontSize40))
            .foregroundColor(.backgroundBlue)
            .padding(.top, .padding12)
    }

    private var filterToggle: some View {
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
    }

    private var searchBar: some View {
        SearchBar(text: $viewModel.searchText)
            .padding(.horizontal, .padding16)
    }

    private var listView: some View {
        List(viewModel.filteredCities) { city in
            VStack(alignment: .leading, spacing: .spacing8) {
                HStack {
                    Text(city.title)
                        .font(UalaFont.medium(showCompactStyle ? .fontSize14 : .fontSize16))
                        .foregroundColor(.primary)
                    Spacer()
                    Button(action: {
                        viewModel.toggleFavorite(id: city.id)
                    }) {
                        (city.isFavorite ? Image.starfill : Image.star)
                            .foregroundColor(city.isFavorite ? .accentRed : .gray)
                            .imageScale(.medium)
                    }
                    .buttonStyle(BorderlessButtonStyle())
                }
                
                Text(city.subtitle)
                    .font(UalaFont.light(showCompactStyle ? .fontSize12 : .fontSize14))
                    .foregroundColor(.textSecondary)
                
                HStack {
                    Button {
                        onCityTap?(city)
                    } label: {
                        Text(String.viewMapLabel)
                            .font(UalaFont.regular(.fontSize14))
                    }
                    .buttonStyle(.cityInfoStyle())
                    
                    Button {
                        onInfoTap?(city)
                    } label: {
                        Text(String.detailsLabel)
                            .font(UalaFont.regular(.fontSize14))
                            .foregroundColor(Color.primaryBlue)
                    }
                }
            }
            .padding(.vertical, .padding8)
            .contentShape(Rectangle())
        }
    }
}
