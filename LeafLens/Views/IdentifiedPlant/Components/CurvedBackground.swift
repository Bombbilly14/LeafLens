//
//  CurvedBackground.swift
//  LeafLens
//
//  Created by William German on 5/29/25.
//
import SwiftUI

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
