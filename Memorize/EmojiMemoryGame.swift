//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Guillermo Reyes on 8/18/25.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["😂", "😭", "😒", "😏","😩","😳","😁","😜","😗"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 6) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            }else {
               return "‼"
            }
        }
    }
    
    
   @Published private var model = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    
    // Mark: - Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
}

