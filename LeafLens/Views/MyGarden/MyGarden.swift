//
//  MyGarden.swift
//  LeafLens
//
//  Created by William German on 5/6/25.
//
import SwiftUI

struct MyGarden: View {
    @EnvironmentObject var auth: AuthService
    @Binding var path: NavigationPath
    
    var body: some View {
        Text("My Garden placeholder")
    }
}
#Preview {
    MyGarden(path: .constant(NavigationPath()))
}
