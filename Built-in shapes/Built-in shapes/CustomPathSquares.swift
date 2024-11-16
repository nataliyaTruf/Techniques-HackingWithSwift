//
//  CustomPath.swift
//  Built-in shapes
//
//  Created by Natasha Trufanova on 16/11/2024.
//

import SwiftUI

struct ShrinkingSquares: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        for i in stride(from: 0, through: 150, by: 10.0) {
            let rect = CGRect(x: 0, y: 0, width: rect.width, height: rect.height)
            let insetRect = rect.insetBy(dx: i, dy: i)
            path.addRect(insetRect)
        }
        
        return path
    }
}

struct CustomPathSquares: View {
    var body: some View {
        ShrinkingSquares()
            .stroke(.green, lineWidth: 5)
            .frame(width: 300, height: 300)
    }
}

#Preview {
    CustomPathSquares()
}
