//
//  IdentifyYourPlant.swift
//  LeafLens
//
//  Created by William German on 5/7/25.
//

import SwiftUI


enum ActivePicker: Identifiable {
  case camera, library
  var id: Int { hashValue }
}


struct IdentifyYourPlant: View {
    @State private var activePicker: ActivePicker? = nil
    @StateObject private var classifier = PlantIdentifier()
    @State private var pickedImage: UIImage?
    @State private var isShowingImagePicker: Bool = false
    @State private var pickerSource: UIImagePickerController.SourceType = .photoLibrary

    private func snapPhoto() {
        print("snap a photo presssed")
        activePicker = .camera
        isShowingImagePicker = true
    }
    private func uploadImage() {
        print("uploadImage presssed")
        activePicker = .library
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
                        .font(.system(size: 16, weight: .semibold))
                }
                .frame(maxWidth: .infinity, minHeight: 50)
                .padding(.horizontal)
                .background(Color("BackgroundGreenApp"))
                .cornerRadius(15)
                .foregroundColor(.white)
                .shadow(color: Color.black.opacity(0.15), radius: 6, x: 0, y: 2)
                
                Button(action: uploadImage) {
                    Label("Upload Image", systemImage: "photo")
                        .font(.system(size: 16, weight: .semibold))
                }
                .frame(maxWidth: .infinity, minHeight: 50)
                .padding(.horizontal)
                .background(Color("SecondaryButtons1"))
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
        
        .sheet(item: $activePicker, onDismiss: {
              if let img = pickedImage { classifier.classify(img) }
            }) { picker in
              switch picker {
              case .camera:
                ImagePicker(sourceType: .camera, selectedImage: $pickedImage)
              case .library:
                ImagePicker(sourceType: .photoLibrary, selectedImage: $pickedImage)
              }
            }
    }
}

#Preview {
    IdentifyYourPlant()
}
