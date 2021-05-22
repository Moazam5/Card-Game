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
         HStack {
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

    var body : some View {
        GeometryReader(content: { geometry in
            ZStack {
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                    RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                    Text(card.content)
                }  else {
                    RoundedRectangle(cornerRadius: cornerRadius).fill()
                }
            }.font(Font.system(size: fontSize(for: geometry.size)))
        })
    }
//MARK:- Drawing Constants
    let cornerRadius: CGFloat = 10
    let edgeLineWidth: CGFloat = 3
    let fontScaleFactor: CGFloat = 0.75

    func fontSize(for size: CGSize) -> CGFloat {
        return (min(size.height, size.width) * fontScaleFactor)
    }
}

struct CardGameView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = EmojiMemoryGame()
        CardGameView(viewModel: viewModel)
    }
}
