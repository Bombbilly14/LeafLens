//
//  FunZone.swift
//  LeafLens
//
//  Created by William German on 7/14/25.
//
import SwiftUI

enum FunCardType: CaseIterable {
    case subscribe
    case funFact
    case plantTip
    case shareFeature
}
struct FunZone: View {
    let shuffledCards = FunCardType.allCases
    //let shuffledCards = FunCardType.allCases.shuffled()
    @State private var selectedIndex = 0
    var body: some View {
        VStack(spacing: 5) {
            TabView(selection: $selectedIndex) {
                ForEach(shuffledCards.indices, id: \.self) {index in
                    VStack {
                        FunZoneCards(type: shuffledCards[index])
                    }
                    .tag(index)
                    .padding(.trailing, 5)
                }
            }
            .frame(height: 200, alignment: .bottom)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .padding(.vertical, 0)
//            .shadow(color: Color.black.opacity(0.05), radius: 3, x: 0, y: 3)
            
            HStack(spacing: 2) {
                ForEach(shuffledCards.indices, id: \.self) {index in
                    Circle()
                        .frame(width: selectedIndex == index ? 10: 6,
                               height: selectedIndex == index ? 10: 6)
                        .foregroundColor(selectedIndex == index ? Color(.black) : Color(.gray))
                        .animation(.easeInOut(duration: 0.2), value: selectedIndex)
                }
            }
        }
    }
}

struct FunZoneCards: View {
    let type: FunCardType

    var body: some View {
        ZStack(alignment: .bottom) {
            switch type {
                
            case .subscribe:
                ZStack(alignment: .bottom) {
                    VStack(alignment: .leading, spacing: 25){
                        Text("More shelves, better care. LeafLens+")
                            .font(.system(size: 18))
                            .foregroundColor(.black)
                            .frame(width: 180, alignment: .topLeading)
                            .lineSpacing(9)
                            .padding(.leading)
                        Button(action: {}) {
                            Text("Learn more!")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(Color.white)
                                .frame(width: 100, height: 12)
                                .padding()
                                .background(Color("BackgroundGreenApp"))
                                .cornerRadius(25)
                        }
                        .shadow(color: .backgroundGreenApp.opacity(0.4), radius: 6, x: 5, y: 5)
                        .padding(.leading)
                        .padding(.bottom, 5)

                        
                        
                    }
                    .padding()
                    
                    .frame(maxWidth: .infinity, maxHeight: 175, alignment: .leading)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color("GradientSoftGreen"),
                                Color("GradientSoftYellow")
                            ]),
                            startPoint: .top,
                            endPoint: .bottom
                        )

                    )
                    .cornerRadius(20)

                    
                    Image("snakePlantNoBg")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200)
                        .offset(x: 85, y: 0)
                    
                }

                
            case .funFact:
                
                VStack(alignment: .leading) {
                    Text("Subscribe today for additional features2")
                        .font(.system(size: 16))
                        .foregroundColor(.white)
                        .bold()
                    HStack {
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam auctor quam id massa faucibus dignissim. Nulla eget metus id nisl malesuada condimentum.")
                            .foregroundColor(.white)
                            .font(.system(size: 14))
                        Spacer()
                        Button(action: {}) {
                            Text("Learn More")
                                .font(.system(size: 12))
                                .foregroundColor(.white)
                                .bold()
                                .padding(10)
                                .background(Color("BackgroundGreenApp"))
                                .cornerRadius(25)
                        }
                    }
                }
                .padding()
                .background(Color("TestAccentColor3"))
                .cornerRadius(10)
            case .plantTip:
                VStack(alignment: .leading) {
                    Text("Subscribe today for additional features2")
                        .font(.system(size: 16))
                        .foregroundColor(.white)
                        .bold()
                    HStack {
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam auctor quam id massa faucibus dignissim. Nulla eget metus id nisl malesuada condimentum.")
                            .foregroundColor(.white)
                            .font(.system(size: 14))
                        Spacer()
                        Button(action: {}) {
                            Text("Learn More")
                                .font(.system(size: 12))
                                .foregroundColor(.white)
                                .bold()
                                .padding(10)
                                .background(Color("BackgroundGreenApp"))
                                .cornerRadius(25)
                        }
                    }
                }
                .padding()
                .background(Color("TestAccentColor3"))
                .cornerRadius(10)
            case .shareFeature:
                VStack(alignment: .leading) {
                    Text("Subscribe today for additional features2")
                        .font(.system(size: 16))
                        .foregroundColor(.white)
                        .bold()
                    HStack {
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam auctor quam id massa faucibus dignissim. Nulla eget metus id nisl malesuada condimentum.")
                            .foregroundColor(.white)
                            .font(.system(size: 14))
                        Spacer()
                        Button(action: {}) {
                            Text("Learn More")
                                .font(.system(size: 12))
                                .foregroundColor(.white)
                                .bold()
                                .padding(10)
                                .background(Color("BackgroundGreenApp"))
                                .cornerRadius(25)
                        }
                    }
                }
                .padding()
                .background(Color("TestAccentColor3"))
                .cornerRadius(10)
            }
        }
    }
}

#Preview {
    FunZone()
}
