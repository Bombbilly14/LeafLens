//
//  LeafLensApp.swift
//  LeafLens
//
//  Created by William German on 4/24/25.
//

import SwiftUI
import Supabase

@main
struct LeafLensApp: App {
    let supabase = SupabaseClient(
      supabaseURL: URL(string: "https://orcmlvodylvfdqawtjof.supabase.co")!,
      supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9yY21sdm9keWx2ZmRxYXd0am9mIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDU1MjI0ODksImV4cCI6MjA2MTA5ODQ4OX0.w834Zc-5zfo8UP57Ev6-YPNxSgiab6Uvv-S1TChXCSg"
    )
//    @StateObject private var authService: AuthService
    
//    init() {
//        let auth = AuthService(client: supabase)
//        
//        _authService = StateObject(wrappedValue: auth)
//    }
    
    var body: some Scene {
        WindowGroup {
            let authService = AuthService(client: supabase)
            let authViewModel = AuthViewModel(authService: authService)
            ContentView()
                .environmentObject(authViewModel)
//                .environment(\.font, .custom("Inter-Regular", size: 16))
        }
    }
}
