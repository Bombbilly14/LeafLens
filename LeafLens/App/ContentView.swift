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
    @EnvironmentObject var auth: AuthViewModel
    @State var showSplash: Bool
    @State var authRoute: AuthRoute = .none
    
    init(startWithSplash: Bool = true) {
        _showSplash = State(initialValue: startWithSplash)
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
//                .environmentObject(auth)
                
            }
        }
    }
}
