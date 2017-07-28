//
//  WebInfoViewController.swift
//  northAmericaFlagApp
//
//  Created by MAD Student on 6/22/17.
//  Copyright © 2017 MAD Student. All rights reserved.
//

import UIKit

class WebInfoViewController: UIViewController {

    @IBOutlet weak var myWebView: UIWebView!
    var name = "Anguilla"
    override func viewDidLoad() {
        super.viewDidLoad()
    
       var wikiUrlString = "https://en.wikipedia.org/wiki/" + name
    wikiUrlString = wikiUrlString.replacingOccurrences(of: " ", with: "_")
        if let wikiUrl = URL(string: wikiUrlString){
            myWebView.loadRequest(URLRequest(url: wikiUrl))
           
            
        }
        
        }
    }

  








