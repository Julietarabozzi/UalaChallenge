//
//  CityViewData.swift
//  UalaCities
//
//  Created by Julieta Rabozzi on 11/05/2025.
//

import Foundation

struct CityViewData: Identifiable {
    let id: Int
    let title: String
    let subtitle: String
    let isFavorite: Bool
    let coordinate: (lat: Double, lon: Double)
}
