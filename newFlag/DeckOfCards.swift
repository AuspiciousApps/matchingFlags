//
//  DeckOfCards.swift
//  newFlag
//
//  Created by MAD Student on 7/19/17.
//  Copyright © 2017 MAD Student. All rights reserved.
//

import Foundation

struct DeckOfCards {
    var nameList = ["Anguilla","Antigua and Barbuda","Aruba","Bahamas","Barbados","Belize","Bermuda","Bonaire","British Virgin Islands","Canada","Cayman Islands","Costa Rica","Cuba","Curacao","Dominica","Dominican Republic","El Salvador","Greenland","Grenada","Guadeloupe","Guatemala","Haiti","Honduras","Jamaica","Martinique","Mexico","Montserrat","Navassa Island","Nicaragua","Panama","Puerto Rico","Saba","Saint Barthelemy","Saint Kitts and Nevis","Saint Lucia","Saint Martin","Saint Pierre and Miquelon","Saint Vincent and the Grenadines","Sint Eustatius.png","Sint Maarten ","Trinidad and Tobago","Turks and Caicos Islands","US Virgin Islands","USA"]
    var deltCards : [String] = []
    let numberOfMatches = 6
    init() {
        drawCards()
    }
    mutating func drawCards() {
        deltCards.removeAll()   
        nameList.shuffle()
        for i in 0..<numberOfMatches {
            deltCards.append(nameList[i])
            deltCards.append(nameList[i])
        }
        //deltCards = nameList
        //nameList = shuffle(nameList)
        deltCards.shuffle()
        
    }

}




