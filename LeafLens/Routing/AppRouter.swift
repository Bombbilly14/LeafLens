//
//  AppRouter.swift
//  LeafLens
//
//  Created by William German on 4/28/25.
//
import SwiftUI

struct AppRouter: View {
    enum Tab {case home, settings, placeholder}
    
    @State private var selectedTab: Tab = .home
    @State private var homePath = NavigationPath()
    @State private var settingsPath = NavigationPath()
    @State private var placeholderPath = NavigationPath()
    
    
    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationStack(path: $homePath) {
                HomeView(path: $homePath)
                    .navigationDestination(for: HomeRoutes.self) { screen in
                        switch screen {
                        case .placeholder:
                            HomePlaceholderView()
                        default:
                            EmptyView()
                        }
                    }
                    .toolbar(homePath.isEmpty ? .visible : .hidden, for: .tabBar)
            }
            .tag(Tab.home)
            .tabItem { Label("Home", systemImage: "house")}
            
            NavigationStack {
                PlaceholderView()
            }
            .tabItem { Label("Placeholder", systemImage: "plus") }
            
            NavigationStack(path: $settingsPath) {
                SettingsView(path: $settingsPath)
                    .navigationDestination(for: SettingsRoutes.self) { screen in
                        switch screen {
                        case .profile:
                            ProfileView()
                        case .manageAccount:
                            PlaceholderView()
                        }
                    }
                    .toolbar(settingsPath.isEmpty ? .visible : .hidden, for: .tabBar)
            }
            .tag(Tab.settings)
            .tabItem { Label("Settings", systemImage: "gear") }
        }
    }
}
