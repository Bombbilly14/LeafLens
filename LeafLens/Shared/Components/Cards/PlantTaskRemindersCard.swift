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
    @State var isExpanded: Bool = true
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 20) {
                VStack{
                    Image("plantBackground")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 75, height: 75)
                        .cornerRadius(15)
                }
                .frame(width: 75, height: 75)
                VStack(alignment: .leading, spacing: 5){
                    Text(nickname)
                        .font(.system(size: 18))
                    
                    Text(plantSection)
                        .font(.system(size: 14))
                        .italic()
                        .foregroundColor(Color(.darkGray))
                }
                Spacer()
//                ZStack {
//                    Button(action: {}) {
//                        Image(systemName: "ellipsis")
//                            .foregroundColor(.black)
//                            .rotationEffect(.degrees(90))
//                        
//                    }
//                    .padding()
//                    
//                }
                Menu {
                    Button(action: {}) {
                        Text("Edit plant details")
                            .font(.system(size: 5, weight: .bold))
                            .foregroundStyle(Color.white)
                            .padding()
                        
                    }
                    Button("See all tasks") {
                        
                    }
                    Button("idk smthn") {
                        
                    }
                } label: {
                    Image(systemName: "ellipsis")
                        .foregroundColor(.black)
                        .rotationEffect(.degrees(90))
                        .padding(25)
                    
                    }
                
            }
            Divider()
            VStack(spacing: 15) {
            TaskCard(taskType: .fertilizing, isCompleted: $waterToggle, date: "Today • 3PM")
            TaskCard(taskType: .watering, isCompleted: $waterToggle, date: "Upcoming • 6/25")
            }
            .padding(.vertical)
            .padding(.horizontal, 8)
            
            HStack(spacing: 40) {
                Spacer()
                Button(action: {}) {
                    Text("Skip")
                        .font(.system(size: 14, weight: .semibold))

                        .foregroundStyle(Color.black)
                        .padding()

                    
                }
                .frame(width: 100, height: 50)
                .background(
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color("SecondaryYellow"))
                )
                .disabled(!isExpanded)
                .opacity(isExpanded ? 1.0 : 0.5)
                Button(action: {}) {
                    Text("Complete")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundStyle(Color.white)
                        .padding()
                    
                }
                .frame(width: 100, height: 50)
                .background(
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color("PrimaryGreen"))
                )
                .disabled(!isExpanded)
                .opacity(isExpanded ? 1.0 : 0.5)
                Spacer()
            }
        }
        .padding()
        .background(Color(.white))
        .cornerRadius(25)
        .shadow(color: Color.black.opacity(0.1), radius: 6, x: 0, y: 2)

    }
}

#Preview {
    PlantTaskRemindersCard()
}
