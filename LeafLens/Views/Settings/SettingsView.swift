//
//  SettingsView.swift
//  LeafLens
//
//  Created by William German on 4/28/25.
//
import SwiftUI
import UIKit


struct SettingsView: View {
    @EnvironmentObject var auth: AuthService
    @Binding var path: NavigationPath
    
    @State var notificationToggle = true
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack {
                VStack(alignment: .leading){
                    Text("Account")
                        .foregroundStyle(Color.gray)
                        .font(.system(size: 12))
                        .padding(.top)
                    VStack(spacing: 25) {
                        Button(action: {
                            path.append(SettingsRoutes.manageAccount)
                            
                        }) {
                            
                            HStack{
                                HStack(spacing: 10) {
                                    Image(systemName: "person.fill" )
                                        .foregroundStyle(Color.gray)
                                    
                                    Text("Manage account")
                                        .bold()
                                }
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundStyle(Color.gray)
                            }
                        }
                        .foregroundStyle(Color.black)
                        Divider()
                        Button(action: {
                            notificationToggle.toggle()
                            let hapticFeed = UIImpactFeedbackGenerator(style: .medium)
                            hapticFeed.impactOccurred()
                        }) {
                            
                            HStack{
                                HStack(spacing: 10) {
                                    Image(systemName: "bell.fill" )
                                        .foregroundStyle(Color.gray)
                                    
                                    Text("Notifications")
                                        .bold()
                                    
                                }
                                Spacer()
                                ZStack(alignment: notificationToggle ? .trailing : .leading) {
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(notificationToggle ? Color("PrimaryGreen") : Color.gray.opacity(0.2))
                                        .frame(width: 50, height: 28)
                                    Circle()
                                        .fill(Color.white)
                                        .frame(width: 22, height: 22)
                                        .padding(.horizontal, 3)
                                        .shadow(radius: 1)
                                    
                                }
                                .animation(.easeInOut(duration: 0.2), value: notificationToggle)
                            }
                        }
                        .buttonStyle(.plain)
                        .foregroundStyle(Color.black)
                        Divider()
                        Button(action: {}) {
                            
                            HStack{
                                HStack(spacing: 10) {
                                    Image(systemName: "leaf.fill" )
                                    
                                    Text("Upgrade to LeafLens+")
                                        .font(.system(size: 16, weight: .bold, design: .default))
                                        .italic()
                                    
                                }
                                .foregroundStyle(Color("PrimaryGreen"))
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundStyle(Color.gray)
                            }
                        }
                        .foregroundStyle(Color.black)
                        
                    }
                    .padding()
                    .padding(.vertical, 12)
                    .background(Color.white)
                    .cornerRadius(15)
                }
                .padding(.bottom)
                VStack(alignment: .leading){
                    Text("Support & About")
                        .foregroundStyle(Color.gray)
                        .font(.system(size: 12))
                        .padding(.top)
                    VStack(spacing: 25) {
                        
                        Button(action: {}) {
                            
                            HStack{
                                HStack(spacing: 10) {
                                    Image(systemName: "phone.fill" )
                                        .foregroundStyle(Color.gray)
                                    
                                    
                                    Text("Support")
                                        .bold()
                                }
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundStyle(Color.gray)
                            }
                        }
                        .foregroundStyle(Color.black)
                        Divider()
                        Button(action: {}) {
                            
                            HStack{
                                HStack(spacing: 10) {
                                    Image(systemName: "star.fill" )
                                        .foregroundStyle(Color.gray)
                                    
                                    
                                    Text("Write a review")
                                        .bold()
                                }
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundStyle(Color.gray)
                            }
                        }
                        .foregroundStyle(Color.black)
                        Divider()
                        Button(action: {}) {
                            
                            HStack{
                                HStack(spacing: 10) {
                                    Image(systemName: "exclamationmark.circle.fill" )
                                        .foregroundStyle(Color.gray)
                                    
                                    Text("Terms & Conditions")
                                        .bold()
                                }
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundStyle(Color.gray)
                            }
                        }
                        .foregroundStyle(Color.black)
                        
                    }
                    .padding()
                    .padding(.vertical, 12)
                    .background(Color.white)
                    .cornerRadius(15)
                    
                }
                VStack(alignment: .leading){
                    Text("Login")
                        .foregroundStyle(Color.gray)
                        .font(.system(size: 12))
                        .padding(.top)
                    VStack(spacing: 25) {
                        Button(action: {
                            Task {
                                try await auth.signOut()
                            }
                        }) {
                            
                            HStack{
                                HStack(spacing: 10) {
                                    Image(systemName: "rectangle.portrait.and.arrow.right.fill" )
                                        .foregroundStyle(Color.gray)
                                    
                                    
                                    Text("Sign out")
                                        .bold()
                                }
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundStyle(Color.gray)
                            }
                        }
                        .foregroundStyle(Color.black)
                        .padding(.bottom, 32)
                        Button(action: {
                            print("delete account pressed")
                        }) {
                            
                            HStack{
                                HStack(spacing: 10) {
                                    Text("Delete Account")
                                }
                                Spacer()

                            }
                        }
                        
                        .font(.system(size: 12))
                        .foregroundStyle(Color.red)
                    }
                    .padding()
                    .padding(.vertical, 12)
                    .background(Color.white)
                    .cornerRadius(15)
                    
                }
                .padding(.bottom, 32)

            }
            .padding(.bottom, 32)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .background(Color("Card5"))
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack(alignment: .top) {
                    Text("Settings")
                        .font(.system(size: 20))
                        .bold()
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}


#Preview {
    SettingsView(path: .constant(NavigationPath()))
}
