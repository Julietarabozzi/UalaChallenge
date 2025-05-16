//
//  CityDetailsScreen.swift
//  UalaChallenge
//
//  Created by Julieta Rabozzi on 15/05/2025.
//

import Foundation
import SwiftUI

struct CityDetailsView: View {
    let city: CityViewData

    var body: some View {
        VStack(spacing: 16) {
            Text(city.title)
                .font(UalaFont.bold(20))
                .padding()

            Text("Latitud: \(city.coordinate.lat)")
            Text("Longitud: \(city.coordinate.lon)")
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
