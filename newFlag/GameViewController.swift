//
//  ViewController.swift
//  newFlag
//
//  Created by MAD Student on 7/17/17.
//  Copyright © 2017 MAD Student. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, MatchingGameDelegate {
    
    @IBOutlet weak var cardButton: UIButton!

   var game = Game()//instanciating a struct..(make a object)

    override func viewDidLoad() {
        super.viewDidLoad()
        game.gameDelegate = self
           }
    @IBAction func cardTapped(_ sender: UIButton) {
       let tagNum = sender.tag
        if   game.flipCard(atIndexNumber: tagNum - 1){
            let thisImage = UIImage(named: game.deckOfCards.deltCards[tagNum - 1])
           sender.setBackgroundImage(thisImage, for: .normal)
            
        
        
        game.speakCard(number: tagNum - 1)
        }
    }
    @IBAction func newGame(_ sender: UIButton) {
        for tagNum in 1...12{
            if let thisButton = self.view.viewWithTag(tagNum) as? UIButton {
            
                thisButton.setBackgroundImage(#imageLiteral(resourceName: "cardBack"), for: .normal)
            }
        }
        game.deckOfCards.drawCards()
      
    }
    func game(_ game: Game, hideCards cards: [Int]) {
        for cardIndex in cards {
            if let thisButton = self.view.viewWithTag(cardIndex + 1) as? UIButton {
                
                thisButton.setBackgroundImage(#imageLiteral(resourceName: "cardBack"), for: .normal)
            }
        }
    }
//    let thisImage = UIImage(named: nameList[tagNum - 1])
//    thisButton.setBackgroundImage(thisImage, for: .normal)
    
//    
//    func drawCards() {
//        deltCards = nameList
//        //nameList = shuffle(nameList)
//       deltCards.shuffle()
//        
//    }

//highlight then command /

}

