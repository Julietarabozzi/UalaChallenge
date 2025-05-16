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
            VStack(spacing: .spacing12) {
                if viewModel.isLoading {
                    LoadingView()
                } else {
                    header
                    filterToggle
                    searchBar
                    listView
                }
            }
            .padding(.top, .padding8)
            .background(Color.backgroundLight)
            .navigationBarTitleDisplayMode(.inline)
            .onAppear { viewModel.fetchCities() }
            .navigationDestination(for: CitiesRoutes.self) { $0.destination }
            .onChange(of: showOnlyFavorites) {
                viewModel.applyFilter(showOnlyFavorites: showOnlyFavorites)
            }
        }
    }

    private var searchBar: some View {
        SearchBar(text: $viewModel.searchText)
    }
    private var header: some View {
        Text(String.citiesListTitle)
            .font(UalaFont.bold(.fontSize40))
            .foregroundColor(Color.backgroundBlue)
            .padding()
    }
    private var listView: some View {
        List(viewModel.filteredCities) { city in
            HStack(spacing: .spacing12) {
                VStack(alignment: .leading, spacing: .spacing8) {
                    Text(city.title)
                        .font(UalaFont.medium(.fontSize16))
                        .foregroundColor(.primary)

                    Text(city.subtitle)
                        .font(UalaFont.light(.fontSize14))
                        .foregroundColor(.textSecondary)
                    Button {
                        router.push(.cityDetails(city: city))
                    } label: {
                        Text("+ Info")
                            .font(UalaFont.regular(.fontSize14))
                    }
                    .buttonStyle(.cityInfoStyle())
                }

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
            .padding(.vertical, .padding8)
            .contentShape(Rectangle())
            .onTapGesture {
                router.push(.cityMap)
            }
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        .background(Color.backgroundLight)
    }
    private var filterToggle: some View {
        Toggle(isOn: $showOnlyFavorites) {
            Text(String.showFavoritesToggleLabel)
                .font(UalaFont.medium(.fontSize14))
                .foregroundColor(.textsecondary)
        }
        .toggleStyle(SwitchToggleStyle(tint: .accentRed))
        .padding(.horizontal, .padding16)
        
    }
}
