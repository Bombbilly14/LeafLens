//
//  SettingsView.swift
//  LeafLens
//
//  Created by William German on 4/28/25.
//
import SwiftUI


struct SettingsView: View {
    @Binding var path: NavigationPath
    var body: some View {
        Button("Profile view button") {
            path.append(SettingsRoutes.profile)
        }
    }
}
