//
//  ContentView.swift
//  AdvancedCanvas
//
//  Created by Natasha Trufanova on 15/11/2024.
//

import SwiftUI

class DrawingModel: ObservableObject {
    var angle = 0.0
}

struct ContentView: View {
    @StateObject private var model = DrawingModel()
    
    var body: some View {
        TimelineView (.animation){ timeline in
            Canvas { context, size in
                model.angle += 0.1
                
                context.translateBy(x: 200, y: 200)
                
                let t = ProjectionTransform(CATransform3DMakeRotation(model.angle, 1, 1, 1))
                context.addFilter(.projectionTransform(t))
                context.draw(Text("Hello World!").font(.largeTitle), at: .zero)
                _ = timeline.date
            }
        }
        
        
    }
    
    func drawCircles(in innerContext: inout GraphicsContext) {
        let size = 220
        
        let circle1 = Path(ellipseIn: CGRect(x: 100, y: 200, width: size, height: size))
        innerContext.fill(circle1, with: .color(red: 1, green: 0, blue: 0))
        
        let circle2 = Path(ellipseIn: CGRect(x: 100, y: 300, width: size, height: size))
        innerContext.fill(circle2, with: .color(red: 0, green: 1, blue: 0))
        
        let circle3 = Path(ellipseIn: CGRect(x: 100, y: 400, width: size, height: size))
        innerContext.fill(circle3, with: .color(red: 0, green: 0, blue: 1))
    }
}

#Preview {
    ContentView()
}
