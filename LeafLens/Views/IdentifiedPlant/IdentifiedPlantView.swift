//
//  IdentifiedPlant.swift
//  LeafLens
//
//  Created by William German on 5/20/25.
//


import SwiftUI

struct IdentifiedPlantView: View {
    
    var body: some View {
        ZStack{
            Color("Card5")
                .ignoresSafeArea()
            CurvedBackground()
                .fill(Color("BackgroundGreenApp"))
                .ignoresSafeArea()
                
            GeometryReader { geo in
                VStack(spacing: 0) {
                    VStack {
                        GenusHeader()
                            .padding(.top)
                        QuickInfoCard()
                        QuickInfoCard2()
                        InfoPaneCard()
                            .padding()
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
    IdentifiedPlantView()
}

struct HalfRadial: View {
    let segments: Int
        let filled: Int
        let isLeft: Bool

        var body: some View {
            GeometryReader { geo in
                ZStack {
                    // draw all segments
                    ForEach(0..<segments) { i in
                        let slice = 180.0 / Double(segments)
                        let gap   = slice * 0.02
                        let start = (isLeft ? 180 : 0) + slice * Double(i) + gap/2
                        let end   = start + slice - gap

                        Path { p in
                            p.addArc(
                                center: CGPoint(x: geo.size.width/2, y: geo.size.height/2),
                                radius: min(geo.size.width, geo.size.height)/2,
                                startAngle: .degrees(start),
                                endAngle:   .degrees(end),
                                clockwise:  false
                            )
                        }
                        .stroke(
                            // invert fill logic for left side so it fills from the top segment down
                            (isLeft
                                ? (i >= segments - filled)
                                : (i < filled))
                            ? Color("BackgroundGreenApp")
                            : Color("BackgroundGreenApp").opacity(0.2),
                            lineWidth: 10
                        )
                    }
                }
                // rotate the whole half‐circle so it sits vertically
                .rotationEffect(.degrees(-90))
            }
        }
}
//struct WateringGauge: View {
//    /// amount: 0…10
//    let amount: Double
//    /// days between waterings: 1…14
//    let daysBetween: Double
//    let maxDays: Double = 14
//
//    // 1. Turn the 0–10 into a simple Low/Med/High
//    private var amountLabel: String {
//        switch amount {
//        case 0..<3:  return "Low"
//        case 3..<7:  return "Med"
//        default:     return "High"
//        }
//    }
//    // 2. Turn days into Daily/Weekly/Bi-weekly
//    private var freqLabel: String {
//        switch daysBetween {
//        case 0..<2:    return "Daily"
//        case 2..<10:   return "Weekly"
//        default:       return "Bi-weekly"
//        }
//    }
//
//    var body: some View {
//        ZStack {
//            // background rings
//            Circle().stroke(Color.backgroundGreenApp.opacity(0.2), lineWidth: 12)
//            Circle()
//                .stroke(Color.backgroundGreenApp.opacity(0.2), lineWidth: 6)
//                .padding(8)
//
//            // filled arcs
//            Circle()
//                .trim(from: 0, to: CGFloat(min(amount/10, 1)))
//                .stroke(Color.testAccentColor3, style: StrokeStyle(lineWidth: 12, lineCap: .round))
//                .rotationEffect(.degrees(-90))
//            Circle()
//                .trim(from: 0, to: CGFloat(min(daysBetween/maxDays, 1)))
//                .stroke(Color.backgroundGreenApp, style: StrokeStyle(lineWidth: 6, lineCap: .round))
//                .rotationEffect(.degrees(-90))
//                .padding(8)
//
//            // center: descriptive labels + icons
//            VStack(spacing: 2) {
//                HStack(spacing: 4) {
//                    Image(systemName: "drop.fill")
//                        .font(.system(size: 12))
//                    Text(amountLabel)
//                        .font(.caption2).bold()
//                }
//                HStack(spacing: 4) {
//                    Image(systemName: "calendar")
//                        .font(.system(size: 12))
//                    Text(freqLabel)
//                        .font(.caption2)
//                }
//            }
//        }
//        .frame(width: 80, height: 80)
//    }
//}
