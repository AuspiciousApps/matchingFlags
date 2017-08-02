//
//  Game.swift
//  newFlag
//
//  Created by MAD Student on 7/19/17.
//  Copyright © 2017 MAD Student. All rights reserved.
//

import Foundation
import AVFoundation

protocol MatchingGameDelegate {
    func game(_ game: Game, hideCards cards:[Int])
    
}

struct Game  {
    var deckOfCards = DeckOfCards()
    let synthesizer = AVSpeechSynthesizer()
    var gameDelegate: MatchingGameDelegate?
    var unmatchedCardsRevealed: [Int] = []
    mutating func flipCard(atIndexNumber index: Int) ->Bool{
        if unmatchedCardsRevealed.count < 2 {
           
            unmatchedCardsRevealed.append(index)
          
            if unmatchedCardsRevealed.count == 2  {
                let card1Name = deckOfCards.deltCards[unmatchedCardsRevealed[0]]
               let card2Name = deckOfCards.deltCards[unmatchedCardsRevealed[1]]
                if card1Name == card2Name {
                print("match!!!!")
            }
            }
        return true
        }else {
            resetUnmatchedCards()
            return false
        }
        
//        self.gameDelegate?.game(self, hideCards: [1])
//        return true
    }
    mutating func resetUnmatchedCards() {
        self.gameDelegate?.game(self, hideCards: unmatchedCardsRevealed)
        unmatchedCardsRevealed.removeAll()
    }
    func speakCard(number cardTag: Int) {
        synthesizer.stopSpeaking(at: .immediate)
        let utterance = AVSpeechUtterance(string: deckOfCards.deltCards[cardTag])
        synthesizer.speak(utterance)
    }
}
