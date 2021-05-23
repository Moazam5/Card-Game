//
//  CardGame.swift
//  Card Game
//
//  Created by Moazam Mir on 2/22/21.
//  Model

import Foundation
import SwiftUI

struct MemoryGame<CardContent> where CardContent: Equatable {
    var cards : Array<Card>

    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp  }.only }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }

    init(numberOfPairsOfCards : Int,
         cardContentFactory : (Int) -> CardContent) {
        cards = Array<Card>()
            for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex * 2, content: content))
            cards.append(Card(id: pairIndex * 2 + 1,  content: content))
        }
        cards.shuffle()
    }
    
    mutating func choose(card : Card)
    {
        print("card chosen:\(card)")
            //get the index, check for face up, check if its not matched
        if let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if self.cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[potentialMatchIndex].isMatched = true
                    cards[chosenIndex].isMatched = true
                    //check is any card is remaining, end if not
                }
                cards[chosenIndex].isFaceUp = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        }
    }
    
    struct Card : Identifiable {
        var id: Int
        var isFaceUp: Bool = false
        var isMatched : Bool = false
        var content : CardContent
    }
}
