//
//  IdentifyYourPlant.swift
//  LeafLens
//
//  Created by William German on 5/7/25.
//

import SwiftUI

struct IdentifyYourPlant: View {
    
    @StateObject private var classifier = PlantIdentifier()
    @State private var pickedImage: UIImage?
    @State private var isShowingImagePicker: Bool = false
    @State private var pickerSource: ImagePicker.SourceType = .photoLibrary
    
    private func snapPhoto() {
        print("snap a photo presssed")
        pickerSource = .camera
        isShowingImagePicker = true
    }
    private func uploadImage() {
        print("uploadImage presssed")
        pickerSource = .photoLibrary
        isShowingImagePicker = true
    }
    
    var body: some View {
        VStack(spacing: 20){
            Spacer()
            Image("LeafLensLogoVector2")
                .resizable()
                .scaledToFit()
                .frame(width: 75, height: 75)
                .foregroundColor(Color("BackgroundGreenApp"))
            
            Text("Let's identify your plant!")
                .font(.title)
            Text("Snap or upload a photo to get started")
                .font(.subheadline)
            
            if !classifier.label.isEmpty {
                                Text("Prediction: \(classifier.label)")
                                    .font(.headline)
                                Text(String(format: "Confidence: %.1f%%", classifier.confidence * 100))
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
            
            HStack {
                Button(action: snapPhoto) {
                    Label("Take Photo", systemImage: "camera")
                    
                }
                .frame(maxWidth: .infinity, minHeight: 50)
                .padding(.horizontal)
                .background(Color("BackgroundGreenApp"))
                .cornerRadius(15)
                .foregroundColor(.white)
                .shadow(color: Color.black.opacity(0.15), radius: 6, x: 0, y: 2)
                
                Button(action: uploadImage) {
                    Label("Upload Image", systemImage: "photo")
                    
                }
                .frame(maxWidth: .infinity, minHeight: 50)
                .padding(.horizontal)
                .background(Color("SecondaryButtons"))
                .cornerRadius(15)
                .foregroundColor(.black)
                .shadow(color: Color.black.opacity(0.15), radius: 6, x: 0, y: 2)
            }
            Text("Tips for best results")
            VStack(alignment: .leading, spacing: 5) {
                Text("• Use bright lighting")
                Text("• Include the entire leaf")
                Text("• Avoid background clutter")
            }
            
            
            Text("Recently snapped plants")
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20){
                    PlantCard(title: "Prayer Plant", desc: "some genus or species", image: "plantBackground", nickname: "my love")
                    PlantCard(title: "Prayer Plant", desc: "some genus or species", image: "plantBackground", nickname: "my love")
                    PlantCard(title: "Prayer Plant", desc: "some genus or species", image: "plantBackground", nickname: "my love")
                }
                .padding()
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, -16)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal)
        .background(Color("Card5"))
        
        .sheet(isPresented: $isShowingImagePicker, onDismiss: {
            if let img = pickedImage {
                classifier.classify(img)
                
            }
        }) {
            ImagePicker(sourceType: pickerSource, selectedImage: $pickedImage)
        }
    }
}

#Preview {
    IdentifyYourPlant()
}
