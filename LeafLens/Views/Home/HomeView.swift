//
//  HomeView.swift
//  LeafLens
//
//  Created by William German on 4/24/25.
//

//home view, navigate here after login

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var auth: AuthService
    @Binding var path: NavigationPath
    
    @State var error: Error?
    var body: some View {
        VStack {
            Button("home palceholder view") {
                path.append(HomeRoutes.placeholder)
            }
            Button("logout") {
                Task {
                    do {
                        try await auth.signOut()
                    }
                }
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Background"))
        .ignoresSafeArea()
    }
}

#Preview {
    HomeView(path: .constant(NavigationPath()))
}
