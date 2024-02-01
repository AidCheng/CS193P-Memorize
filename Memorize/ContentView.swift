//
//  ContentView.swift
//  Memorize
//
//  Created by Aiden Cheng on 30/01/2024.
//

import SwiftUI

struct ContentView: View {
    let emojis: Array<String> = ["🦊", "💩", "🐶", "🐻", "🐭", "🐹"]
    // emojis: [String] = [] || emojis = [...] (type inferencce)
    @State var cardCount: Int = 2
    
    var body: some View {
        // Source Control
        VStack {
            cards
            Spacer()
            cardCountController
        }
        .padding() //Padding is for VStack
    }
    
    var cardCountController: some View{
        HStack{
            cardRemover
            Spacer()
            cardAdder
        }
        .font(.largeTitle)
    }
    
    var cards: some View {
        ForEach(0..<cardCount, id: \.self) { index in
            CardView(content: emojis[index])
        }
        .foregroundColor(.orange)
        // single line of code function like this does not need to return
    }
    
    func cardCountAdjuster
        (by offset: Int, symbol: String) -> some View {
        Button {
            cardCount += offset
        } label: {
            Image(systemName: symbol)
        }
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus.fill")
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
}

struct CardView: View{
    @State var isFaceUp: Bool = true
    let content : String
    // or var isFaceUp = true -> swift figure the type out itself
    
    var body: some View{
        ZStack{
            let base = RoundedRectangle(cornerRadius: 20) // Constant & type inference -> swift get things itself
            if isFaceUp{
                base.foregroundColor(.white)
                base.strokeBorder(.orange, lineWidth: 10)
                Text(content).font(.largeTitle)
            } else {
                base.fill()//default
            }
        }
        .onTapGesture(perform: {
            // code executed when the view is tapped
            isFaceUp.toggle()
        })
    }
}

#Preview {
    ContentView()
}
