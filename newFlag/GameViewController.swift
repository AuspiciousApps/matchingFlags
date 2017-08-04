//
//  ViewController.swift
//  newFlag
//
//  Created by MAD Student on 7/17/17.
//  Copyright © 2017 MAD Student. All rights reserved.
//

import UIKit
import LTMorphingLabel
import MZTimerLabel

class GameViewController: UIViewController, MatchingGameDelegate {
    
    
    @IBOutlet weak var burnLabel: LTMorphingLabel!
    @IBOutlet weak var cardButton: UIButton!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    
    
    
    var stopWatch: MZTimerLabel!
   
    var game = Game()//instanciating a struct..(make a object)
    var gameNum = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        game.gameDelegate = self
        burnLabel.morphingEffect = .burn
        //game.newGame()
         stopWatch = MZTimerLabel.init(label: timerLabel)
        stopWatch.timeFormat = "mm:ss SS"
        stopWatch.start()
    }
    @IBAction func cardTapped(_ sender: UIButton) {
        let tagNum = sender.tag
        if   game.flipCard(atIndexNumber: tagNum - 1){
            let thisImage = UIImage(named: game.deckOfCards.deltCards[tagNum - 1])
            //sender.setImage(thisImage, for: .normal)
            UIView.transition(with: sender, duration: 0.4, options: .transitionFlipFromRight, animations: { sender.setImage(thisImage, for: .normal)}, completion: nil)
            
            // game.speakCard(number: tagNum - 1)
            
        }
    }
    @IBAction func newGame(_ sender: UIButton) {
        
        
        for tagNum in 1...12{
            if let thisButton = self.view.viewWithTag(tagNum) as? UIButton {
                
                //thisButton.setImage(#imageLiteral(resourceName: "cardBack"), for: .normal)
                UIView.transition(with: thisButton, duration: 0.2, options: .transitionFlipFromTop, animations: { thisButton.setImage(#imageLiteral(resourceName: "cardBack"), for: .normal)}, completion: nil)
            }
        }
        
        gameNum += 1
        burnLabel.text = "Game #\(gameNum)"
        game.newGame()
        stopWatch.reset()
        //sender.setImage(thisImage, for: .normal)
        
        
        
    }
    func game(_ game: Game, hideCards cards: [Int]) {
        let delayTime = DispatchTime.now() + Double(Int64(1 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: delayTime){
            for cardIndex in cards {
                if let thisButton = self.view.viewWithTag(cardIndex + 1) as? UIButton {
                    
                    UIView.transition(with: thisButton, duration: 0.2, options: .transitionFlipFromTop, animations: { thisButton.setImage(#imageLiteral(resourceName: "cardBack"), for: .normal)}, completion: nil)
                }
            }
            self.game.noFlipWhileWait = false
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

