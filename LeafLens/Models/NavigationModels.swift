//
//  NavigationModels.swift
//  LeafLens
//
//  Created by William German on 4/26/25.
//
import Foundation

enum HomeRoutes: Hashable {
    case home
    case splash
    case placeholder
}

enum SettingsRoutes: Hashable {
    case profile
    case manageAccount
}

enum AuthRoutes: Hashable {
    case login
    case signup
}
