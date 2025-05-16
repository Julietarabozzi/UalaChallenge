//
//  Router.swift
//  UalaChallenge
//
//  Created by Julieta Rabozzi on 15/05/2025.
//

import Foundation

protocol CitiesRouter: ObservableObject {
    var routes: [CitiesRoutes] { get set }
    func push(_ route: CitiesRoutes)
    func popToRoot()
}

final class CitiesRouterImpl: CitiesRouter {
    @Published var routes: [CitiesRoutes] = []

    func push(_ route: CitiesRoutes) {
        routes.append(route)
    }

    func popToRoot() {
        routes.removeAll()
    }
}
