//
//  CityDetailsScreen.swift
//  UalaChallenge
//
//  Created by Julieta Rabozzi on 15/05/2025.
//

import Foundation
import SwiftUI

struct CityDetailsView: View {
    @Environment(\.dismiss) private var dismiss
    let city: CityViewData

    var body: some View {
        header
        content
        .padding(.horizontal, 24)
        .padding(.bottom, 32)
        .background(Color.backgroundLight.ignoresSafeArea())
        .navigationBarTitleDisplayMode(.inline)
        .setBackButton(color: .primaryblue, action: { dismiss() })
    }
    private var header: some View {
        Text("City Info")
            .font(UalaFont.bold(40))
            .foregroundColor(Color.backgroundBlue)
    }
    private var content: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text(city.title)
                .font(UalaFont.bold(24))
                .foregroundColor(.primary)
                .padding(.top, 32)

            HStack(spacing: 12) {
                Image(systemName: "location.north.fill")
                    .foregroundColor(.primaryblue)
                VStack(alignment: .leading, spacing: 4) {
                    Text("Latitud")
                        .font(UalaFont.light(13))
                        .foregroundColor(.textSecondary)
                    Text("\(city.coordinate.lat)")
                        .font(UalaFont.regular(16))
                        .foregroundColor(.primary)
                }
            }

            HStack(spacing: 12) {
                Image(systemName: "location.south.fill")
                    .foregroundColor(.primaryblue)
                VStack(alignment: .leading, spacing: 4) {
                    Text("Longitud")
                        .font(UalaFont.light(13))
                        .foregroundColor(.textSecondary)
                    Text("\(city.coordinate.lon)")
                        .font(UalaFont.regular(16))
                        .foregroundColor(.primary)
                }
            }

            Spacer()
        }
    }
}
