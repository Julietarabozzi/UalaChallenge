//
//  SplashScreen.swift
//  UalaChallenge
//
//  Created by Julieta Rabozzi on 14/05/2025.
//

import Foundation
import SwiftUI

struct SplashScreen: View {
    var body: some View {
        ZStack {
            Color.backgroundBlue
                .ignoresSafeArea()
            VStack(spacing: .spacing70) {
                Image.ualalogo
                    .resizable()
                    .scaledToFit()
                    .frame(width: .width200)
                Text("Challenge")
                    .font(UalaFont.bold(.fontSize18))
                    .foregroundColor(.white)
                    .padding(.bottom, .padding12)
            }
        }
    }
}
