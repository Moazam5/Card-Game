//
//  EmojiMemoryGame.swift
//  Card Game
//
//  Created by Moazam Mir on 2/22/21.
//  This is the View Model

import SwiftUI

class EmojiMemoryGame : ObservableObject
{
    //shouldn't be called model
    @Published private var model: CardGame<String> = createCardGame()
    
    static func createCardGame() -> CardGame<String>{
        let emojis : Array<String> = ["💪🏼","🤙🏼", "🖕🏼","☠️", "🎃"]
        let pairCount = Int.random(in: 2...5)
        print("Pair count is", pairCount)
        return CardGame<String>(numberOfPairsOfCards : pairCount) { pairIndex in emojis[pairIndex] }
    }
        
    
        
    
    //MARK:- Access to the Model
    var cards : Array<CardGame<String>.Card> {
        model.cards
//        var cards = model.cards
//        cards.shuffle()
//        return cards
        
    }
    
    //MARK:- Intent(s)
    
     func choose(card : CardGame<String>.Card)
    {
        model.choose(card: card)
    }
}
