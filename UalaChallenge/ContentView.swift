//
//  ContentView.swift
//  UalaChallenge
//
//  Created by Julieta Rabozzi on 11/05/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CitiesListView(
            viewModel: CitiesListViewModel(service: CityService())
        )
    }
}
