//
//  LoadingView.swift
//  UalaChallenge
//
//  Created by Julieta Rabozzi on 16/05/2025.
//

import Foundation
import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack(spacing: 24) {
            ProgressView()
                .scaleEffect(1.5)
                .tint(.primaryblue)

            Text("Loading cities...")
                .font(UalaFont.medium(16))
                .foregroundColor(.textSecondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.backgroundLight)
    }
}
