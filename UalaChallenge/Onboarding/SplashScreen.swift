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
            VStack(spacing: 150) {
                Image.ualalogo
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                Text("Challenge")
                    .font(UalaFont.medium(28))
                    .foregroundColor(.white)
                    .padding(.bottom, 12)
            }
        }
    }
}
