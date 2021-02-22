//
//  EmojiMemoryGame.swift
//  Card Game
//
//  Created by Moazam Mir on 2/22/21.
//

import SwiftUI
//its a class since its easy to share and we want to share our viewmodel
//Problem with that is that since everyone is using it, if some view does something nefarious, the
//changes will be reflects across all the views

class EmojiMemoryGame
{
    //shouldn't be called model
    private var model : CardGame<String> = createCardGame()
    
    static func createCardGame() -> CardGame<String>{
        let emojis : Array<String> = ["💪🏼","🤙🏼"]
        
        return CardGame<String>(numberOfPairsOfCards : 2) { pairIndex in emojis[pairIndex] }
    }
        
        
        
    
    //MARK:- Access to the Model
    var cards : Array<CardGame<String>.Card> {
         model.cards
    }
    
    //MARK:- Intent(s)
    
    
    func choose(card : CardGame<String>.Card)
    {
        model.choose(card: card)
    }
}
