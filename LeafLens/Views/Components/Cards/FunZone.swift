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
    let shuffledCards = FunCardType.allCases.shuffled()
    @State private var selectedIndex = 0
    var body: some View {
        VStack(spacing: 5) {
            TabView(selection: $selectedIndex) {
                ForEach(shuffledCards.indices, id: \.self) {index in
                    VStack {
                        FunZoneCards(type: shuffledCards[index])
//                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: 150, alignment: .top)
                    .tag(index)
                    .padding(.trailing, 5)
                }
            }
            .frame(height: 150)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .padding(.top, 0)
            
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
        .frame(maxHeight: 300)
    }
}

struct FunZoneCards: View {
    let type: FunCardType

    var body: some View {
        VStack(alignment: .leading) {
            switch type {
                
            case .subscribe:
                Text("Subscribe today for additional features1")
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
            case .funFact:
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
            case .plantTip:
                Text("Subscribe today for additional features3")
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
            case .shareFeature:
                Text("Subscribe today for additional features4")
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
        }
        .padding()
        .background(Color("TestAccentColor3"))
        .cornerRadius(10)
    }
}

#Preview {
    FunZone()
}
