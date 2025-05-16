//
//  CityMapScreen.swift
//  UalaChallenge
//
//  Created by Julieta Rabozzi on 16/05/2025.
//

import SwiftUI
import MapKit

struct CityMapScreen: View {
    @Environment(\.dismiss) private var dismiss
    let city: CityViewData

    @State private var position: MapCameraPosition

    init(city: CityViewData) {
        self.city = city
        let coordinate = CLLocationCoordinate2D(latitude: city.coordinate.lat, longitude: city.coordinate.lon)
        _position = State(initialValue: .region(MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
        )))
    }

    var body: some View {
        Map(position: $position) {
            Marker(city.title, coordinate: CLLocationCoordinate2D(
                latitude: city.coordinate.lat,
                longitude: city.coordinate.lon
            ))
            .tint(.accentRed)
        }
        .ignoresSafeArea()
        .navigationTitle(city.title)
        .navigationBarTitleDisplayMode(.inline)
        .setBackButton(color: .primaryblue, action: { dismiss() })
    }
}
