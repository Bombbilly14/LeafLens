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
    private func isSelected() -> Bool {
        selectedTab == .identify
    }
    
    
    var body: some View {
        ZStack(alignment: .center) {
            HStack {
                tabButtons(tab: .home, label: "Home", image: "house")
                tabButtons(tab: .myGarden, label: "My Garden", image: "leaf")
                Spacer()
                tabButtons(tab: .calendar, label: "Calendar", image: "receipt")
                tabButtons(tab: .settings, label: "Settings", image: "gearshape")
            }
            .padding(.horizontal, 5)
            .frame(height: tabBarHeight)
            .padding(.vertical, 16)
            .background(
                Color("TestAccentColor3")
                    .clipShape(Capsule())
                    .shadow(color: Color.black.opacity(0.3),
                            radius: 5, x: 0, y: 4)
            )
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .bottom)
            Button {
                withAnimation(.spring(response: 0.4, dampingFraction: 0.9)) {
                    selectedTab = .identify
                }
            } label: {
                ZStack {
                    if selectedTab == .identify {
                        Circle()
                            .fill(selectedTab == .identify ? Color("PrimaryGreen") : Color(.white))
                            .matchedGeometryEffect(id: "tabHighlight", in: highlightNamespace)
                            .shadow(color: Color.black.opacity(0.04), radius: 8, x: 0, y: 0)
                            .shadow(color: Color.black.opacity(0.4), radius: 2, x: 0, y: 4)
                    } else {
                        Circle()
                            .fill(Color(.white))
                            .shadow(color: Color.black.opacity(0.2),
                                        radius: 3, x: 0, y: 4)
                    }
                    
                    Image("LeafLensLogoVector2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(selectedTab == .identify ? Color(.white) : Color("PrimaryGreen"))
                        .frame(width: isSelected() ? 65 : 50, height: isSelected() ? 65 : 50)
                    
                    CornerLines(length: 11)
                        .stroke(selectedTab == .identify ? .white : Color("PrimaryGreen"), lineWidth: 2)
                        .frame(width: 50, height: 50)
                        .drawingGroup()
                }
            }
            .offset(y: selectedTab == .identify ? -20 : 0)
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
                        .font(.system(size: 12, weight: .semibold))
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
                      .fill(Color("PrimaryGreen"))
                      .matchedGeometryEffect(id: "tabHighlight", in: highlightNamespace)
                      .shadow(color: Color.black.opacity(0.3), radius: 2, x: 0, y: 4)
                  }
                }
                    .offset(y: selectedTab == tab ? -20 : 0)
              )
            .shadow(radius: selectedTab == tab ? 5 : 0)
    }
}

#Preview {
    BottomNavBar(selectedTab: .constant(.home))
}

// camera corner lines
struct CornerLines: Shape {
    var length: CGFloat
    var inset: CGFloat = 4

    func path(in rect: CGRect) -> Path {
        var p = Path()

        // top-left
        p.move(to: CGPoint(x: rect.minX + inset, y: rect.minY + inset + length))
        p.addLine(to: CGPoint(x: rect.minX + inset, y: rect.minY + inset))
        p.addLine(to: CGPoint(x: rect.minX + inset + length, y: rect.minY + inset))

        // top-right
        p.move(to: CGPoint(x: rect.maxX - inset - length, y: rect.minY + inset))
        p.addLine(to: CGPoint(x: rect.maxX - inset, y: rect.minY + inset))
        p.addLine(to: CGPoint(x: rect.maxX - inset, y: rect.minY + inset + length))

        // bottom-left
        p.move(to: CGPoint(x: rect.minX + inset, y: rect.maxY - inset - length))
        p.addLine(to: CGPoint(x: rect.minX + inset, y: rect.maxY - inset))
        p.addLine(to: CGPoint(x: rect.minX + inset + length, y: rect.maxY - inset))

        // bottom-right
        p.move(to: CGPoint(x: rect.maxX - inset - length, y: rect.maxY - inset))
        p.addLine(to: CGPoint(x: rect.maxX - inset, y: rect.maxY - inset))
        p.addLine(to: CGPoint(x: rect.maxX - inset, y: rect.maxY - inset - length))

        return p
    }
}

