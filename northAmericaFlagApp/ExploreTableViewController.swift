//
//  ExploreTableViewController.swift
//  northAmericaFlagApp
//
//  Created by MAD Student on 6/26/17.
//  Copyright © 2017 MAD Student. All rights reserved.
//

import UIKit

class ExploreTableViewController: UITableViewController {

    let thisCardDeck = CardDeck()
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }

   
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return thisCardDeck.cardData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! listTableViewCell
        cell.nameLabel.text  = thisCardDeck.cardData[indexPath.row].name
        cell.flagImage.image = UIImage(named: thisCardDeck.cardData[indexPath.row].name)

       // cell.textLabel?.text = thisCardDeck.cardData[indexPath.row].name

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "TableToFlashCard", sender: indexPath.row )
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVc = segue.destination as! CardViewController
        destVc.exploreCardNumber = sender as? Int
    }
}
