//
//  BackgroundGradient.swift
//  LeafLens
//
//  Created by William German on 4/29/25.
//

//import SwiftUI

//struct BackgroundGradient: View {
//    var body: some View {
//        ZStack {
//            // vertical gradient
//            LinearGradient(
//                gradient: Gradient(stops: [
//                    .init(color: Color(red: 171/255, green: 185/255, blue: 180/255), location: 0.0),
//                    .init(color: Color(red: 55/255, green: 80/255, blue: 75/255), location: 1.0)
//                ]),
//                startPoint: .top,
//                endPoint: .bottom
//                )
//            // horizontal gradient
//            LinearGradient(
//                gradient: Gradient(stops: [
//                    .init(color: Color(red: 171/255, green: 185/255, blue: 180/255), location: 0.0),
//                    .init(color: Color(red: 180/255, green: 198/255, blue: 135/255), location: 1.0)
//                ]),
//                startPoint: .leading,
//                endPoint: .trailing
//                )
//            .blendMode(.overlay)
//            
//        }
//        .ignoresSafeArea()
//    }
//}
//
//extension View {
//    func backgroundGradient() -> some View {
//        self.background(BackgroundGradient())
//    }
//}
