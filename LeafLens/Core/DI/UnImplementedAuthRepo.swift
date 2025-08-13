//
//  UnImplementedAuthRepo.swift
//  LeafLens
//
//  Created by William German on 8/13/25.
//

// UnimplementedAuthRepository.swift
import Supabase
import SwiftUI

struct UnimplementedAuthRepo: AuthRepository {
    func currentSession() async throws -> Session? { fail() }
    func refreshSession() async throws -> Session { fail() }
    func signUp(email: String, password: String) async throws { fail() }
    func signIn(email: String, password: String) async throws { fail() }
    func signOut() async throws { fail() }
    func updateUser(_ data: UserAttributes) async throws { fail() }
    func authEvents() -> AsyncStream<AuthEventType> { AsyncStream { _ in fail() } }

    @inline(__always)
    private func fail<T>() -> T {
        fatalError("AuthRepository not provided. Inject a real or mock implementation via AppDI.")
    }
    
    @inline(__always)
    private func fail() {
        fatalError("AuthRepository not provided. Inject a real or mock implementation via AppDI.")
    }
}
