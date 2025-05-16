//
//  UalaChallengeApp.swift
//  UalaChallenge
//
//  Created by Julieta Rabozzi on 11/05/2025.
//

import SwiftUI

@main
struct UalaChallengeApp: App {
    @State private var showSplash = true

    var body: some Scene {
        WindowGroup {
            if showSplash {
                SplashScreen()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            withAnimation {
                                showSplash = false
                            }
                        }
                    }
            } else {
                ResponsiveCitiesScreen(
                              viewModel: CitiesListViewModel(service: CityService())
                          )
            }
        }
    }
}
