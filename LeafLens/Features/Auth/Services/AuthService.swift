//
//  AuthService.swift
//  LeafLens
//
//  Created by William German on 4/24/25.
//

import Foundation
import Supabase
import Combine

//@MainActor
//class AuthService: ObservableObject {
final class AuthService {
    private let client: SupabaseClient
//    private var authListener: Task<Void, Never>?
//    
//    @Published var user: User?
//    @Published var isLoggedIn: Bool = false
//    @Published var isLoading: Bool = true
    
    init(client: SupabaseClient) {
        self.client = client
//        authStateListener()
    }
    
    
    func signUp(email: String, password: String) async throws {
        try await client.auth.signUp(email: email, password: password)
//        let result = try await client.auth.signUp(email: email, password: password)
//        self.user = result.user
//
//        let loginResult = try await client.auth.signIn(email: email, password: password)
//        self.user = loginResult.user
//
//        if let user = self.user {
//            try await client
//                .from("users")
//                .insert([
//                    "id": user.id.uuidString,
//                    "email": email
//                ])
//                .execute()
//        }
    }
    
    func signOut() async throws {
        try await client.auth.signOut()
//        self.user = nil
    }
    
    func signIn(email: String, password: String) async throws {
        try await client.auth.signIn(email: email, password: password)
//        let result = try await client.auth.signIn(email: email, password: password)
//        self.user = result.user
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
    
//    func authStateListener() {
//        authListener = Task {
//            for await (event, session) in client.auth.authStateChanges {
//                print("Auth event: \(event)")
//                switch event {
//                case .initialSession:
//                    if session != nil {
//                        do {
//                            let refreshedSession = try await client.auth.refreshSession()
//                            print("refreshed session")
//                            self.user = refreshedSession.user
//                            self.isLoggedIn = true
//                        } catch {
//                            print("failed to refresh")
//                            self.user = nil
//                            self.isLoggedIn = false
//                        }
//                    } else {
//                        self.user = nil
//                        self.isLoggedIn = false
//                    }
//                    self.isLoading = false
//                case .signedIn:
//                    self.user = session?.user
//                    self.isLoggedIn = true
//                    print("isLoggedin? \(self.isLoggedIn)")
//                case .signedOut:
//                    self.user = nil
//                    self.isLoggedIn = false
//                default:
//                    break
//                }
//            }
//        }
//    }
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
