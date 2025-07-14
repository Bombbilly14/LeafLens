//
//  ContentView.swift
//  LeafLens
//
//  Created by William German on 4/24/25.
//

import SwiftUI

enum AuthRoute {
    case none, login, signup
}
struct ContentView: View {
    @EnvironmentObject var auth: AuthService
    @State var showSplash = true
    @State var authRoute: AuthRoute = .none
    
    init() {
//        let appearance = UINavigationBarAppearance()
//        appearance.configureWithOpaqueBackground()
//        appearance.backgroundColor = UIColor(named: "Card5") ?? UIColor.systemGreen
//        
//        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
//        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
//        
//        UINavigationBar.appearance().standardAppearance = appearance
//        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
        

    var body: some View {
        ZStack {
            Group {
                if auth.isLoggedIn {
                    AppRouter()
                } else {
                    AuthRouter(startRoute: authRoute)
                }
            }
            .opacity(showSplash ? 0 : 1)

            if showSplash {
                SplashScreen(
                    onComplete: {
                        withAnimation(.easeOut(duration: 0.3)) {
                            showSplash = false
                        }
                    },
                    onLoginPressed: {
                        authRoute = .login
                        showSplash = false
                    },
                    onSignupPressed: {
                        authRoute = .signup
                        showSplash = false
                    }
                )
                .environmentObject(auth)
                
            }
        }
    }
}
