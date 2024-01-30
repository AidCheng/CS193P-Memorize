//
//  ContentView.swift
//  Memorize
//
//  Created by Aiden Cheng on 30/01/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            CardView()
            CardView(isFaceUp: false)
        }
        .foregroundColor(.orange)
        .font(.largeTitle)
        .padding()
    }
}

struct CardView: View{
    var isFaceUp: Bool = true
    
    var body: some View{
        ZStack{
            if isFaceUp{
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 20)
                    .strokeBorder(.orange, lineWidth: 10)
                Text("💩")
            } else {
                RoundedRectangle(cornerRadius: 20)
            }
        }
    }
}

#Preview {
    ContentView()
}
