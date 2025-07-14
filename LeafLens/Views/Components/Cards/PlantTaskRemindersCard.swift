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
    var tasks = 1
    var nickname: String = "Green Herbert"
    var genusName: String = "Alocasia infinitum"
    var plantSection: String = "Kitchen"
    @State var isExpanded: Bool = false
    var body: some View {
        if tasks > 0 {
            ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 5){
//                Text("...")
//                    .font(.system(size: 30))
//                    .frame(maxWidth: .infinity, alignment: .trailing)
//                    .padding(.horizontal)
                VStack() {
                    Image("plantBackground")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 350, height: 225)
//                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .cornerRadius(15)
                        .padding(.horizontal)
                        .padding(.top)
                    

                }
//                Spacer()
                VStack(alignment: .leading, spacing: 5) {
                    HStack{
                        Text(nickname)
                            .font(.system(size: 24))
                        Spacer()
                        Text("?")
                    }
                    Text(genusName)
                        .font(.system(size: 14))
                        .italic()
                }
                .padding(.horizontal)
                
                    VStack() {
                        Text("Due Today")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .bold()
                            .font(.system(size: 16))
                        TaskCard(taskType: .fertilizing, isCompleted: $waterToggle, date: "Today • 3PM")
                        TaskCard(taskType: .watering, isCompleted: $waterToggle, date: "Upcoming • 6/25")
                        HStack(spacing: 50){
                            Button(action: {}) {
                                Text("Skip")
                                    .font(.system(size: 14))
                                    .foregroundColor(.black)
                                    .bold()
                                    .frame(width: 75)
                                    .padding()
                                    .background(Color("SecondaryButtons1"))
                                    .cornerRadius(10)
                            }
                            //                    Spacer()
                            Button(action: {}) {
                                Text("Done")
                                    .font(.system(size: 14))
                                    .foregroundColor(.white)
                                    .bold()
                                    .frame(width: 75)
                                    .padding()
                                    .background(Color("BackgroundGreenApp"))
                                    .cornerRadius(10)
                            }
                        }
                        //                    .padding()
                        
                    }
                    .padding(.top, 32)
                    .padding(.horizontal)
                VStack(alignment: .leading) {
                    Text("Upcoming")
                        .bold()
                        .font(.system(size: 16))
                    TaskCard(taskType: .watering, isCompleted: $waterToggle, date: "Upcoming • 6/25")
                }
                .padding(.top)
                .padding(.horizontal)
                
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 600, alignment: .top)
            .background(Color("Card10"))
            .cornerRadius(25)
        } else {
            
        }
    }
}

#Preview {
    PlantTaskRemindersCard()
        .background(Color("Card5"))
}
