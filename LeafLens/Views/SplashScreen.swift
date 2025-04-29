//
//  SplashScreen.swift
//  LeafLens
//
//  Created by William German on 4/29/25.
//

import SwiftUI

struct SplashScreen: View {
    @EnvironmentObject var auth: AuthService
    var body: some View {
        ZStack{
            VStack(spacing: 20) {
                Image("LeafLensLogo2")
                    .resizable() // makes image resizable
                    .frame(maxWidth: 225, maxHeight: 225)
                    .scaledToFit() // maintain aspect ratio
                    .offset(y: -70)
                
            }
            ZStack {
                HStack(spacing: 0){
                    Text("Leaf")
                        .font(.custom("Georgia Italic", size: 45))
                        .foregroundColor(Color(.white))
                    Text("Lens")
                        .font(.custom("Georgia Italic", size: 45))
                        .foregroundColor(Color("Text"))
                    
                }
                .offset(y: 35)
                
            }
            
            Text("Snap. Identify. Care.")
                .font(.custom("Georgia Italic", size: 20))
                    .foregroundColor(.white)
                    .offset(y: 85)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("AppBackgroundColor"))
        .ignoresSafeArea()
    }
}

#Preview {
    SplashScreen()
}
