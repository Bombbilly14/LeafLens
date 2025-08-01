//
//  MyGarden.swift
//  LeafLens
//
//  Created by William German on 5/6/25.
//
import SwiftUI

struct MyGarden: View {
    @EnvironmentObject var auth: AuthService
    @Binding var path: NavigationPath
    var placeholderCount: Int = 1
    
    @State var error: Error?
    var body: some View {
        VStack {
            if placeholderCount > 0 {
                VStack(spacing: 0) {
                    ShelfRow()

                }
            } else {
                noPlantsYetView()
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Card5")) // or card 2?
        .ignoresSafeArea()
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack(alignment: .top) {
                    Text("My Garden")
                        .font(.system(size: 20))
                        .bold()
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct noPlantsYetView: View {
    var body: some View {
        ZStack {
            VStack(spacing: 16) {
                Image("plantNoBg2")
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 150)
                Text("Snap a plant and start growing!")
                    .font(.headline)
                Text("Snap your favorite plant or upload an image to get personalized care reminders and track its growth")
                    .foregroundColor(.gray)
                    .font(.footnote)
                    .multilineTextAlignment(.center)
                Button(action: {}) {
                    HStack{
                        Text("Start Growing")
                        
                        ZStack {
                            Image(systemName: "camera.fill")
                        }
                        
                        
                    }
                    .font(.system(size: 14))
                }
                
                .frame(maxWidth: .infinity, minHeight: 35)
                .padding(.horizontal)
                .background(Color("PrimaryGreen"))
                .cornerRadius(15)
                .foregroundColor(.white)
                .shadow(color: Color.black.opacity(0.15), radius: 6, x: 0, y: 2)
            }
        }
        .padding()
        .frame(width: 300, height: 300)
        .background(RoundedRectangle(cornerRadius: 16)
             .fill(Color("Card5"))
             .shadow(color: Color.white.opacity(0.4),
                radius: 6, x: -4, y: -4)
             .shadow(color: Color.black.opacity(0.15),
                radius: 4, x: 4, y: 4)
        )
    }
}

#Preview {
    MyGarden(path: .constant(NavigationPath()))
}
