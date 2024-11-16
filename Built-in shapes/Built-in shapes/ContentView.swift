//
//  ContentView.swift
//  Built-in shapes
//
//  Created by Natasha Trufanova on 16/11/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center) {
            Text("Capsule Clip")
                .padding()
                .background(.yellow)
                .clipShape(.capsule)
                .offset(x: 50)
            
            Text("Rounded Rectangle")
                .padding()
                .background(.blue)
                .clipShape(.rect(cornerRadius: 16))
                .offset(x: -50)
            
            Text("Uneven Rounded Rectangle")
                .padding()
                .background(.green)
                .clipShape(.rect(topLeadingRadius: 20, bottomTrailingRadius: 20))
                .offset(y: 50)
            
        }
        .padding(.top, 30)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        
        ZStack {
            Rectangle()
                .fill(.gray)
                .frame(width: 200, height: 200)
                .position(x: 0, y: 0)
            
            RoundedRectangle(cornerRadius: 25)
                .fill(.blue)
                .frame(width: 200, height: 200)
                .offset(x: 100, y: -200)
            
            UnevenRoundedRectangle(cornerRadii: .init(topLeading: 50, topTrailing: 20))
                .frame(width: 100, height: 150)
            
            Capsule()
                .fill(.green)
                .frame(width: 220, height: 120)
            
            Ellipse()
                .fill(.red)
                .frame(width: 40, height: 70)
            
            Circle()
                .fill(.black)
                .frame(width: 30)
                .offset(y: 100)
        }
    }
}

#Preview {
    ContentView()
}
