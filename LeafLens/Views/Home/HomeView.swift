//
//  HomeView.swift
//  LeafLens
//
//  Created by William German on 4/24/25.
//

//home view, navigate here after login

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var auth: AuthService
    @Binding var path: NavigationPath
    var placeholderCount: Int = 0
    
    @State var error: Error?
    var body: some View {
        VStack {
            if placeholderCount > 0 {
                // search?
                // daily care reminder
                // my plants
                // upcoming care schedule
                VStack {
                    HStack {
                        Text("Todays Schedule")
                            .bold()
                        Spacer()
                        HStack {
                            Text("See all")
                            Image(systemName: "arrow.right")
                        }
                    }
                }
                
                VStack {
                    HStack {
                        Text("My Plants")
                            .bold()
                        Spacer()
                        HStack {
                            Text("See all")
                            Image(systemName: "arrow.right")
                        }
                    }
                }
                VStack {
                    HStack {
                        Text("Upcoming Care Schedule")
                            .bold()
                        Spacer()
                        HStack {
                            Text("See all")
                            Image(systemName: "arrow.right")
                        }
                    }
                }
            } else {
                noPlantsYetView()
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal)
        .background(Color("Card5")) // or card 2?
        .ignoresSafeArea()
        .navigationTitle(Text("Home"))
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    HomeView(path: .constant(NavigationPath()))
    
}

struct noPlantsYetView: View {
    var body: some View {
        ZStack {
            VStack(spacing: 16) {
                Image("plantNoBg2")
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 150)
                Text("Snap a plant and start growing!")
                    .font(.headline)
                Text("Snap your favorite plant or upload an image to get personalized care reminders and track its growth")
                    .foregroundColor(.gray)
                    .font(.footnote)
                    .multilineTextAlignment(.center)
                Button(action: {}) {
                    HStack{
                        Text("Start Growing")
                        
                        ZStack {
                            Image(systemName: "camera.fill")
                        }
                        
                        
                    }
                    .font(.system(size: 14))
                }
                
                .frame(maxWidth: .infinity, minHeight: 35)
                .padding(.horizontal)
                .background(Color("BackgroundGreenApp"))
                .cornerRadius(15)
                .foregroundColor(.white)
                .shadow(color: Color.black.opacity(0.15), radius: 6, x: 0, y: 2)
            }
        }
        .padding()
        .frame(width: 300, height: 300)
        .background(RoundedRectangle(cornerRadius: 16)
             .fill(Color("Card2"))
             .shadow(color: Color.white.opacity(0.4),
                radius: 6, x: -4, y: -4)
             .shadow(color: Color.black.opacity(0.15),
                radius: 4, x: 4, y: 4)
        )
    }
}
