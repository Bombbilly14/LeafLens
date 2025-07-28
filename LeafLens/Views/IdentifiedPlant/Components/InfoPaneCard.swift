//
//  InfoPaneCard.swift
//  LeafLens
//
//  Created by William German on 5/29/25.
//

import SwiftUI
enum InfoPane {
    case general, tips, watering, soil
}
struct InfoPaneCard: View {
    @State private var infoPane: InfoPane = .general

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 20){
                Group {
                    Button(action: {
                        infoPane = .general
                    }) {
                        Text("About")
                            .font(.system(size: infoPane == .general ? 18 : 16))
                            .fontWeight(infoPane == .general ? .bold : .regular)
                            .foregroundColor(Color("PrimaryGreen"))
                    }
                    Text("|")
                        .foregroundColor(Color("PrimaryGreen"))
                    Button(action: {
                        infoPane = .watering
                    }) {
                        Text("Watering")
                            .font(.system(size: infoPane == .watering ? 18 : 16))
                            .fontWeight(infoPane == .watering ? .bold : .regular)
                            .foregroundColor(Color("PrimaryGreen"))
                    }
                    Text("|")
                        .foregroundColor(Color("PrimaryGreen"))
                    Button(action: {
                        infoPane = .soil
                    }) {
                        Text("Soil")
                            .font(.system(size: infoPane == .soil ? 18 : 16))
                            .fontWeight(infoPane == .soil ? .bold : .regular)
                            .foregroundColor(Color("PrimaryGreen"))
                    }
                Text("|")
                    .foregroundColor(Color("PrimaryGreen"))
                Button(action: {
                    infoPane = .tips
                }) {
                    Text("Tips")
                        .font(.system(size: infoPane == .tips ? 18 : 16))
                        .fontWeight(infoPane == .tips ? .bold : .regular)
                        .foregroundColor(Color("PrimaryGreen"))
                }
            }
        }
            .fixedSize(horizontal: true, vertical: false)
            Group {
                switch infoPane {
                case .general:
                    //plant.general_info
                    Text("Aloe is a hardy succulent known for its medicinal properties and easy-going nature. Originating from arid climates, Aloe thrives in dry, sunny conditions and is particularly drought-tolerant. Its thick, fleshy leaves store water, making it an excellent choice for low-maintenance plant lovers.")
                case .watering:
                    // plant.watering_info
                    Text("Let the soil dry out completely before watering deeply. During winter, watering frequency should be cut to once a month or less. Always pour out excess water from the saucer to prevent root rot.")
                case .soil:
                    // plant.watering_info
                    Text("soil here")
                case .tips:
                    // plant.care_tips
                    Text("Give your Aloe as much sunlight as possible—south or west-facing windows work best. Use a pot with drainage holes and a fast-draining soil mix to prevent root rot. Repot every couple of years to refresh soil and give growing roots more space.")
                }
            }
            .frame(height: 150, alignment: .topLeading)
            .font(.system(size: 15))
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.white)
        
        .cornerRadius(20)
    }
}

#Preview {
    InfoPaneCard()
        .padding()
        .background(Color("Card5"))
}
