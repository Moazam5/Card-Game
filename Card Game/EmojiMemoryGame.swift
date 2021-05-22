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
    @Published private var model: MemoryGame<String> = createCardGame()
    
    static func createCardGame() -> MemoryGame<String> {
        let emojis : Array<String> = ["💪🏼","🤙🏼", "🖕🏼","☠️", "🎃"]
        let pairCount = Int.random(in: 2...5)
        print("Pair count is", pairCount)
        return MemoryGame<String>(numberOfPairsOfCards : pairCount) { pairIndex in emojis[pairIndex] }
    }

    //MARK:- Access to the Model
    var cards : Array<MemoryGame<String>.Card> {
        model.cards
 }
    //MARK:- Intent(s)
    
     func choose(card : MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
