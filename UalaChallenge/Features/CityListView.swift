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

    var body: some View {
        NavigationStack {
            VStack {
                searchBar

                if viewModel.isLoading {
                    ProgressView("Loading...")
                        .padding()
                } else {
                    listView
                }
            }
            .navigationTitle("Cities")
            .onAppear {
                viewModel.fetchCities()
            }
        }
    }

    private var searchBar: some View {
        SearchBar(text: $viewModel.searchText)
    }

    private var listView: some View {
        List(viewModel.filteredCities) { city in
            HStack {
                VStack(alignment: .leading) {
                    Text(city.title)
                        .font(.headline)
                    Text(city.subtitle)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }

                Spacer()

                Button(action: {
                    viewModel.toggleFavorite(id: city.id)
                }) {
                    Image(systemName: city.isFavorite ? "star.fill" : "star")
                        .foregroundColor(city.isFavorite ? .yellow : .gray)
                }
                .buttonStyle(BorderlessButtonStyle()) // Evita que seleccione toda la celda
            }
            .contentShape(Rectangle())
            .onTapGesture {
                // TODO: Navegar a mapa
            }
            .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                Button {
                    // TODO: Navegar a detalle
                } label: {
                    Label("Info", systemImage: "info.circle")
                }
                .tint(.blue)
            }
        }
        .listStyle(.plain)
    }
}
