//
//  CustomPath.swift
//  Built-in shapes
//
//  Created by Natasha Trufanova on 16/11/2024.
//

import SwiftUI

struct CustomPath: View {
    var body: some View {
        ZStack {
            Path { path in
                path.move(to: CGPoint(x: 50, y: 50))
                path.addQuadCurve(to: CGPoint(x: 150, y: 100), control: CGPoint(x: 100, y: 100))
            }
            .stroke(.blue, lineWidth: 5)
            
            Path { path in
                path.move(to: CGPoint(x: 100, y: 100))
                path.addLine(to: CGPoint(x: 200, y: 200))
            }
            .stroke(.red, lineWidth: 10)
            
            Path { path in
                path.move(to: CGPoint(x: 50, y: 0))
                path.addCurve(to: CGPoint(x: 50, y: 400), control1: CGPoint(x: 100, y: 200), control2: CGPoint(x: 0, y: 200))
            }
            .stroke(.green, lineWidth: 10)
            
            Path { path in
                path.addArc(
                    center: CGPoint(x: 150, y: 150),
                    radius: 50,
                    startAngle: .degrees(20),
                    endAngle: .degrees(190),
                    clockwise: true
                )
            }
            .fill(.purple)
        }
    }
}

#Preview {
    CustomPath()
}
