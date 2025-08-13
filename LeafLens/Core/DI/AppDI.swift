//
//  AppDI.swift
//  LeafLens
//
//  Created by William German on 8/13/25.
//

import SwiftUI

struct AppDI {
    let authRepository: AuthRepository
//    let genusRepository: GenusRepository
//    let gardenRepository: GardenRepository
}


private struct AppDIKey: EnvironmentKey {
    static let defaultValue: AppDI = AppDI(authRepository: UnimplementedAuthRepo())

}

extension EnvironmentValues {
    var di: AppDI {
        get { self[AppDIKey.self] }
        set { self[AppDIKey.self] = newValue}
    }
}
