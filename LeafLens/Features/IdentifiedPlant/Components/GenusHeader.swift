//
//  GenusHeader.swift
//  LeafLens
//
//  Created by William German on 5/29/25.
//

import SwiftUI

struct GenusHeader: View {
    @State private var showConfidence = false

    var body: some View{
        HStack() {
            ZStack {
                Ellipse()
                    .fill(Color.black.opacity(0.3))
                    .frame(width: 60, height: 20)
                    .blur(radius: 4)
                    .offset(y: 110)
                // plant.img_url
                Image("GeneratedStrelitziaFixed")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 175, height: 225)
                    .clipped()
            }
            VStack(alignment: .leading, spacing: 4) {
                Text("87% confidence in this identification")
                    .font(.caption)
                    .foregroundColor(.white)
                    .padding(8)
                    .background(Color.black.opacity(0.8))
                    .cornerRadius(8)
                    .opacity(showConfidence ? 1 : 0)
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.top, 32)
                    .frame(maxWidth: .infinity)
                HStack {
                    //plant.genus
                    Text("Dieffenbachia")
                        .bold()
                        .font(.system(size: 28))
                        .foregroundColor(.white)
                    Button(action: {
                        showConfidence.toggle()
                    }) {
                        Image(systemName: "info.circle")
                            .foregroundColor(.white)
                            .font(.system(size: 14))
                            .offset(y: -8)
                    }
                }
                
                //plant.commonName
                Text("Dumb Cane")
                    .italic()
                    .bold()
                    .foregroundColor(.testAccentColor5)
                
            }
            .padding(.bottom, 75)
            .padding(.trailing, 10)
            .padding(.leading, -10)
        }
        .padding(.leading, 10)
        .padding(.bottom)
    }
}


#Preview {
    GenusHeader()
}
