//
//  QuickInfoCard.swift
//  LeafLens
//
//  Created by William German on 5/29/25.
//

import SwiftUI

struct QuickInfoCard: View {
    var body: some View {
        VStack(spacing: 15) {
            HStack(spacing: 10) {
                HStack(spacing: 3) {
                    Image(systemName: "sun.max.fill")
                        .font(.system(size: 30))
                        .foregroundColor(.primaryGreen)
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Lighting")
                            .font(.system(size: 14))
                            .bold()
                            .foregroundColor(Color("PrimaryGreen"))
                        //plant.light
                        Text("Bright, indirect")
                            .font(.system(size: 12))
                    }
                }
                HStack(spacing: 3) {
                    Image(systemName: "humidity.fill")
                        .font(.system(size: 25))
                        .foregroundColor(.primaryGreen)
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Humidity")
                            .font(.system(size: 14))
                            .bold()
                            .foregroundColor(.primaryGreen)
                        //plant.humidity
                        Text("50-70%")
                            .font(.system(size: 12))
                    }
                }
                HStack(spacing: 3){
                    Image(systemName: "thermometer")
                        .font(.system(size: 30))
                        .foregroundColor(.primaryGreen)
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Temperature")
                            .font(.system(size: 14))
                            .bold()
                            .foregroundColor(.primaryGreen)
                        // plant.temp
                        Text("60-80°F")
                            .font(.system(size: 12))
                    }
                }
            }
            HStack {
                HStack(spacing: 3){
                    Image(systemName: "drop.halffull")
                        .font(.system(size: 30))
                        .foregroundColor(.primaryGreen)
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Water Amount")
                            .font(.system(size: 14))
                            .bold()
                            .foregroundColor(.primaryGreen)
                        Text("Heavy")
                            .font(.system(size: 12))
                    }
                }
                HStack(spacing: 3) {
                    Image(systemName: "calendar")
                        .font(.system(size: 30))
                        .foregroundColor(.primaryGreen)
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Water Freq.")
                            .font(.system(size: 14))
                            .bold()
                            .foregroundColor(.primaryGreen)
                        Text("1/week")
                            .font(.system(size: 12))
                    }
                }
            }

        }
            
        .padding()
        
        .background(Color.white)
        .cornerRadius(20)
        .padding(.bottom)
    }
}

#Preview {
    QuickInfoCard()
}
