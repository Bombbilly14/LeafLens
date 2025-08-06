//
//  ViewExtensions.swift
//  LeafLens
//
//  Created by William German on 4/26/25.
//

import SwiftUI
import UIKit

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil
            )
    }
    
    func dismissKeyboardOnTap() -> some View {
        self.contentShape(Rectangle())
            .onTapGesture {
                self.hideKeyboard()
            }
    }
}
