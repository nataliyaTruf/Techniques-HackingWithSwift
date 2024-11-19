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
            context.translateBy(x: 50, y: 5)
            
            context.withCGContext { cgContext in
                cgContext.setFillColor(UIColor.black.cgColor)
                
                for row in 0..<8 {
                    for col in 0..<8 {
                        if (row + col).isMultiple(of: 2) {
                            cgContext.fill(CGRect(x: col * 32, y: row * 32, width: 32, height: 32))
                        }
                    }
                }
            }
        }
    }

}

#Preview {
    ContentView()
}
