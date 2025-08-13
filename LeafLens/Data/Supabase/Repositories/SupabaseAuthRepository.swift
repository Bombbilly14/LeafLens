//
//  SupabaseAuthRepository.swift
//  LeafLens
//
//  Created by William German on 8/10/25.
//


import Foundation
import Supabase

public final class SupabaseAuthRepository: AuthRepository {
    private let client: SupabaseClient
    
    public init(client: SupabaseClient) {
        self.client = client
    }
    
    public func currentSession() async throws -> Session? {
        try await client.auth.session
    }
    
    public func refreshSession() async throws -> Session {
        try await client.auth.refreshSession()
    }
    
    public func signUp(email: String, password: String) async throws {
        try await client.auth.signUp(email: email, password: password)
    }
    
    public func signOut() async throws {
        try await client.auth.signOut()
    }
    
    public func signIn(email: String, password: String) async throws {
        try await client.auth.signIn(email: email, password: password)
    }
    
    public func updateUser(_ data: UserAttributes) async throws {
        try await client.auth.update(user: data)
    }
    
    public func authEvents() -> AsyncStream<AuthEventType> {
        AsyncStream { continuation in
            let task = Task.detached {
                for await change in self.client.auth.authStateChanges {
                    let event: AuthEventType
                    switch change.event {
                    case .initialSession:
                        event = .initial(change.session)
                    case .signedIn:
                        event = .signedIn(change.session)
                    case .signedOut:
                        event = .signedOut
                    case .userUpdated:
                        event = .userUpdated(change.session)
                    case .tokenRefreshed:
                        event = .tokenRefreshed(change.session)
                    default:
                        event = .unknown
                    }
                    continuation.yield(event)
                }
                continuation.finish()
            }
            continuation.onTermination = { _ in
                task.cancel()
            }
        }
    }
}
