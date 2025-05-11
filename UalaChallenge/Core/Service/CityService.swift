//
//  CityService.swift
//  UalaCities
//
//  Created by Julieta Rabozzi on 11/05/2025.
//

import Foundation
protocol CityServiceProtocol {
    func fetchCities() async throws -> [City]
}

final class CityService: CityServiceProtocol {
    func fetchCities() async throws -> [City] {
        let url = URL(string: "https://gist.githubusercontent.com/hernan-uala/dce8843a8edbe0b0018b32e137bc2b3a/raw/0996accf70cb0ca0e16f9a99e0ee185fafca7af1/cities.json")!
        let (data, response) = try await URLSession.shared.data(from: url)

        // Verificá que la respuesta sea OK
        if let httpResponse = response as? HTTPURLResponse {
            print("✅ Status code: \(httpResponse.statusCode)")
        }

        // Decodificación con log si falla
        do {
            let cities = try JSONDecoder().decode([City].self, from: data)
            print("✅ Decoded \(cities.count) cities")
            return cities
        } catch {
            print("❌ Decoding error: \(error)")
            throw error
        }
    }
}
