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
    
    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
            
            Text(desc)
                .font(.subheadline)
                .foregroundColor(Color("Text"))
            
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color("Card2"))
                .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
        )
    }
}

#Preview {
    PlantCard(title: "Example Title", desc: "Example desc very long to see how this will wrap or not")
}
