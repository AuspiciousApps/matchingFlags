//
//  CardViewController.swift
//  northAmericaFlagApp
//
//  Created by MAD Student on 6/21/17.
//  Copyright © 2017 MAD Student. All rights reserved.
//

import UIKit
import AVFoundation

class CardViewController: UIViewController {
// outlets
    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var flagImage: UIImageView!
    //MARK: properties
    var sound = AVAudioPlayer()
    var exploreCardNumber: Int?
    var cardIsRevealed = false
    var myCardDeck = CardDeck()
    var hideSetting = (name: false, flag: false, info: false)
    //MARK: override methods
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard exploreCardNumber == nil else {
            return
        }
        if cardIsRevealed{
        myCardDeck.changeCards()
            playRevealSound()
        
        }else{
            playRevealSound()
        }
        cardIsRevealed = cardIsRevealed ? false : true
        updateDisplay()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if exploreCardNumber != nil{
            title = "Explore"
            myCardDeck.randomNum = exploreCardNumber!
        }else {
            myCardDeck.changeCards()
        }
        updateDisplay()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let thatWebVC = segue.destination as! WebInfoViewController
        thatWebVC.name = myCardDeck.cardData[myCardDeck.randomNum].name
    }

    //MARK: My Methods
    
    func updateDisplay() {
        // update display
        if cardIsRevealed || !hideSetting.flag {
             flagImage.image = UIImage(named: myCardDeck.cardData[myCardDeck.randomNum].name)
        }else{
            flagImage.image = UIImage(named: "AaHiddenFlag")
        }
            
        if cardIsRevealed || !hideSetting.name{
            countryLabel.text = myCardDeck.cardData[myCardDeck.randomNum].name
        }else{
            countryLabel.text = " "
        }
        
        if cardIsRevealed || !hideSetting.info {
            capitalLabel.text = "Capital: \(myCardDeck.cardData[myCardDeck.randomNum].capital)"
            populationLabel.text = "Population: \(myCardDeck.cardData[myCardDeck.randomNum].population)"
            areaLabel.text = "Area: \(myCardDeck.cardData[myCardDeck.randomNum].area)"

        }else{
            capitalLabel.text = " "
            populationLabel.text = " "
            areaLabel.text = " "
        }
        if hideSetting == (false,false,false){
            cardIsRevealed = true
        }
            }
    
    
    
       // Sound Methods
    func playDrawSound() {
        let path = Bundle.main.path(forResource: "draw-card", ofType: "mp3")
        playSound(withPath: path!)
    }
    func playRevealSound() {
        let path = Bundle.main.path(forResource: "reveal", ofType: "mp3")
        playSound(withPath: path!)
    }
    
    func playSound(withPath path: String) {
        
        let soundURL = URL(fileURLWithPath: path)
        do {
            try sound = AVAudioPlayer(contentsOf: soundURL)
            sound.prepareToPlay()
        } catch {
            print("Error! Couldn't load sound file")
        }
        sound.play()
    }
       //TODO: Add Sounds
    
}

