//
//  ContentView.swift
//  LeafLens
//
//  Created by William German on 4/24/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var auth: AuthService

    var body: some View {
        
        Group {
            if auth.isLoggedIn {
                AppRouter()
            } else {
                AuthRouter()
            }
        }
    }
}

#Preview {
    ContentView()
}
