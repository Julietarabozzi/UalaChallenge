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

    var body: some View {
        NavigationStack(path: $router.routes) {
            VStack(spacing: .spacing12) {
                if viewModel.isLoading {
                    LoadingView()
                } else {
                    header
                    searchBar
                    listView
                }
            }
            .padding(.top, .padding8)
            .background(Color.backgroundLight)
            .navigationBarTitleDisplayMode(.inline)
            .onAppear { viewModel.fetchCities() }
            .navigationDestination(for: CitiesRoutes.self) { $0.destination }
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
                router.push(.cityDetails(city: city))
            }
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        .background(Color.backgroundLight)
    }
}
