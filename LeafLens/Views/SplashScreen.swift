//
//  SplashScreen.swift
//  LeafLens
//
//  Created by William German on 4/29/25.
//

import SwiftUI
import Supabase

struct SplashScreen: View {
    @EnvironmentObject var auth: AuthService
    let onComplete: () -> Void
    let onLoginPressed: () -> Void
    let onSignupPressed: () -> Void

    @State private var scale: CGFloat = 1
    @State private var overlayWhite: Double = 0
    @State private var showButtons = false
    @State private var hasCheckedAuth = false
    @State private var logoOpacity: Double = 1
    @State private var textOpacity: Double = 1

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("GradientGreenBright"),
//                Color("GradientDarkGreen1"),
               Color("BackgroundGreenApp")]), startPoint: .topTrailing, endPoint: .bottomLeading)
                        .edgesIgnoringSafeArea(.all)
                .ignoresSafeArea()
                
            
            Color.white
                    .opacity(overlayWhite)
                    .ignoresSafeArea()
            
            Image("LeafLensLogoVector2")
                .resizable()
                .scaledToFit()
                .foregroundColor(.white)
                .frame(maxWidth: 150, maxHeight: 150)
                .offset(y: -120)
                .scaleEffect(scale, anchor: UnitPoint(x: 0.5, y: -0.4))
                .opacity(logoOpacity)
                .animation(.easeInOut(duration: 1.0), value: logoOpacity)
                .animation(.easeIn(duration: 1.0), value: scale)
                .zIndex(100)

            HStack(spacing: 0) {
                Text("Leaf")
                    .font(.custom("Georgia Italic", size: 45))
                    .foregroundColor(.white)
                Text("Lens")
                    .font(.custom("Georgia Italic", size: 45))
                    .foregroundColor(Color("Text"))
            }
            .offset(y: -20)
            .opacity(textOpacity)
            .animation(.easeInOut(duration: 1.0), value: textOpacity)

            Text("Snap. Identify. Care.")
                .font(.custom("Georgia Italic", size: 20))
                .foregroundColor(.white)
                .offset(y: 30)
                .opacity(textOpacity)
                .animation(.easeInOut(duration: 1.0), value: textOpacity)

            if showButtons {
                HStack(spacing: 16) {
                    Button(action: {
                        onLoginPressed()
                    }) {
                        Text("Login")
                            .font(.system(size: 20))
                            .frame(width: 125, height: 15)
                            .padding()
                            .foregroundColor(Color("BackgroundGreenApp"))
                            .background(Color(.white))
                            .cornerRadius(25)
                        
                    }
//                    .shadow(color: .gray, radius: 2)

                    Button(action: {
                        onSignupPressed()
                    }) {
                        Text("Sign up")
                            .font(.system(size: 18))
                            .frame(width: 125, height: 15)
                            .padding()
                            .foregroundColor(Color(.white))
                            .background(Color("TestAccentColor5"))
                            .cornerRadius(25)
                        
                    }
//                    .shadow(color: Color(.black), radius: 1)
                }
                .transition(.move(edge: .bottom).combined(with: .opacity))
                .offset(y: 275)
            }
        }
        .onReceive(auth.$isLoading) { loading in
            guard !loading, !hasCheckedAuth else { return }
            hasCheckedAuth = true

            if auth.isLoggedIn {
                scale = 20

                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                    withAnimation(.easeInOut(duration: 0.6)) {
                        logoOpacity = 0
                        textOpacity = 0
                        overlayWhite = 1
                    }
                }

                // once splash animation is finished, trigger showSplash as false in parent
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                    onComplete()
                }
            } else {
                withAnimation(.easeOut(duration: 1.2).delay(1.5)) {
                    showButtons = true
                }
            }
        }
    }
}





#Preview {
    let previewClient = SupabaseClient(
        supabaseURL: URL(string: "https://orcmlvodylvfdqawtjof.supabase.co")!,
        supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9yY21sdm9keWx2ZmRxYXd0am9mIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDU1MjI0ODksImV4cCI6MjA2MTA5ODQ4OX0.w834Zc-5zfo8UP57Ev6-YPNxSgiab6Uvv-S1TChXCSg"
      )
        let authService = AuthService(client: previewClient)
    
    SplashScreen(
        onComplete: {
        },
        onLoginPressed: {
        },
        onSignupPressed: {
        }
    )
        .environmentObject(authService)
}
