//
//  AppRouter.swift
//  LeafLens
//
//  Created by William German on 4/28/25.
//
import SwiftUI

struct AppRouter: View {
    enum Tab {case home, settings, identify, myGarden, calendar}
    
    @State private var selectedTab: Tab = .home
    @State private var homePath = NavigationPath()
    @State private var myGardenPath = NavigationPath()
    @State private var settingsPath = NavigationPath()
    @State private var placeholderPath = NavigationPath()
    @State private var identifyPath = NavigationPath()
    @State private var calendarPath = NavigationPath()
    
    private var showBottomNav: Bool {
        switch selectedTab {
        case .home:
            return homePath.isEmpty
        case .settings:
            return settingsPath.isEmpty
            
        case .identify:
            return identifyPath.isEmpty
        case .myGarden:
            return myGardenPath.isEmpty
        case .calendar:
            return calendarPath.isEmpty
        }
    }
    
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
                case .myGarden:
                    
                    NavigationStack(path: $myGardenPath) {
                        MyGarden(path: $myGardenPath)
                    }
                    
                case .calendar:
                    NavigationStack {
                        CalendarView()
                    }
                case .identify:
                    NavigationStack {
                        IdentifyYourPlant()
                    }
                    
                    
                case .settings:
                    NavigationStack(path: $settingsPath) {
                        SettingsView(path: $settingsPath)
                            .navigationDestination(for: SettingsRoutes.self) { screen in
                                switch screen {
                                case .profile:
                                    ProfileView()
                                case .manageAccount:
                                    ManageAccount()
                                    
                                }
                            }
                            .toolbar(settingsPath.isEmpty ? .visible : .hidden, for: .tabBar)
                    }
                    
                    
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            if showBottomNav {
                BottomNavBar(selectedTab: $selectedTab)
                
            }
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

#Preview {
    AppRouter()
}
