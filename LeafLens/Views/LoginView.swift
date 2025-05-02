//
//  LoginView.swift
//  LeafLens
//
//  Created by William German on 4/24/25.
//

// login view, sign user in with supabase and navigate home

import SwiftUI

struct LoginView: View {
    
    @State private var showToast: Bool = false
    @Binding var path: NavigationPath
    var body: some View {
        VStack {
//            LoginLogoView()
            LoginCardView(showToast: $showToast, path: $path)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
        .background(
            LinearGradient(gradient: Gradient(colors: [Color("GradientGreenBright"),
//                Color("BackgroundGreenApp"),
               Color("BackgroundGreenApp")]), startPoint: .top, endPoint: .bottom)
                        .edgesIgnoringSafeArea(.all)
                .ignoresSafeArea()
                .dismissKeyboardOnTap()
        )
        .showToast(
            isPresented: $showToast,
            message: "Email and password must not be empty!",
            backgroundColor: .red,
            textColor: .white,
            duration: 3
        )
    }
}

struct LoginCardView: View {
    enum Field: Hashable {
        case email
        case password
    }
    @EnvironmentObject var auth: AuthService
    
    @Binding var showToast: Bool
    @Binding var path: NavigationPath
    
    
    @State private var email = ""
    @State private var password = ""
    @State private var error: Error?
    
    @FocusState private var isFocused: Field?
        
    var body: some View {
        VStack {
            Spacer()
            LoginLogoView()
            VStack {
                // google + apple sign in here
                Spacer()
                HStack(spacing: 0) {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                            .scaledToFit()
                            .frame(width: 18, height: 18)
                        .foregroundColor(Color("BackgroundGreenApp"))
                    TextField(text: $email) {
                        Text("Email")
                            .bold()
                            .font(.system(size: 14))

                            .foregroundColor(Color("BackgroundGreenApp"))
                    }
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        
                        .padding(.leading, 10)
                        .frame(maxHeight: 50)
                        .focused($isFocused, equals: .email)
                        .cornerRadius(10)
                    
                    
                }
                
                .padding()
                .frame(maxHeight: 50)
                .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color("BackgroundGreenApp"), lineWidth: 1)
                            )
                .onTapGesture {
                    isFocused = .email
                }
                .padding()
                
                
                HStack(spacing: 0) {
                    Image(systemName: "lock.fill")
                        .resizable()
                            .scaledToFit()
                            .frame(width: 18, height: 18)
                        .foregroundColor(Color("BackgroundGreenApp"))
                    SecureField(text: $password) {
                        Text("Password")
                            .bold()
                            .font(.system(size: 14))
                            .foregroundColor(Color("BackgroundGreenApp"))
                    }
                        .padding(.leading, 10)
                        .frame(maxHeight: 50)
                        .focused($isFocused, equals: .password)
                    
                }
                
                .padding()
                .frame(maxHeight: 50)
                .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color("BackgroundGreenApp"), lineWidth: 1)
                            )
                .onTapGesture {
                    isFocused = .password
                }
                .padding()
                Spacer()
                Button(action: {
                    if email.isEmpty || password.isEmpty {
                        self.showToast = true
                    } else {
                        Task {
                            do {
                                try await auth.signIn(email: email, password: password)
                                print("logged in")
                            } catch {
                                print("error, \(error)")
                                self.error = error
                            }
                        }
                    }
                }) {
                    Text("Login")
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .bold()
                        .foregroundColor(Color(.white))
                        .background(
                            Color("BackgroundGreenApp")
                            
                        )
                        .cornerRadius(25)
                        .padding(.horizontal)
                }
                VStack {
                    HStack {
                        Text("Don't have an account?")
                            .foregroundColor(.gray)
                            .font(.system(size: 14))
                        
                        Button(action: {
                            path.append(AuthRoutes.signup)
                            }) {
                                   Text("Sign up")
                                    .overlay(
                                        Rectangle()
                                            .fill(Color("BackgroundGreenApp"))
                                            .frame(width: 50, height: 1)
                                            .offset(y: 2)
                                        , alignment: .bottom
                                    )
                                    .foregroundColor(Color("BackgroundGreenApp"))
                                    .font(.system(size: 14))
                                    .bold()
                                    
                                
                               }
                    }
                    .padding(.vertical, 20)
                    HStack {
                        Button("login me") {
                            Task {
                                do {
                                    try await auth.signIn(email: "example@LeafLens.com", password: "testPassword123")
                                    print("logged in")
                                } catch {
                                    print("error, \(error)")
                                    self.error = error
                                }
                            }
                            
                        }
                        .frame(maxWidth: .infinity)
                        .bold()
                        
                        .padding()
                        .foregroundColor(.white)
                        .background(Color("SecondaryButtons"))
                        .cornerRadius(10)
                        .padding(.horizontal, 40)
                    }
                    .padding(.bottom, 20)
                }
                
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height * 0.7)
            .background(Color("Card3"))
            .cornerRadius(40)
        }
        .ignoresSafeArea()
    }
}
struct LoginLogoView: View {
    var body: some View {
        VStack {
            Image("LeafLensLogoVector2")
                .resizable()
                .scaledToFit()
                .foregroundColor(.white)
                .frame(maxWidth: 80, maxHeight: 80)
            HStack(spacing: 0) {
                Text("Leaf")
                    .font(.custom("Georgia Italic", size: 45))
                    .foregroundColor(.white)
                Text("Lens")
                    .font(.custom("Georgia Italic", size: 45))
                    .foregroundColor(Color("Text"))
            }
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    LoginView(path: .constant(NavigationPath()))
}
