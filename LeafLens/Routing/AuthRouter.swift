//
//  AuthRouter.swift
//  LeafLens
//
//  Created by William German on 4/28/25.
//

import SwiftUI
struct AuthRouter: View {
    @State private var authPath = NavigationPath()
    
    
    var body: some View {
        NavigationStack(path: $authPath) {
            LoginView(path: $authPath)
                .navigationDestination(for: AuthRoutes.self) { screen in
                    switch screen {
                    case .signup:
                        SignupView()
                    default:
                        EmptyView()
                    }
                }
        }
    }
}
