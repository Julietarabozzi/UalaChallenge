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
        VStack(spacing: 70) {
            header
            content
            image
                .background(Color.backgroundLight.ignoresSafeArea())
                .navigationBarTitleDisplayMode(.inline)
                .setBackButton(color: .primaryblue, action: { dismiss() })
        }
    }
    private var header: some View {
        Text("City Info")
            .font(UalaFont.bold(40))
            .foregroundColor(Color.backgroundBlue)
    }
    private var content: some View {
        VStack(alignment: .leading, spacing: 100) {
            Text(city.title)
                .font(UalaFont.bold(24))
                .foregroundColor(.primary)

            HStack(spacing: 12) {
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
                VStack(alignment: .leading, spacing: 4) {
                    Text("Longitud")
                        .font(UalaFont.light(13))
                        .foregroundColor(.textSecondary)
                    Text("\(city.coordinate.lon)")
                        .font(UalaFont.regular(16))
                        .foregroundColor(.primary)
                }
            }
        }
    }
    
    private var image: some View {
        Image(.latitud)
            .resizable()
            .frame(width: 150, height: 150)
            .padding(.top, 32)
    }
}
