//
//  SignupView.swift
//  LeafLens
//
//  Created by William German on 4/24/25.
//
import SwiftUI

struct SignupView: View {
    enum Field: Hashable {
        case email
        case password
        case confirmPassword
    }
    
    @EnvironmentObject var auth: AuthService
    @Environment(\.dismiss) private var dismiss
    
    @FocusState private var isFocused: Field?
    
    @State var email: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    @State var showToast: Bool = false
    @State var error: Error?
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                LoginLogoView()
                VStack(spacing: 5) {
                    Spacer()
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Sign up")
                            .font(.system(size: 24))
                        Text("Create an account to continue")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .padding(.vertical, 25)
                    VStack(spacing: 15) {
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
                                .stroke(Color("BackgroundGreenApp"), lineWidth: 1))
                        .onTapGesture {
                            isFocused = .email
                        }
                        .padding(.horizontal)
                        
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
                        .padding(.horizontal)
                        
                        HStack(spacing: 0) {
                            Image(systemName: "lock.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 18, height: 18)
                                .foregroundColor(Color("BackgroundGreenApp"))
                            SecureField(text: $password) {
                                Text("Confirm Password")
                                    .bold()
                                    .font(.system(size: 14))
                                    .foregroundColor(Color("BackgroundGreenApp"))
                            }
                            .padding(.leading, 10)
                            .frame(maxHeight: 50)
                            .focused($isFocused, equals: .confirmPassword)
                            
                        }
                        .padding()
                        .frame(maxHeight: 50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color("BackgroundGreenApp"), lineWidth: 1)
                        )
                        .onTapGesture {
                            isFocused = .confirmPassword
                        }
                        .padding(.horizontal)
                        
                    }
                    Spacer()
                    Button(action: {
                        guard !email.isEmpty, !password.isEmpty, !confirmPassword.isEmpty, password == confirmPassword else {
                            self.showToast = true
                            return
                        }
                        Task {
                            do {
                                try await auth.signUp(email: email, password: password)
                            } catch {
                                print("error, \(error)")
                                self.error = error
                            }
                        }
                    }) {
                        Text("Sign up")
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .bold()
                            .foregroundColor(Color(.white))
                            .background(
                                Color("BackgroundGreenApp")
                                
                            )
                            .cornerRadius(25)
                            .padding(.horizontal)
                            .padding(.vertical, 15)
                            .shadow(color: .black.opacity(0.4), radius: 4, x: 0, y: 4)
                    }
                    HStack{
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.gray)
                            .opacity(0.5)
                        Text("or sign up with")
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
                    VStack {
                        HStack {
                            Text("Already have an account? ")
                                .foregroundStyle(.gray)
                                .font(.system(size: 14))
                            
                            Button(action: {
                                dismiss()
                            }) {
                                Text("Log in")
                                    .overlay(
                                        Rectangle()
                                            .fill(Color("BackgroundGreenApp"))
                                            .frame(width: 50, height: 1)
                                            .offset(y: 2)
                                        , alignment: .bottom
                                    )
                                    .foregroundColor(Color("BackgroundGreenApp"))
                                    .font(.system(size: 14))
                                    .padding(.vertical)
                            }
                        }
                        
                        .padding(.bottom, 30)
                    }
                    
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height * 0.7)
                .background(Color("Card2"))
                .cornerRadius(40)
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
            .ignoresSafeArea()
        }
    }
        
    
//    var body: some View {
//        VStack {
//            LoginLogoView()
//            
//            
//            VStack {
//                Text("Sign Up")
//                    .font(.title)
//                    .bold()
//                
//                HStack {
//                    TextField("Email", text: $email)
//                        .keyboardType(.emailAddress)
//                        .textInputAutocapitalization(.never)
//                        .focused($isFocused, equals: .email)
//                        .textFieldStyle(.roundedBorder)
//
//                    
//                }
//                .padding(.vertical, 10)
//                .contentShape(Rectangle())
//                .onTapGesture {
//                    isFocused = .email
//                }
//                
//                HStack {
//                    SecureField("Password", text: $password)
//                        .textFieldStyle(.roundedBorder)
//                        .focused($isFocused, equals: .password)
//                    
//                }
//                .padding(.vertical, 10)
//                .contentShape(Rectangle())
//                .onTapGesture {
//                    isFocused = .password
//                }
//                
//                HStack {
//                    SecureField("Confirm Password", text: $confirmPassword)
//                        .textFieldStyle(.roundedBorder)
//                        .focused($isFocused, equals: .confirmPassword)
//                    
//                }
//                .padding(.vertical, 10)
//                .contentShape(Rectangle())
//                .onTapGesture {
//                    isFocused = .confirmPassword
//                }
//                //TODO: make toast show each outcome
//                Button(action: {
//                    print("sign up \(email),")
//                    guard !email.isEmpty, !password.isEmpty, !confirmPassword.isEmpty, password == confirmPassword else {
//                        print("passwords do not match")
//                        self.showToast = true
//                        return
//                    }
//                    Task {
//                        do {
//                            try await auth.signUp(email: email, password: password)
//                            print("signed up")
//                        } catch {
//                            print("error, \(error)")
//                            self.error = error
//                        }
//                    }
//                    
//                }) {
//                    Text("Sign Up")
//                        .frame(maxWidth: .infinity)
//                        .padding()
//                        .foregroundColor(.white)
//                        .background(.green)
//                        .cornerRadius(10)
//                    
//                    
//                }
//            }
//            .padding()
//            .frame(maxWidth: 350)
//            .background(Color(.systemBackground))
//            .cornerRadius(20)
//            .shadow(radius: 5)
//            .padding()
//            HStack {
//                Text("Already have an account?")
//                Button("Log in") {
//                    dismiss()
//                }
//            }
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(
//            Color(.secondarySystemBackground)
//                .ignoresSafeArea()
//                .dismissKeyboardOnTap()
//        )
//        .showToast(
//            isPresented: $showToast,
//            message: "Email and password must not be empty!",
//            backgroundColor: .red,
//            textColor: .white,
//            duration: 3
//        )
//    }

}
#Preview {
    SignupView()
}
