//
//  ContentView.swift
//  AdvancedCanvas
//
//  Created by Natasha Trufanova on 15/11/2024.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        Canvas { context, size in
            print("Rendering")
            let path = Path(roundedRect: CGRect(x: 100, y: 200, width: 200, height: 200), cornerRadius: 25)
            
            if context.environment.colorScheme == .dark {
                context.fill(path, with: .color(.white))
            } else {
                context.fill(path, with: .color(.black))
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
