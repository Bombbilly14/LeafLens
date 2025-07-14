//
//  QuickInfoCard2.swift
//  LeafLens
//
//  Created by William German on 5/29/25.
//
import SwiftUI

struct QuickInfoCard2: View {
    var body: some View {
        HStack{
            VStack(spacing: 10) {
                HStack(spacing: 4){
                    Image(systemName: "hazardsign")
                        .foregroundColor(.black)
//                                        .padding()
                        .frame(width: 40, height: 40)
                        .background(Color("Card5"))
                        .cornerRadius(10)
                        .shadow(color: .black.opacity(0.2), radius: 4, x: 2, y: 4)
                    Text("Toxicity")
                        .font(.system(size: 14))
                        .foregroundColor(Color("SecondaryButtons1"))
                        .bold()
                }

                        Text("Toxic")
                            .font(.system(size: 16))
                            .foregroundColor(.white)
                            .bold()
            }
            .padding(.vertical, 5)
            .frame(width: 125, height: 90)
            .background(Color("TestAccentColor3"))
            .cornerRadius(15)
//                            .shadow(color: .black.opacity(0.4), radius: 4, x: 2, y: 4)
            
            HStack(spacing: 10) {
                Image(systemName: "slider.horizontal.3")
                    .foregroundColor(.white)
                VStack(alignment: .leading, spacing: 5) {
                    Text("Difficulty")
                        .font(.system(size: 14))
                        .foregroundColor(Color("SecondaryButtons"))
                    Text("Easy")
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                        .bold()
                }
            }
            .padding(.vertical)
            .frame(width: 125, height: 90)
            .background(Color("TestAccentColor3"))
            .cornerRadius(15)
            .shadow(color: .black.opacity(0.4), radius: 4, x: 2, y: 4)
            HStack(spacing: 10){
                Image(systemName: "leaf")
                    .foregroundColor(.white)
                VStack(alignment: .leading, spacing: 5) {
                    Text("Soil Type")
                        .font(.system(size: 14))
                        .foregroundColor(Color("SecondaryButtons"))
                    Text("Peat, well-draining")
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                        .bold()
                }
            }
            .padding(.vertical)
            .frame(width: 125, height: 90)
            .background(Color("TestAccentColor3"))
            .cornerRadius(15)
            .shadow(color: .black.opacity(0.4), radius: 4, x: 2, y: 4)
            
        }
        .padding(.horizontal, 8)
        .padding(.bottom, 10)
    }
}

#Preview {
    QuickInfoCard2()
}
