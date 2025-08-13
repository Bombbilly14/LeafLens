//
//  AuthViewModel.swift
//  LeafLens
//
//  Created by William German on 8/6/25.
//

import Foundation
import Supabase

@MainActor
final class AuthViewModel: ObservableObject {
    @Published var user: User?
    @Published var isLoading: Bool = true
    @Published var isLoggedIn: Bool = false
    @Published var error: Error? = nil
    
    private let auth: AuthRepository
    private var authListener: Task<Void, Never>?
    
    init(auth: AuthRepository) {
        self.auth = auth
        observeAuthChanges()
    }
    
    deinit { authListener?.cancel() }
    
    
    func signUp(email: String, password: String) async {
        await run {
            try await self.auth.signUp(email: email, password: password)
        }
        
    }
    
    func signIn(email: String, password: String) async {
        await run {
            try await self.auth.signIn(email: email, password: password)
        }
    }
    
    func signOut() async {
        await run {
            try await self.auth.signOut()
        }
    }
    
    func refreshSession() async {
        await run {
            let session = try await self.auth.refreshSession()
            self.user = session.user
            self.isLoggedIn = true
            
        }
    }
    
    func updateUser(_ data: UserAttributes) async {
        await run {
            try await self.auth.updateUser(data)
        }
        
    }
    
    private func run(_ op: @escaping () async throws -> Void) async {
        isLoading = true
        error = nil
        do {
            try await op()
        } catch {
            self.error = error
        }
        isLoading = false
    }
    
    
    private func observeAuthChanges() {
        authListener = Task {
            for await event in auth.authEvents() {
                switch event {
                case .initial(let session),
                        .signedIn(let session),
                        .userUpdated(let session),
                        .tokenRefreshed(let session):
                    self.user = session?.user
                    self.isLoggedIn = (session != nil)
                    self.isLoading = false
                    
                case .signedOut:
                    self.user = nil
                    self.isLoggedIn = false
                    self.isLoading = false
                    
                case .unknown:
                    break
                }
            }
        }
    }
}
