//
//  AuthService.swift
//  LeafLens
//
//  Created by William German on 4/24/25.
//

import Foundation
import Supabase
import Combine

final class AuthService {
    private let client: SupabaseClient
    
    init(client: SupabaseClient) {
        self.client = client
    }
    
    
    func signUp(email: String, password: String) async throws {
        try await client.auth.signUp(email: email, password: password)
    }
    
    func signOut() async throws {
        try await client.auth.signOut()
    }
    
    func signIn(email: String, password: String) async throws {
        try await client.auth.signIn(email: email, password: password)
    }
    
    func updateUser(data: UserAttributes) async throws {
        try await client.auth.update(user: data)
    }
    
    func deleteUser(userId: String) async throws {
        try await client.auth.admin.deleteUser(id: userId)
    }
    
    func refreshSession() async throws -> Session {
      try await client.auth.refreshSession()
    }
    
    func onAuthStateChanged(
        _ handler: @escaping (AuthChangeEvent, Session?) -> Void
    ) -> Task<Void, Never> {
        Task.detached {
            for await event in self.client.auth.authStateChanges {
                handler(event.event, event.session)
            }
        }
    }
        
}
