//
//  LoginView.swift
//  LeafLens
//
//  Created by William German on 4/24/25.
//

// login view, sign user in with supabase and navigate home

import SwiftUI
import _AuthenticationServices_SwiftUI

struct LoginView: View {
    
    @State private var showToast: Bool = false
    @Binding var path: NavigationPath
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                LoginCardView(showToast: $showToast, path: $path)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            .background(
                Image("plantBackground18")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width)
                    .ignoresSafeArea(edges: .vertical)
                    .overlay(Color.black.opacity(0.6))
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
}

struct LoginCardView: View {
    enum Field: Hashable {
        case email
        case password
    }
    @EnvironmentObject var auth: AuthViewModel
    
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
            VStack(spacing: 10) {
                Spacer()
                VStack(alignment: .leading, spacing: 5) {
                    Text("Welcome back")
                        .font(.system(size: 24))
                    Text("Log in to continue")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .padding(.vertical, 25)
                .padding(.top, 10)
                VStack(spacing: 25) {
                    HStack(spacing: 0) {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 18, height: 18)
                            .foregroundColor(Color("PrimaryGreen"))
                        TextField(text: $email) {
                            Text("Email")
                                .bold()
                                .font(.system(size: 14))
                            
                                .foregroundColor(Color("PrimaryGreen"))
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
                            .stroke(Color("PrimaryGreen"), lineWidth: 1))
                    .onTapGesture {
                        isFocused = .email
                    }
                    .padding(.horizontal)
                
                
                HStack(spacing: 0) {
                    Image(systemName: "lock.fill")
                        .resizable()
                            .scaledToFit()
                            .frame(width: 18, height: 18)
                        .foregroundColor(Color("PrimaryGreen"))
                    SecureField(text: $password) {
                        Text("Password")
                            .bold()
                            .font(.system(size: 14))
                            .foregroundColor(Color("PrimaryGreen"))
                    }
                        .padding(.leading, 10)
                        .frame(maxHeight: 50)
                        .focused($isFocused, equals: .password)
                    
                }
                
                .padding()
                .frame(maxHeight: 50)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color("PrimaryGreen"), lineWidth: 1)
                        )
                .onTapGesture {
                    isFocused = .password
                }
                .padding(.horizontal)
                }
                HStack {
                    Spacer()
                    Button(action: {
                        // navigate here
                    }) {
                        Text("Forgot Password")
                            .padding(.horizontal)
                        
                            .foregroundColor(Color("PrimaryGreen"))
                            .font(.system(size: 14))
                    }
                    .padding(.vertical, 10)
                }
                Spacer()
                Button(action: {
                    if email.isEmpty || password.isEmpty {
                        self.showToast = true
                    } else {
                        Task {
                            await auth.signIn(email: email, password: password)
                            
                        }
                    }
                }) {
                    Text("Log in")
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .bold()
                        .foregroundColor(Color(.white))
                        .background(
                            Color("PrimaryGreen")
                            
                        )
                        .cornerRadius(25)
                        .padding(.horizontal)
                        .padding(.vertical, 5)
//                        .padding(.vertical)
                        .shadow(color: .black.opacity(0.4), radius: 4, x: 0, y: 4)
                }
                HStack{
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray)
                        .opacity(0.5)
                    Text("or log in with")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.horizontal, 2)
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray)
                        .opacity(0.5)
                }
                .padding(.top)
                HStack{
                    Image("GoogleLogoBlack")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                        .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.black, lineWidth: 2)
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                        .shadow(color: .black.opacity(0.3), radius: 4, x: 0, y: 6)
                        .padding()
                    
                    Image("AppleLogoBlack")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                        .background(.black)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                            )
                        .shadow(color: .black.opacity(0.3), radius: 4, x: 0, y: 6)
                        .padding()
                        
                }
                Spacer()
                VStack() {
                    HStack {
                        Text("Don't have an account?")
                            .foregroundStyle(.gray)
                            .font(.system(size: 14))
                        
                        Button(action: {
                            path.append(AuthRoutes.signup)
                            }) {
                                   Text("Sign up")
                                    .overlay(
                                        Rectangle()
                                            .fill(Color("PrimaryGreen"))
                                            .frame(width: 50, height: 1)
                                            .offset(y: 2)
                                        , alignment: .bottom
                                    )
                                    .foregroundColor(Color("PrimaryGreen"))
                                    .font(.system(size: 14))
//                                    .bold()
                                    
                                
                                    .padding(.vertical)
                               }
                    }
                    .padding(.bottom, 40)
                }
                .frame(maxWidth: .infinity, alignment: .bottom)
                
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height * 0.7)
            .background(Color("Card5"))
            .cornerRadius(40)
        }
        .ignoresSafeArea(.container)
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
        }
    }
}

#Preview {
    LoginView(path: .constant(NavigationPath()))
}
