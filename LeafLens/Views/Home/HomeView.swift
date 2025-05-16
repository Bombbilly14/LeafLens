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
    var body: some View {
        VStack {
            
            VStack {
                HStack{
                    Text("main buttons here")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            
            HStack {
                Text("Tasks and reminders")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color("BackgroundGreenApp"))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            VStack {
                HStack {
                    Text("Commonly snapped plants")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(Color("BackgroundGreenApp"))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20){
                        PlantCard(title: "Prayer Plant", desc: "some genus or species", image: "plantBackground")
                        PlantCard(title: "Prayer Plant", desc: "some genus or species", image: "plantBackground", nickname: "my love")
                        PlantCard(title: "Prayer Plant", desc: "some genus or species", image: "plantBackground", nickname: "my love")
                    }
                    .padding()
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, -16)
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal)
        .background(Color("Card5")) // or card 2?
        .ignoresSafeArea()
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack() {
                    Text("Home")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                    Button("Nav", systemImage: "person.crop.circle", action: {
                        print("nav to profile")
                    })
                    .labelStyle(.iconOnly)
                    .foregroundColor(.white)
                    .font(.system(size: 25))
//                    Image(systemName: "person.crop.circle")
//                        .foregroundColor(.white)
//                        .font(.system(size: 25))
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}
//
#Preview {
    HomeView(path: .constant(NavigationPath()))
    
}
//
//struct noPlantsYetView: View {
//    var body: some View {
//        ZStack {
//            VStack(spacing: 16) {
//                Image("plantNoBg2")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(maxHeight: 150)
//                Text("Snap a plant and start growing!")
//                    .font(.headline)
//                Text("Snap your favorite plant or upload an image to get personalized care reminders and track its growth")
//                    .foregroundColor(.gray)
//                    .font(.footnote)
//                    .multilineTextAlignment(.center)
//                Button(action: {}) {
//                    HStack{
//                        Text("Start Growing")
//                        
//                        ZStack {
//                            Image(systemName: "camera.fill")
//                        }
//                        
//                        
//                    }
//                    .font(.system(size: 14))
//                }
//                
//                .frame(maxWidth: .infinity, minHeight: 35)
//                .padding(.horizontal)
//                .background(Color("BackgroundGreenApp"))
//                .cornerRadius(15)
//                .foregroundColor(.white)
//                .shadow(color: Color.black.opacity(0.15), radius: 6, x: 0, y: 2)
//            }
//        }
//        .padding()
//        .frame(width: 300, height: 300)
//        .background(RoundedRectangle(cornerRadius: 16)
//             .fill(Color("Card2"))
//             .shadow(color: Color.white.opacity(0.4),
//                radius: 6, x: -4, y: -4)
//             .shadow(color: Color.black.opacity(0.15),
//                radius: 4, x: 4, y: 4)
//        )
//    }
//}
