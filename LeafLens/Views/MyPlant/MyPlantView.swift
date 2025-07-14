//
//  MyPlantView.swift
//  LeafLens
//
//  Created by William German on 6/3/25.
//
import SwiftUI

struct MyPlantView: View {
    @State private var waterToggle: Bool = false
    var body: some View {
        ZStack {
            Color("Card5")
                .ignoresSafeArea()
            CurvedBackground()
                .fill(Color("BackgroundGreenApp"))
                .ignoresSafeArea()
            
            VStack() {
                HStack() {
                    ZStack(alignment: .bottomTrailing) {
                        
                        Image("plantBackground")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                            .overlay(
                                Circle().stroke(Color("Card5"), lineWidth: 3)
                            )
                        Image(systemName: "camera.fill")
                            .foregroundColor(.black)
                            .background(Circle().fill(Color.white.opacity(0.9)).frame(width: 28, height: 28))
                            .frame(width: 30, height: 30)
                            .offset(x: -5, y: -5)
                    }
                    .frame(width: 150, height: 150)
                    Spacer()
                    VStack( spacing: 4) {
                            Text("nickname")
                                .bold()
                                .font(.system(size: 28))
                                .foregroundColor(.white)
                            
                        
                        Text("monstera deliciosa")
                            .italic()
                            .bold()
                            .foregroundColor(.testAccentColor5)
                        
                    }
                    .padding(.bottom, 30)
                    Spacer()
                }
                .padding(.horizontal)
//                HStack {
//                    // tags here or sumthn
//                }
                VStack {
                    HStack {
                        Text("Reminders")
                        Spacer()
                        Text("...")

                    }
                    .font(.system(size: 18))
                    .bold()
                    .foregroundColor(Color(.black))
                    .padding(.bottom)
                    TaskCard(taskType: .fertilizing, isCompleted: $waterToggle, date: "Today")
                    TaskCard(taskType: .watering, isCompleted: $waterToggle, date: "Upcoming • 6/25")
                    
                }
                .frame(maxWidth: .infinity)
                .padding()
//                .background(Color(.white))
                .cornerRadius(20)
                .padding(.top, 20)
                

                VStack(alignment: .leading) {
                    HStack {
                        Text("My Growth Timeline")
                            .font(.system(size: 18))
                            .bold()
                            .foregroundColor(Color(.black))
                        
                        Spacer()
                        Text("...")
                            .bold()
                            .font(.system(size: 22))
                    }
                    .padding(.bottom)
//                    .padding(.top)
                    Text("idk some timeline")
                }
                .frame(maxWidth: .infinity)
                .padding()
//                .background(Color.white)
                .cornerRadius(20)
                Spacer()
                VStack {
//                    HStack {
//                        Text("Care Guide")
//                            .font(.system(size: 20))
//                            .bold()
//                            .foregroundColor(Color(.black))
//
//                        Spacer()
//                    }
//                    .padding(.top)
                    InfoPaneCard()
                        .frame(maxWidth: .infinity)
                        .padding()
//                        .background(Color.white)
                        .cornerRadius(20)
                }
                .padding(.vertical)
                
            }
//            .padding(.horizontal)
            
        }
    }
}

#Preview {
    MyPlantView()
}
