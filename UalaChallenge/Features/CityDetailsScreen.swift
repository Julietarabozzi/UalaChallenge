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
        VStack(spacing: .spacing70) {
            header
            content
            image
                .background(Color.backgroundLight.ignoresSafeArea())
                .setBackButton(color: .primaryblue, action: { dismiss() })
        }
    }
    private var header: some View {
        Text(String.cityInfoTitle)
            .font(UalaFont.bold(.fontSize40))
            .foregroundColor(Color.backgroundBlue)
    }
    private var content: some View {
        VStack(alignment: .leading) {
            Text(city.title)
                .font(UalaFont.bold(.fontSize24))
                .foregroundColor(.primary)

            HStack(spacing: .spacing12) {
                VStack(alignment: .leading, spacing: .spacing8) {
                    Text(String.latitudeLabel)
                        .font(UalaFont.light(.fontSize14))
                        .foregroundColor(.textSecondary)
                    Text("\(city.coordinate.lat)")
                        .font(UalaFont.regular(.fontSize16))
                        .foregroundColor(.primary)
                }
            }

            HStack(spacing: .spacing12) {
                VStack(alignment: .leading, spacing: .spacing8) {
                    Text(String.longitudeLabel)
                        .font(UalaFont.light(.fontSize14))
                        .foregroundColor(.textSecondary)
                    Text("\(city.coordinate.lon)")
                        .font(UalaFont.regular(.fontSize16))
                        .foregroundColor(.primary)
                }
            }
        }
    }
    
    private var image: some View {
        Image(.latitud)
            .resizable()
            .frame(width: .width100, height: .height100)
            .padding(.top, .padding32)
    }
}
