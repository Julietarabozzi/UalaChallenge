//
//  City.swift
//  UalaCities
//
//  Created by Julieta Rabozzi on 11/05/2025.
//

import Foundation
struct City: Identifiable, Codable {
    let id: Int
    let name: String
    let country: String
    let coord: Coordinate

    struct Coordinate: Codable {
        let lon: Double
        let lat: Double
    }

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, country, coord
    }

    var title: String { "\(name), \(country)" }
}
