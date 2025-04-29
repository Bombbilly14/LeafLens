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
        VStack {
            LoginLogoView()
            
            
            VStack {
                Text("Sign Up")
                    .font(.title)
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
                
                HStack {
                    SecureField("Confirm Password", text: $confirmPassword)
                        .textFieldStyle(.roundedBorder)
                        .focused($isFocused, equals: .confirmPassword)
                    
                }
                .padding(.vertical, 10)
                .contentShape(Rectangle())
                .onTapGesture {
                    isFocused = .confirmPassword
                }
                //TODO: make toast show each outcome
                Button(action: {
                    print("sign up \(email),")
                    guard !email.isEmpty, !password.isEmpty, !confirmPassword.isEmpty, password == confirmPassword else {
                        print("passwords do not match")
                        self.showToast = true
                        return
                    }
                    Task {
                        do {
                            try await auth.signUp(email: email, password: password)
                            print("signed up")
                        } catch {
                            print("error, \(error)")
                            self.error = error
                        }
                    }
                    
                }) {
                    Text("Sign Up")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(.green)
                        .cornerRadius(10)
                    
                    
                }
            }
            .padding()
            .frame(maxWidth: 350)
            .background(Color(.systemBackground))
            .cornerRadius(20)
            .shadow(radius: 5)
            .padding()
            HStack {
                Text("Already have an account?")
                Button("Log in") {
                    dismiss()
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color(.secondarySystemBackground)
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
#Preview {
    SignupView()
}
