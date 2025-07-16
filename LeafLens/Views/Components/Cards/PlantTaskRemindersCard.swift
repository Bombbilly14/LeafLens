//
//  PlantTaskRemindersCard.swift
//  LeafLens
//
//  Created by William German on 7/14/25.
//

import SwiftUI

struct PlantTaskRemindersCard: View {
//    var plant: Plant
    @State private var waterToggle: Bool = false
    var nickname: String = "Green Herbert"
    var genusName: String = "Alocasia infinitumss"
    var plantSection: String = "Kitchen"
    @State var isExpanded: Bool = false
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 10){
                VStack{
                    Image("plantBackground")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 75, height: 75)
                        .cornerRadius(15)
                }
                .frame(width: 75, height: 75)
//                    .padding(.horizontal)
                VStack(alignment: .leading, spacing: 5){
                    Text(nickname)
                        .font(.system(size: 18))
                    
                    Text(plantSection)
                        .font(.system(size: 14))
                        .foregroundColor(Color(.darkGray))
                }
                Spacer()
                ZStack {
                    Image(systemName: "ellipsis")
                        .foregroundColor(.black)
                        .rotationEffect(.degrees(90))
                    
                }
            }
            Divider()
//                    .padding(.horizontal)
            VStack(spacing: 15) {
            TaskCard(taskType: .fertilizing, isCompleted: $waterToggle, date: "Today • 3PM")
            TaskCard(taskType: .watering, isCompleted: $waterToggle, date: "Upcoming • 6/25")
            }
            .padding(.vertical)
            .padding(.horizontal, 8)
        }
                    .frame(maxHeight: 400, alignment: .top)
                    .padding()
                    .background(Color(.white))
                    .cornerRadius(25)
//            ScrollView(.vertical, showsIndicators: false) {
//            VStack(spacing: 5){
////                Text("...")
////                    .font(.system(size: 30))
////                    .frame(maxWidth: .infinity, alignment: .trailing)
////                    .padding(.horizontal)
//                VStack() {
//                    Image("plantBackground")
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .frame(width: 350, height: 225)
////                        .frame(maxWidth: .infinity, maxHeight: .infinity)
//                        .cornerRadius(15)
//                        .padding(.horizontal)
//                        .padding(.top)
//                    
//
//                }
////                Spacer()
//                VStack(alignment: .leading, spacing: 5) {
//                    HStack{
//                        Text(nickname)
//                            .font(.system(size: 24))
//                        Spacer()
//                        Text("?")
//                    }
//                    Text(genusName)
//                        .font(.system(size: 14))
//                        .italic()
//                }
//                .padding(.horizontal)
//                
//                    VStack() {
//                        Text("Due Today")
//                            .frame(maxWidth: .infinity, alignment: .leading)
//                            .bold()
//                            .font(.system(size: 16))
//                        TaskCard(taskType: .fertilizing, isCompleted: $waterToggle, date: "Today • 3PM")
//                        TaskCard(taskType: .watering, isCompleted: $waterToggle, date: "Upcoming • 6/25")
//                        HStack(spacing: 50){
//                            Button(action: {}) {
//                                Text("Skip")
//                                    .font(.system(size: 14))
//                                    .foregroundColor(.black)
//                                    .bold()
//                                    .frame(width: 75)
//                                    .padding()
//                                    .background(Color("SecondaryButtons1"))
//                                    .cornerRadius(10)
//                            }
//                            //                    Spacer()
//                            Button(action: {}) {
//                                Text("Done")
//                                    .font(.system(size: 14))
//                                    .foregroundColor(.white)
//                                    .bold()
//                                    .frame(width: 75)
//                                    .padding()
//                                    .background(Color("BackgroundGreenApp"))
//                                    .cornerRadius(10)
//                            }
//                        }
//                        //                    .padding()
//                        
//                    }
//                    .padding(.top, 32)
//                    .padding(.horizontal)
//                VStack(alignment: .leading) {
//                    Text("Upcoming")
//                        .bold()
//                        .font(.system(size: 16))
//                    TaskCard(taskType: .watering, isCompleted: $waterToggle, date: "Upcoming • 6/25")
//                }
//                .padding()
//                
//                }
//            }
//            .frame(maxHeight: 600, alignment: .top)
//            .background(Color(.white))
//            .cornerRadius(25)

    }
}

#Preview {
    PlantTaskRemindersCard()
        .background(Color(.black))
}
