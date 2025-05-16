//
//  FavoritesStorage.swift
//  UalaChallenge
//
//  Created by Julieta Rabozzi on 16/05/2025.
//

import Foundation
import Foundation

protocol FavoritesStorageProtocol {
    func getFavorites() -> Set<Int>
    func saveFavorites(_ favorites: Set<Int>)
}

final class FavoritesStorage: FavoritesStorageProtocol {
    private let key = "FAVORITE_CITY_IDS"

    func getFavorites() -> Set<Int> {
        let array = UserDefaults.standard.array(forKey: key) as? [Int] ?? []
        return Set(array)
    }

    func saveFavorites(_ favorites: Set<Int>) {
        UserDefaults.standard.set(Array(favorites), forKey: key)
    }
}
