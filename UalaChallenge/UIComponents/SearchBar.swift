//
//  SearchBar.swift
//  UalaChallenge
//
//  Created by Julieta Rabozzi on 15/05/2025.
//

import Foundation
import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    var placeholder: String = "Search"

    var body: some View {
        HStack {
            TextField(placeholder, text: $text)
                .font(UalaFont.regular(16))
                .foregroundColor(.primary)
                .padding(.vertical, 10)
                .padding(.leading, 16)
                .disableAutocorrection(true)
                .autocapitalization(.none)

            Image.searchicon
                .foregroundColor(.gray)
                .padding(.trailing, 16)
        }
        .background(Color(.systemGray6))
        .cornerRadius(12)
        .padding(.horizontal)
    }
}
