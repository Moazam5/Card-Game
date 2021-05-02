//
//  CardGame.swift
//  Card Game
//
//  Created by Moazam Mir on 2/22/21.
// Model

import Foundation

struct CardGame<CardContent>
{
    var cards : Array<Card>
    
    init(numberOfPairsOfCards : Int, cardContentFactory : (Int) -> CardContent) {
        cards = Array<Card>()
        
        for pairIndex in 0..<numberOfPairsOfCards{
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex * 2, content: content))
            cards.append(Card(id: pairIndex * 2 + 1,  content: content))
        }
        cards.shuffle()
        
    }
    
    mutating func choose(card : Card)
    {
        print("card chosen:\(card)")
        let chosenIndex = self.index(of: card)
        self.cards[chosenIndex].isFaceUp = !self.cards[chosenIndex].isFaceUp
    }
    
    func index(of card: Card) -> Int{
        for index in 0..<self.cards.count{
            if self.cards[index].id == card.id{
                return index
            }
        }
        
        return 0 // TODO: bogus!
    }
    
    struct Card : Identifiable {
        var id: Int
        var isFaceUp: Bool = true
        var isMatched : Bool = false
        var content : CardContent
    }
}
