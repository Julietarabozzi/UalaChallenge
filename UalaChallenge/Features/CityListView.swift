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
            VStack(spacing: 12) {
                header
                searchBar
                if viewModel.isLoading {
                    ProgressView("Loading...")
                        .font(UalaFont.regular(16))
                        .foregroundColor(.textSecondary)
                        .padding()
                } else {
                    listView
                }
            }
            .padding(.top, 8)
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
        Text("Cities")
            .font(UalaFont.bold(40))
            .foregroundColor(Color.backgroundBlue)
    }
    private var listView: some View {
        List(viewModel.filteredCities) { city in
            HStack(spacing: 12) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(city.title)
                        .font(UalaFont.medium(16))
                        .foregroundColor(.primary)

                    Text(city.subtitle)
                        .font(UalaFont.light(13))
                        .foregroundColor(.textSecondary)
                }

                Spacer()

                Button(action: {
                    viewModel.toggleFavorite(id: city.id)
                }) {
                    Image(systemName: city.isFavorite ? "star.fill" : "star")
                        .foregroundColor(city.isFavorite ? .accentRed : .gray)
                        .imageScale(.medium)
                }
                .buttonStyle(BorderlessButtonStyle())
            }
            .padding(.vertical, 8)
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
