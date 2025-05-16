//
//  Routes.swift
//  UalaChallenge
//
//  Created by Julieta Rabozzi on 15/05/2025.
//

import Foundation
import SwiftUI

enum CitiesRoutes {
    case cityDetails(city: CityViewData)
    case cityMap

    var id: String {
        switch self {
        case .cityDetails(let city):
            return "city_\(city.id)"
        case .cityMap:
            return "city_map"
        }
    }

    @ViewBuilder
    var destination: some View {
        switch self {
        case .cityDetails(let city):
            CityDetailsView(city: city)
        case .cityMap:
            CityMapScreen()
        }
    }
}

extension CitiesRoutes: Equatable, Hashable {
    static func == (lhs: CitiesRoutes, rhs: CitiesRoutes) -> Bool {
        lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
