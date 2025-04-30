//
//  LeafLensLogo.swift
//  LeafLens
//
//  Created by William German on 4/29/25.
//

import SwiftUI

struct RaindropShape: Shape {
    func path(in rect: CGRect) -> Path {
        var p = Path()
        let w = rect.width
        let h = rect.height

        // Top point
        p.move(to: CGPoint(x: w/2, y: 0))

        // Left side curve down to bottom arc start
        p.addQuadCurve(
            to: CGPoint(x: 0, y: h * 0.6),
            control: CGPoint(x: 0, y: 0)
        )

        // Bottom half-circle
        p.addArc(
            center: CGPoint(x: w/2, y: h * 0.6),
            radius: w/2,
            startAngle: .degrees(180),
            endAngle: .degrees(0),
            clockwise: false
        )

        // Right side curve back up
        p.addQuadCurve(
            to: CGPoint(x: w/2, y: 0),
            control: CGPoint(x: w, y: 0)
        )

        p.closeSubpath()
        return p
    }
}

// 2️⃣ The little plant inside
struct LeafPlantShape: Shape {
    func path(in rect: CGRect) -> Path {
        var p = Path()
        let w = rect.width
        let h = rect.height

        // Stem from bottom center of drop up to ~40% height
        p.move(to: CGPoint(x: w/2, y: h * 0.6))
        p.addLine(to: CGPoint(x: w/2, y: h * 0.35))

        // Top leaf (center)
        let topLeaf = CGRect(
            x: w * 0.45,
            y: h * 0.15,
            width: w * 0.1,
            height: h * 0.15
        )
        p.addEllipse(in: topLeaf)

        // Left leaf
        let leftLeaf = CGRect(
            x: w * 0.25,
            y: h * 0.45,
            width: w * 0.13,
            height: h * 0.08
        )
        p.addEllipse(in: leftLeaf)

        // Right leaf
        let rightLeaf = CGRect(
            x: w * 0.62,
            y: h * 0.45,
            width: w * 0.13,
            height: h * 0.08
        )
        p.addEllipse(in: rightLeaf)

        return p
    }
}

// 3️⃣ Compose them together
struct LeafLensLogo: View {
    var body: some View {
        GeometryReader { geo in
            ZStack {
                RaindropShape()
                    .stroke(lineWidth: geo.size.width * 0.05)
                    .foregroundColor(.white)

                LeafPlantShape()
                    .fill(.white)
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        // give it a fixed aspect ratio if you like:
        .aspectRatio(1, contentMode: .fit)
    }
}

#Preview {
    LeafLensLogo()
        .frame(width: 200, height: 200)
                    .background(Color.black)
}
