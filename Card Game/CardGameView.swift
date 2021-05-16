//
//  ContentView.swift
//  Card Game
//
//  Created by Moazam Mir on 2/16/21.
//

import SwiftUI

struct CardGameView: View {
    @ObservedObject var viewModel : EmojiMemoryGame
    var body: some View {
        
        HStack
        {
            ForEach(viewModel.cards) { card in
                CardView(card: card)
                    .onTapGesture {
                    viewModel.choose(card: card)
                }
            }
        }
        .foregroundColor(.orange)
        .padding()
               .font(viewModel.cards.count > 5 ? Font.title : Font.largeTitle)
      
    }
}

struct CardView : View {
    var card : MemoryGame<String>.Card

    var body : some View
    {
        
        ZStack {
            if card.isFaceUp
            {
                RoundedRectangle(cornerRadius: 10).fill(Color.white)
                RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 3.0)
                Text(card.content)
            }
            else
            {
                RoundedRectangle(cornerRadius: 10).fill()
            }
        }.aspectRatio(2/3, contentMode: .fit)
    }
}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
