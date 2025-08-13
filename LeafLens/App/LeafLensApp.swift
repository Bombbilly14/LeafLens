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
    
    @State private var root = CompositionRoot(
        config: .init(
            url: URL(string: "https://orcmlvodylvfdqawtjof.supabase.co")!,
            apiKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9yY21sdm9keWx2ZmRxYXd0am9mIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDU1MjI0ODksImV4cCI6MjA2MTA5ODQ4OX0.w834Zc-5zfo8UP57Ev6-YPNxSgiab6Uvv-S1TChXCSg"
            )
    )
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.di, root.appDI)
                .environmentObject(root.authVM)
        }
    }
}
