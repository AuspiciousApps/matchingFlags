//
//  SettingsViewController.swift
//  northAmericaFlagApp
//
//  Created by MAD Student on 6/21/17.
//  Copyright © 2017 MAD Student. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var flagSwitch: UISwitch!
    @IBOutlet weak var nameSwitch: UISwitch!
    @IBOutlet weak var inFoSwitch: UISwitch!
    @IBAction func checkSwitches(_ sender: UISwitch) {
        
        if nameSwitch.isOn && flagSwitch.isOn && inFoSwitch.isOn{
            if sender.tag == 101 || sender.tag == 103{
                flagSwitch.isOn = false
            }else {
                nameSwitch.isOn = false
            }
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let thatCardVC = segue.destination as! CardViewController
        thatCardVC.hideSetting = (nameSwitch.isOn,flagSwitch.isOn,inFoSwitch.isOn)
    }

   
}
