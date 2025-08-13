//
//  CompositionRoot.swift
//  LeafLens
//
//  Created by William German on 8/13/25.
//

import SwiftUI
import Supabase

@MainActor
final class CompositionRoot {
    
    let supabase: SupabaseClient
    
    let authRepo: AuthRepository
    
    let authVM: AuthViewModel
    
    init(config: SupabaseConfig) {
        // clients
        self.supabase = SupabaseClient(supabaseURL: config.url, supabaseKey: config.apiKey)
        // repos
        self.authRepo = SupabaseAuthRepository(client: supabase)
        // vms
        self.authVM = AuthViewModel(auth: authRepo)
    }
    
    var appDI: AppDI {
        AppDI(
            authRepository: authRepo
        )
    }
}


struct SupabaseConfig {
    
    let url: URL
    let apiKey: String
}
