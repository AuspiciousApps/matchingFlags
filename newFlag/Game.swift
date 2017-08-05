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
    var sound = AVAudioPlayer()
    var deckOfCards = DeckOfCards()
    let synthesizer = AVSpeechSynthesizer()
    var gameDelegate: MatchingGameDelegate?
    var noFlipWhileWait = false
    var unmatchedCardsRevealed: [Int] = []
    var matchArray: [Int] = []
    
    
    init() {
        newGame()
    }
    
    mutating func flipCard(atIndexNumber index: Int) ->Bool{
        
        if noFlipWhileWait {return false}
        if !unmatchedCardsRevealed.isEmpty && unmatchedCardsRevealed[0] == index{return false}// this unmatced card has already been revealed
        if !matchArray.contains(index){return false} //card has alread been matched
        if unmatchedCardsRevealed.count < 2 {
            
            unmatchedCardsRevealed.append(index)
            cardFlip()
            
            if unmatchedCardsRevealed.count == 2  {
                
                let card1Name = deckOfCards.deltCards[unmatchedCardsRevealed[0]]
                let card2Name = deckOfCards.deltCards[unmatchedCardsRevealed[1]]
                if card1Name == card2Name {
                    
                    for (indexCounter, cardIndexValue) in matchArray.enumerated().reversed(){
                        if cardIndexValue == unmatchedCardsRevealed[0] || cardIndexValue == unmatchedCardsRevealed[1]{
                            matchArray.remove(at: indexCounter)
                            if matchArray.isEmpty{
                                gameOver()
                                
                                
                            }
                        }
                    }
                    speakCard(number: index)
                    unmatchedCardsRevealed.removeAll()
                    
                } else {
                    resetUnmatchedCards()
                }
            }
            return true
        }else {
            print("Error: This should Never be here")
            return false
        }
        
        //        self.gameDelegate?.game(self, hideCards: [1])
        //        return true
    }
    mutating func newGame() {
        ///
        shuffle()
        deckOfCards.drawCards()
        for (index, _) in deckOfCards.deltCards.enumerated() {
            matchArray.append(index)
        }
    }
    mutating func gameOverSound() {
        let path = Bundle.main.path(forResource: "complete", ofType: "mp3")
        playSound(withPath: path!)
    }
    
    
    mutating func cardFlip() {
        let path = Bundle.main.path(forResource: "card-flip", ofType: "mp3")
        playSound(withPath: path!)
    }
    
    mutating func shuffle() {
        let path = Bundle.main.path(forResource: "shuffle", ofType: "wav")
        playSound(withPath: path!)
    }
    
    mutating func playSound(withPath path: String) {
        
        let soundURL = URL(fileURLWithPath: path)
        do {
            try sound = AVAudioPlayer(contentsOf: soundURL)
            sound.prepareToPlay()
        } catch {
            print("Error! Couldn't load sound file")
        }
        sound.play()
    }
    
    
    
    mutating func resetUnmatchedCards() {
        noFlipWhileWait = true
        self.gameDelegate?.game(self, hideCards: unmatchedCardsRevealed)
        unmatchedCardsRevealed.removeAll()
    }
    func speakCard(number cardTag: Int) {
        synthesizer.stopSpeaking(at: .immediate)
        let utterance = AVSpeechUtterance(string: deckOfCards.deltCards[cardTag])
        synthesizer.speak(utterance)
    }
    mutating func gameOver(){
        gameOverSound()
    }
    
    
    
    
    
    
}
