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
                        .foregroundColor(.backgroundGreenApp)
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Lighting")
                            .font(.system(size: 14))
                            .bold()
                            .foregroundColor(Color("BackgroundGreenApp"))
                        //plant.light
                        Text("Bright, indirect")
                            .font(.system(size: 12))
                    }
                }
                HStack(spacing: 3) {
                    Image(systemName: "humidity.fill")
                        .font(.system(size: 25))
                        .foregroundColor(.backgroundGreenApp)
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Humidity")
                            .font(.system(size: 14))
                            .bold()
                            .foregroundColor(.backgroundGreenApp)
                        //plant.humidity
                        Text("50-70%")
                            .font(.system(size: 12))
                    }
                }
                HStack(spacing: 3){
                    Image(systemName: "thermometer")
                        .font(.system(size: 30))
                        .foregroundColor(.backgroundGreenApp)
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Temperature")
                            .font(.system(size: 14))
                            .bold()
                            .foregroundColor(.backgroundGreenApp)
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
                        .foregroundColor(.backgroundGreenApp)
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Water Amount")
                            .font(.system(size: 14))
                            .bold()
                            .foregroundColor(.backgroundGreenApp)
                        Text("Heavy")
                            .font(.system(size: 12))
                    }
                }
                HStack(spacing: 3) {
                    Image(systemName: "calendar")
                        .font(.system(size: 30))
                        .foregroundColor(.backgroundGreenApp)
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Water Freq.")
                            .font(.system(size: 14))
                            .bold()
                            .foregroundColor(.backgroundGreenApp)
                        Text("1/week")
                            .font(.system(size: 12))
                    }
                }
            }

        }
            
        .padding()
        
        .background(Color("Card2"))
        .cornerRadius(20)
        .padding(.bottom)
    }
}

#Preview {
    QuickInfoCard()
}
