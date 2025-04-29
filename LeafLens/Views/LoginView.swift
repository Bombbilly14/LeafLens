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
            LoginLogoView()
            LoginCardView(showToast: $showToast, path: $path)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
        .background(
            Color("AppBackground")
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
            
            Text("Login")
                .font(.title)
                .foregroundColor(Color("AppText"))
                .bold()
            HStack {
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .focused($isFocused, equals: .email)
                    .textFieldStyle(.roundedBorder)

                
            }
            .padding(.vertical, 10)
            .contentShape(Rectangle())
            .onTapGesture {
                isFocused = .email
            }
            
            
            HStack {
                SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
                    .focused($isFocused, equals: .password)
                
            }
            .padding(.vertical, 10)
            .contentShape(Rectangle())
            .onTapGesture {
                isFocused = .password
            }
            
            Button(action: {
                print("login \(email), \(password)")
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
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color("PrimaryButtons"))
                    .cornerRadius(10)
                
            }
        }
        .padding()
        .frame(maxWidth: 350)
        .background(Color("AppCard"))
        .cornerRadius(20)
        .shadow(radius: 5)
        .padding()
        
        HStack {
            Text("Don't have an account?")
            Button("Sign Up") {
                path.append(AuthRoutes.signup)
            }
            .foregroundColor(.blue)
        }
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
            .padding()
            .foregroundColor(.white)
            .background(Color("AppBackgroundColor"))
            .cornerRadius(10)
            .padding(.horizontal, 40)
        }
    }
}
struct LoginLogoView: View {
    var body: some View {
        VStack {
            Text("LeafLens")
                .font(.largeTitle)
                .bold()
        }
    }
}

#Preview {
    LoginView(path: .constant(NavigationPath()))
}
