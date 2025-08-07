//
//  AuthViewModel.swift
//  LeafLens
//
//  Created by William German on 8/6/25.
//

import Foundation
import Combine
import Supabase

@MainActor
final class AuthViewModel: ObservableObject {
    @Published var user: User?
    @Published var isLoading: Bool = true
    @Published var isLoggedIn: Bool = false
    @Published var error: Error? = nil
    
    private let authService: AuthService
    private var authListener: Task<Void, Never>?
    
    init(authService: AuthService) {
        self.authService = authService
        observeAuthChanges()
    }
    
    func signUp(email: String, password: String) async {
        isLoading = true
        
        do {
            try await authService.signUp(email: email, password: password)
        } catch {
            // self.error = error
        }
        isLoading = false
        
    }
    
    func signIn(email: String, password: String) async {
        isLoading = true
        
        do {
            try await authService.signIn(email: email, password: password)
        } catch {
            // self.error = error
        }
        isLoading = false
        
    }
    
    func signOut() async {
        
        do {
            try await authService.signOut()
        } catch {
            // self.error = error
        }
    }
    
    private func observeAuthChanges() {
        authListener = authService.onAuthStateChanged { [weak self] event, session in
            Task { @MainActor in
                switch event {
                case .initialSession:
                    if session != nil {
                        do {
                            let refreshedSession = try await self?.authService.refreshSession()
                            print("refreshed session")
                            self?.user = refreshedSession?.user
                            self?.isLoggedIn = true
                        } catch {
                            print("failed to refresh")
                            self?.user = nil
                            self?.isLoggedIn = false
                        }
                    } else {
                        self?.user = nil
                        self?.isLoggedIn = false
                    }
                    self?.isLoading = false
                    
                case .signedIn, .userUpdated:
                    self?.user = session?.user
                    self?.isLoggedIn = true
                case .signedOut:
                    self?.user = nil
                    self?.isLoggedIn = false
                default:
                    break
                    
                }
            }
            
        }
    }
    
}
