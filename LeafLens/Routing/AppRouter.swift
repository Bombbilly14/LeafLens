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
        ZStack(alignment: .bottom) {
            Group {
                switch selectedTab {
                case .home:
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
                case .placeholder:
                    NavigationStack {
                        PlaceholderView()
                    }
                case .settings:
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
                    
                    
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            BottomNavBar(selectedTab: $selectedTab)
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

#Preview {
    AppRouter()
}
