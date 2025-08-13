//
//  ContentViewPreveiws.swift
//  LeafLens
//
//  Created by William German on 8/13/25.
//

#if DEBUG
import SwiftUI

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            loggedOut
                .previewDisplayName("Logged Out")

            loggedIn
                .previewDisplayName("Logged In")

            failing
                .previewDisplayName("Auth Error")
        }
//        .previewDevice("iPhone 14 Pro")
    }

    private static var loggedOut: some View {
        let di = AppDI(authRepository: MockAuthRepo(initialSession: nil))
        let vm = AuthViewModel(auth: di.authRepository)
        return ContentView(startWithSplash: false)
            .environment(\.di, di)
            .environmentObject(vm)
    }

    private static var loggedIn: some View {
        let di = AppDI(authRepository: MockAuthRepo(initialSession: MockAuthRepo.sampleSession()))
        let vm = AuthViewModel(auth: di.authRepository)
        return ContentView(startWithSplash: false)
            .environment(\.di, di)
            .environmentObject(vm)
    }

    private static var failing: some View {
        let repo = MockAuthRepo()
        repo.shouldFail = true
        let di = AppDI(authRepository: repo)
        let vm = AuthViewModel(auth: di.authRepository)
        return ContentView(startWithSplash: true)
           .environment(\.di, di)
           .environmentObject(vm)
    }
}
#endif
