//
//  MockAuthRepo.swift
//  LeafLens
//
//  Created by William German on 8/13/25.
//

import Supabase
import SwiftUI

#if DEBUG
final class MockAuthRepo: AuthRepository {
    var initialSession: Session?
    var shouldFail = false

    init(initialSession: Session? = nil) {
        self.initialSession = initialSession
    }

    func currentSession() async throws -> Session? {
        if shouldFail { throw MockError.fakeFailure }
        return initialSession
    }

    func refreshSession() async throws -> Session {
        if shouldFail { throw MockError.fakeFailure }
        return initialSession ?? Self.sampleSession()
    }

    func signUp(email: String, password: String) async throws {
        if shouldFail { throw MockError.fakeFailure }
        initialSession = Self.sampleSession()
    }

    func signIn(email: String, password: String) async throws {
        if shouldFail { throw MockError.fakeFailure }
        initialSession = Self.sampleSession()
    }

    func signOut() async throws {
        if shouldFail { throw MockError.fakeFailure }
        initialSession = nil
    }

    func updateUser(_ data: UserAttributes) async throws {
        if shouldFail { throw MockError.fakeFailure }
    }

    func authEvents() -> AsyncStream<AuthEventType> {
        AsyncStream { continuation in
            continuation.yield(.initial(initialSession))
        }
    }

    static func sampleSession() -> Session {
        Session(
            accessToken: "mock-token",
            tokenType: "bearer",
            expiresIn: 3600,
            expiresAt: Date().addingTimeInterval(3600).timeIntervalSince1970,
            refreshToken: "mock-refresh",
            user: User(
                id: UUID(uuidString: "00000000-0000-0000-0000-000000000001")!, // stable UUID for previews
                appMetadata: [:],
                userMetadata: [:],
                aud: "authenticated",
                createdAt: Date(),
                role: "authenticated",
                updatedAt: Date(),
                identities: nil,
                factors: nil
            )
        )
    }


    enum MockError: Error {
        case fakeFailure
    }
}
#endif

