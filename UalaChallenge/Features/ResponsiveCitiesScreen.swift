//
//  ResponsiveCitiesScreen.swift
//  UalaChallenge
//
//  Created by Julieta Rabozzi on 16/05/2025.
//

import Foundation
import SwiftUI

struct ResponsiveCitiesScreen: View {
    @ObservedObject var viewModel: CitiesListViewModel
    @State private var selectedCity: CityViewData?

    var body: some View {
        GeometryReader { geo in
            if geo.size.width > geo.size.height {
                HStack(spacing: 0) {
                    CitiesListCompactView(viewModel: viewModel, selectedCity: $selectedCity)
                        .frame(width: geo.size.width * 0.45)
                    
                    if let city = selectedCity {
                        CityMapScreen(city: city)
                    } else {
                        Text("Selecciona una ciudad")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }
            } else {
                CitiesListView(viewModel: viewModel)
            }
        }
    }
}
