//
//  AuthRepository.swift
//  LeafLens
//
//  Created by William German on 8/10/25.
//

import Foundation
import Supabase

public enum AuthEventType: Equatable {
    case initial(Session?)
    case signedIn(Session?)
    case signedOut
    case userUpdated(Session?)
    case tokenRefreshed(Session?)
    case unknown
}


public protocol AuthRepository {
    
    func currentSession() async throws -> Session?
    func refreshSession() async throws -> Session
    func signUp(email: String, password: String) async throws
    func signIn(email: String, password: String) async throws
    func signOut() async throws
    func updateUser(_ data: UserAttributes) async throws
    
    func authEvents() -> AsyncStream<AuthEventType>
}
