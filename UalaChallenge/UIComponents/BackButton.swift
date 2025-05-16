//
//  BackButton.swift
//  UalaChallenge
//
//  Created by Julieta Rabozzi on 16/05/2025.
//

import Foundation
import SwiftUI

extension View {
    func setBackButton(color: Color = .primaryblue, action: @escaping () -> Void) -> some View {
        self.modifier(BackButtonModifier(color: color, action: action))
    }
}

private struct BackButtonModifier: ViewModifier {
    let color: Color
    let action: () -> Void

    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: action) {
                        Image(systemName: "arrow.backward")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(color)
                    }
                }
            }
    }
}
