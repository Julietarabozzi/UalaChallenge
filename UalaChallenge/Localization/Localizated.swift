//
//  Localizated.swift
//  UalaChallenge
//
//  Created by Julieta Rabozzi on 16/05/2025.
//

import Foundation

extension String {
    static var cityInfoTitle: String { "🚨City Info Title".localized }
    static var latitudeLabel: String { "🚨Latitude".localized }
    static var longitudeLabel: String { "🚨Longitude".localized }
    static var citiesListTitle: String { "🚨Cities".localized }
    static var challengeTitle: String { "🚨Challenge"
.localized }
    static var showFavoritesToggleLabel: String { "🚨Show only favorites".localized }
}

extension String {
    // MARK: - Localization
    // Currently only English is used. In the future, this can be extended using a LanguageManager to support more languages.
    var localized: String {
          NSLocalizedString(self, comment: "")
      }
}
