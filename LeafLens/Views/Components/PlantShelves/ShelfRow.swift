//
//  ShelfRow.swift
//  LeafLens
//
//  Created by William German on 7/16/25.
//

import SwiftUI


struct ShelfRow: View {
    var body: some View {
        VStack {
            HStack{
                Text("My First Section")
                Spacer()
                Text("Edit")
                    .font(.system(size: 12))
                    .foregroundStyle(Color("BackgroundGreenApp"))
            }
            .padding()
            ScrollView(.horizontal, showsIndicators: false) {
                ZStack(alignment: .topLeading) {
                    VStack(alignment: .leading){
                        
                        HStack(alignment: .top, spacing: 16) {
                            PlantCard(title: "Prayer Plant", desc: "asd", image: "plantBackground")
                            PlantCard(title: "Prayer Plant", desc: "asd", image: "plantBackground")
                            PlantCard(title: "Prayer Plant", desc: "asd", image: "plantBackground")
                            PlantCard(title: "Prayer Plant", desc: "asd", image: "plantBackground")
                            PlantCard(title: "Prayer Plant", desc: "asd", image: "plantBackground")
                            PlantCard(title: "Prayer Plant", desc: "asd", image: "plantBackground")
                            PlantCard(title: "Prayer Plant", desc: "asd", image: "plantBackground")
                            PlantCard(title: "Prayer Plant", desc: "asd", image: "plantBackground")
                            PlantCard(title: "Prayer Plant", desc: "asd", image: "plantBackground")
                            PlantCard(title: "Prayer Plant", desc: "asd", image: "plantBackground")
                            PlantCard(title: "Prayer Plant", desc: "asd", image: "plantBackground")
                            PlantCard(title: "Prayer Plant", desc: "asd", image: "plantBackground")
                            PlantCard(title: "Prayer Plant", desc: "asd", image: "plantBackground")
                            PlantCard(title: "Prayer Plant", desc: "asd", image: "plantBackground")
                        }
                        .padding(.horizontal, 24)
                        .zIndex(1)
                        
                        HStack(spacing: 16) {
                            Image("plantShelfWood")
                                .resizable()
                                .frame(maxWidth: .infinity, maxHeight: 30, alignment: .leading)
                                .cornerRadius(5)
                                .shadow(color: Color.black.opacity(0.7), radius: 6, x: 6, y: 8)
                                .offset(x: 10, y: -20)
                                .zIndex(0)
                            
                        }
                        
                    }
                    
                }
                
            }
            HStack{
                Text("Kitchen")
                Spacer()
                Text("Edit")
                    .font(.system(size: 12))
                    .foregroundStyle(Color.testText)
            }
            .padding()
            ScrollView(.horizontal, showsIndicators: false) {
                ZStack(alignment: .topLeading) {
                    VStack(alignment: .leading){
                        HStack(alignment: .top, spacing: 16) {
                            PlantCard(title: "Prayer Plant", desc: "asd", image: "plantBackground")
                        }
                        .padding(.horizontal, 24)
                        .zIndex(1)
                        
                        HStack(spacing: 16) {
                            Image("plantShelfWood")
                                .resizable()
                                .frame(maxWidth: .infinity, maxHeight: 30, alignment: .leading)
                                .cornerRadius(5)
                                .shadow(color: Color.black.opacity(0.7), radius: 6, x: 6, y: 8)
                                .offset(x: 10, y: -20)
                                .zIndex(0)
                            
                        }
                        
                    }
                    
                }
                
            }
        }
        .padding(.vertical)
        
    }
}


#Preview {
    ShelfRow()
}
