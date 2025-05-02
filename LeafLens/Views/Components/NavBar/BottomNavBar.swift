//
//  BottomNavBar.swift
//  LeafLens
//
//  Created by William German on 5/2/25.
//
import SwiftUI

struct BottomNavBar: View {
    @Binding var selectedTab: AppRouter.Tab
    var tabBarHeight: CGFloat = 30
    @Namespace private var highlightNamespace

    
    
    var body: some View {
        ZStack(alignment: .center) {
            HStack {
                tabButtons(tab: .home, label: "Home", image: "house")
                Spacer()
                tabButtons(tab: .settings, label: "Settings", image: "gearshape")
            }
            .padding(.horizontal, 25)
            .frame(height: tabBarHeight)
            .padding(.vertical, 16)
            .background(
                Color("BackgroundGreenApp")
                    .clipShape(Capsule())
                    .shadow(radius: 2)
            )
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .bottom)
        //TODO: not sure if i like the placement or logo as the icon
            Button {
                withAnimation(.spring(response: 0.4, dampingFraction: 0.9)) {
                    selectedTab = .placeholder
                }
            } label: {
                Image("LeafLensLogoVector2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(selectedTab == .placeholder ? Color(.white) : Color("BackgroundGreenApp"))

                    .frame(width: 65, height: 65)
                    .background(
                        ZStack {
                          if selectedTab == .placeholder {
                            Circle()
                              .fill(Color("TestAccentColor3"))
                              .matchedGeometryEffect(id: "tabHighlight", in: highlightNamespace)
                          } else {
                              Color(.white)
                          }
                        }
//                            .offset(y: selectedTab == .placeholder ? -20 : 0)
                      )
                    .clipShape(Circle())
                    .shadow(radius: 6)
            }
            .offset(y: selectedTab == .placeholder ? -20 : 0)
        }
        .frame(height: tabBarHeight + 30)
        .padding(.bottom, 10)

    }
    
    private func tabButtons(tab: AppRouter.Tab, label: String, image: String) -> some View {
        VStack() {
                Image(systemName: selectedTab == tab ? image+".fill" : image)
                    .font(.system(size: selectedTab == tab ? 25 : 18, weight: .semibold))
                    .frame(height: 24)
                if selectedTab != tab {
                    Text(label)
                }
            }
            
        .foregroundColor(selectedTab == tab ? Color(.white) : Color(.white))
        .frame(width: 65, height: 65)
        .contentShape(Rectangle())
        .onTapGesture {
            withAnimation(.spring(response: 0.4, dampingFraction: 0.9)) {
              selectedTab = tab
            }
          }
            .offset(y: selectedTab == tab ? -20 : 0)
            .background(
                ZStack {
                  if selectedTab == tab {
                    Circle()
                      .fill(Color("TestAccentColor3"))
                      .matchedGeometryEffect(id: "tabHighlight", in: highlightNamespace)
                  }
                }
                    .offset(y: selectedTab == tab ? -20 : 0)
              )
            .shadow(radius: selectedTab == tab ? 12 : 0)
    }
}

#Preview {
    BottomNavBar(selectedTab: .constant(.home))
}
