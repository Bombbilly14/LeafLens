//
//  PlantIdentifier.swift
//  LeafLens
//
//  Created by William German on 5/13/25.
//
import SwiftUI
import Vision
import CoreML

class PlantIdentifier: ObservableObject {
    private let vnModel: VNCoreMLModel
    
    @Published var label: String = ""
    @Published var confidence: Double = 0
    
    init() {
        let coreMLModel = try! PlantClassifier(configuration: .init()).model
        self.vnModel = try! VNCoreMLModel(for: coreMLModel)
    }
    
    func classify(_ uiImage: UIImage) {
        guard let ciImage = CIImage(image: uiImage) else { return }
        
        let request = VNCoreMLRequest(model: vnModel) { [weak self] request, error in
            guard let obs = request.results?
                    .compactMap({ $0 as? VNClassificationObservation })
                    .first
            else { return }
            DispatchQueue.main.async {
                self?.label = obs.identifier
                self?.confidence = Double(obs.confidence)
            }
        }
        request.imageCropAndScaleOption = .centerCrop
        
        let handler = VNImageRequestHandler(ciImage: ciImage, options: [:])
        DispatchQueue.global(qos: .userInitiated).async {
            try? handler.perform([request])
        }
    }
}
