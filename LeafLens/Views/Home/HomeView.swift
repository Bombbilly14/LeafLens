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
        ScrollView(.vertical, showsIndicators: false) {
            FunZone()
                .padding(.horizontal)

            HStack {
                Text("Today's Tasks")
                    .font(.system(size: 20))
//                    .foregroundColor(Color("BackgroundGreenApp"))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 32)
            .padding(.horizontal)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    PlantTaskRemindersCard()
                    PlantTaskRemindersCard()
                    PlantTaskRemindersCard()
                }
                .padding(.vertical)
                .padding(.leading)
            }
            
//            VStack {
//                HStack {
//                    Text("Commonly snapped plants")
//                        .font(.system(size: 20, weight: .bold))
//                        .foregroundColor(Color("BackgroundGreenApp"))
//                }
//                .frame(maxWidth: .infinity, alignment: .leading)
//                ScrollView(.horizontal, showsIndicators: false) {
//                    HStack(spacing: 20){
//                        PlantCard(title: "Prayer Plant", desc: "some genus or species", image: "plantBackground")
//                        PlantCard(title: "Prayer Plant", desc: "some genus or species", image: "plantBackground", nickname: "my love")
//                        PlantCard(title: "Prayer Plant", desc: "some genus or species", image: "plantBackground", nickname: "my love")
//                    }
//                    .padding()
//                }
//                .frame(maxWidth: .infinity)
//                .padding(.horizontal, -16)
//            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.bottom)
        .background(Color("Card5")) // or card 2?
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack() {
                    VStack() {
                        Text("Hello, GreenGoddess!")
                            .font(.system(size: 20))
                            .bold()
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("3 tasks, 1 overdue")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    Spacer()
                    Button(action: {}){
                        Image(systemName: "bell")
                            .foregroundStyle(Color("BackgroundGreenApp"))
                            .font(.system(size: 18))
                            .padding(10)
                            .background(Color.white)
                            .clipShape(Circle())

                    }
//                    Button("Nav", systemImage: "bell", action: {
//                        print("nav to profile")
//                    })
//                    .labelStyle(.iconOnly)
//                    .foregroundColor(.black)
//                    .font(.system(size: 18))
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
