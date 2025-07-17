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
        VStack(spacing: 0) {
            if image != nil {
                Image(image!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 100)
                    .clipped()
            }
            VStack(alignment: .leading, spacing: 5) {
                Text(title + ((nickname ?? "").isEmpty ? "" : " (\(nickname!))"))
                    .font(.system(size: 12))
                    .foregroundStyle(Color("BackgroundGreenApp"))
                    .bold()
                Text(desc)
                    .font(.system(size: 10))
                    .foregroundStyle(Color.gray)
                
            }
            .padding(.vertical)
            .padding(.horizontal, 10)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(width: 150, height: 175, alignment: .top)
        .background(Color("Card2"))
        .mask {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
        }
        .shadow(color: .black.opacity(0.2), radius: 7, x: 6, y: 6)

    }
}

#Preview {
    PlantCard(title: "Prayer Plant", desc: "Geooartubnasdfsadf", image: "plantBackground")
}
