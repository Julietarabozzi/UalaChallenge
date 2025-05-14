//
//  Fonts.swift
//  UalaChallenge
//
//  Created by Julieta Rabozzi on 14/05/2025.
//

import Foundation
import SwiftUI

enum UalaFont {
    static func regular(_ size: CGFloat) -> Font {
        .custom("Inter-Regular", size: size)
    }
    
    static func bold(_ size: CGFloat) -> Font {
        .custom("Inter-Regular_Bold", size: size)
    }
    
    static func light(_ size: CGFloat) -> Font {
        .custom("Inter-Regular_Light", size: size)
    }

    static func medium(_ size: CGFloat) -> Font {
        .custom("Inter-Regular_Medium", size: size)
    }

    static func italic(_ size: CGFloat) -> Font {
        .custom("Inter-Italic", size: size)
    }
}
