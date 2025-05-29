//
//  IdentifiedPlant.swift
//  LeafLens
//
//  Created by William German on 5/20/25.
//


import SwiftUI
enum InfoPane {
    case general, tips, watering
}
struct IdentifiedPlant: View {
    @State private var showConfidence = false
    @State private var infoPane: InfoPane = .general
    
    var body: some View {
        GeometryReader { geo in
            ZStack{
                Color("Card5")
                    .ignoresSafeArea()
                CurvedBackground()
                    .fill(Color("BackgroundGreenApp"))
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    VStack {
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
                                    .padding(.top, 30)
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
                            .padding(.bottom, 100)
                            .padding(.trailing, 10)
                            .padding(.leading, -10)
                        }
                        .padding(.leading, 10)
                        .padding(.bottom)
                        
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
                                        Text("200ml")
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
                        HStack{
                            HStack(spacing: 10){
                                Image(systemName: "hazardsign")
                                    .foregroundColor(.white)
                                VStack(alignment: .leading, spacing: 5) {
                                    Text("Toxicity")
                                        .font(.system(size: 14))
                                        .foregroundColor(Color("SecondaryButtons"))
                                    Text("Toxic")
                                        .font(.system(size: 12))
                                        .foregroundColor(.white)
                                        .bold()
                                }
                            }
                            .padding(.vertical)
                            .frame(maxWidth: 150)
                            .background(Color("TestAccentColor3"))
                            .cornerRadius(15)
                            .shadow(color: .black.opacity(0.4), radius: 4, x: 2, y: 4)
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
                            .frame(maxWidth: 150)
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
                            .frame(maxWidth: 150)
                            .background(Color("TestAccentColor3"))
                            .cornerRadius(15)
                            .shadow(color: .black.opacity(0.4), radius: 4, x: 2, y: 4)
                            
                        }
                        .padding(.horizontal, 8)
                        .padding(.bottom, 10)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            HStack(spacing: 15){
                                Button(action: {
                                    infoPane = .general
                                }) {
                                    Text("General Information")
                                        .font(.system(size: infoPane == .general ? 20 : 16))
                                        .fontWeight(infoPane == .general ? .bold : .regular)
                                        .foregroundColor(Color("BackgroundGreenApp"))
                                }
                                Text("|")
                                    .foregroundColor(Color("BackgroundGreenApp"))
                                Button(action: {
                                    infoPane = .tips
                                }) {
                                    Text("Tips")
                                        .font(.system(size: infoPane == .tips ? 20 : 16))
                                        .fontWeight(infoPane == .tips ? .bold : .regular)
                                        .foregroundColor(Color("BackgroundGreenApp"))
                                }
                                Text("|")
                                    .foregroundColor(Color("BackgroundGreenApp"))
                                Button(action: {
                                    infoPane = .watering
                                }) {
                                    Text("Watering")
                                        .font(.system(size: infoPane == .watering ? 20 : 16))
                                        .fontWeight(infoPane == .watering ? .bold : .regular)
                                        .foregroundColor(Color("BackgroundGreenApp"))
                                }
                            }
                            Group {
                                switch infoPane {
                                case .general:
                                    //plant.general_info
                                    Text("Aloe is a hardy succulent known for its medicinal properties and easy-going nature. Originating from arid climates, Aloe thrives in dry, sunny conditions and is particularly drought-tolerant. Its thick, fleshy leaves store water, making it an excellent choice for low-maintenance plant lovers.")
                                        .font(.system(size: 15))
                                case .tips:
                                    // plant.care_tips
                                    Text("tips here")
                                case .watering:
                                    // plant.watering_info
                                    Text("watering here")
                                }
                            }
                            .frame(height: 150, alignment: .topLeading)
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .cornerRadius(20)
                    }
//                    Spacer()
                    VStack(spacing: 35) {
                        Button(action: {
                            print("Add to garden")
                        }) {
                            Text("Add Plant to Garden")
                                .frame(maxWidth: .infinity, minHeight: 50)
                                .font(.system(size: 15, weight: .bold))
                                .foregroundColor(.white)
                                .background(Color("BackgroundGreenApp"))
                                .cornerRadius(25)
                                .shadow(color: .black.opacity(0.4), radius: 4, x: 0, y: 4)
                        }
                        
                        Text("Report inaccuracy")
                            .foregroundColor(.blue)
                            .font(.system(size: 14))
                    }
                    .padding(.horizontal)
                    .padding(.top)
                    .padding(.bottom, geo.safeAreaInsets.bottom + 20)
                }
                .frame(width: geo.size.width, height: geo.size.height)
            }
        }
        
    }
}

#Preview {
    IdentifiedPlant()
}

struct CurvedBackground: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // start at top left
        path.move(to: CGPoint(x: 0, y: 0))
        
        // y axis left half
        path.addLine(to: CGPoint(x: 0, y: rect.height * 0.2))
        
        //curved line
        path.addCurve(
            to: CGPoint(x: rect.width, y: rect.height * 0.3),
            control1: CGPoint(x: rect.width * 0.3, y: rect.height * 0.4),
            control2: CGPoint(x: rect.width * 0.7, y: rect.height * 0.02)
        )
        
        // complete the top section
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        path.closeSubpath()
        
        return path
    }
}
