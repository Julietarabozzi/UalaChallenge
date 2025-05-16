//
//  UalaButton.swift
//  UalaChallenge
//
//  Created by Julieta Rabozzi on 16/05/2025.
//

import Foundation
import SwiftUI

extension ButtonStyle where Self == CityInfoButtonStyle {
    static func cityInfoStyle(
        foregroundColor: Color = .white,
        backgroundColor: Color = .primaryblue
    ) -> CityInfoButtonStyle {
        CityInfoButtonStyle(
            backgroundColor: backgroundColor,
            textStyle: TextStyle(
                foregroundColor: foregroundColor,
                font: UalaFont.medium(.fontSize16)
            ),
            borderStyle: BorderStyle(
                lineWidth: 0,
                cornerRadius: .cornerRadius24,
                borderColor: backgroundColor
            )
        )
    }
}

struct CityInfoButtonStyle: ButtonStyle {
    var backgroundColor: Color
    var textStyle: TextStyle
    var borderStyle: BorderStyle

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(textStyle.font)
            .foregroundColor(textStyle.foregroundColor)
            .padding(.vertical, .padding4)
            .padding(.horizontal, .padding16)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: borderStyle.cornerRadius))
            .opacity(configuration.isPressed ? 0.8 : 1.0)
    }
}

// MARK: - Support structs
struct TextStyle {
    var foregroundColor: Color
    var font: Font
}

struct BorderStyle {
    var lineWidth: CGFloat = 0
    var cornerRadius: CGFloat = .cornerRadius24
    var borderColor: Color = .clear
}
