//
//  PlantCard.swift
//  LeafLens
//
//  Created by William German on 4/28/25.
//

import SwiftUI

struct PlantCard: View {
    var title: String
    var desc: String
    var image: String?
    var nickname: String?
    
    var body: some View {
        HStack(spacing: 20) {
            if image != nil {
                Image(image!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .cornerRadius(15)
                    .clipped()
            }
            VStack {
                Text(title + ((nickname ?? "").isEmpty ? "" : " (\(nickname!))"))
                    .font(.system(size: 15))
                    .frame(maxWidth: 175, maxHeight: 75, alignment: .top)
                Spacer()
                Text(desc)
                    .font(.subheadline)
                
            }
            Image(systemName: "chevron.right")
                .padding(.leading)
                .foregroundColor(.gray)
        }
        .padding()
        .frame(width: 350, height: 125)
        .background(Color("Card2"))
        .mask {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
        }
        .shadow(color: .black.opacity(0.15), radius: 2, x: 2, y: 3)

    }
}

#Preview {
    PlantCard(title: "Prayer Plant", desc: "Geooartubnasdfsadf", image: "plantBackground", nickname: "nickname")
}
