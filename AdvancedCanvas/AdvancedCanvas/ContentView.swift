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
            context.translateBy(x: 150, y: 200)
            
            let resolved = context.resolve(Text("Hello world!").font(.title))
            context.addFilter(.shadow(radius: 3))
            context.addFilter(.shadow(radius: 3))
            
            for i in 1...100 {
                context.translateBy(x: 1, y: 1)
                context.opacity = Double(i) / 100
                context.draw(resolved, at: .zero)
            }
        }
    }

}

#Preview {
    ContentView()
}
