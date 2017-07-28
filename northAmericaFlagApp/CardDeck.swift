//
//  CardDeck.swift
//  northAmericaFlagApp
//
//  Created by MAD Student on 6/21/17.
//  Copyright © 2017 MAD Student. All rights reserved.
//

import Foundation

struct CardDeck{
    var priorCountryNum = 0
    var randomNum = 0

    let cardData = [(name:"Anguilla",capital:"The Valley",population:"15,000",area:"35 sq mi"),(name:"Antigua and Barbuda",capital:"St.John's",population:"91,295",area:"170 sq mi"),(name:"Aruba",capital:"Oranjested",population:"103,400",area:"69.08 sq mi"),(name:"Bahamas",capital:"Nassau",population:"392,718",area:"5,358 sq mi"),(name:"Barbados",capital:"Bridgetown",population:"277,821",area:"169 sq mi"),(name:"Belize",capital:
        "Belmopan",population:"324,528",area:"8,867 sq mi"),(name:"Bermuda",capital:"Hamilton",population:"64,237",area:"20.5 sq mi"),(name:"Bonaire",capital:"Kralendijk",population:"18,905",area:"114 sq mi"),(name:"British Virgin Islands",capital:"Road Town",population:"28,054",area:"673.4/sq mi"),(name:"Canada",capital:"Ottawa",population:"35,151,728",area:"3,855,100 sq mi"),(name:"Cayman Islands",capital:"George Town",population:"56,732",area:"102 sq mi"),(name:"Costa Rica",capital:"San José",population:"4,586,353",area:"217.6/sq mi"),(name:"Cuba",capital:"Havana",population:"11,239,004",area:"42,426 sq mi"),(name:"Curacao",capital:"Willemstad",population:"158,986",area:"171 sq m"),(name:"Dominica",capital:"Roseau",population:"72,324",area:"290 sq mi"),(name:"Dominican Republic",capital:"Santo Domingo",population:"10,075,045",area:"18,704 sq mi"),(name:"El Salvador",capital:"San Salvador",population:"6,377,195",area:"8,124 sq mi"),(name:"Greenland",capital:"Nuuk",population:"56,483 ",area:"836,330 sq mi"),(name:"Grenada",capital:"St. George's",population:"109,590",area:"134.6 sq mi"),(name:"Guadeloupe",capital:"Basse-Terre",population:"402,119",area:"629 sq mi"),(name:"Guatemala",capital:"Guatemala City",population:"16,176,133",area:"42,042 sq mi"),(name:"Haiti",capital:"Port-au-Prince",population:"10,604,000",area:"10,710 sq mi"),(name:"Honduras",capital:"Tegucigalpa",population:"8,249,574",area:"43,433 sq mi"),(name:"Jamaica",capital:"Kingston",population:"2,950,210",area:"4,244 sq mi"),(name:"Martinique",capital:"Fort-de-France",population:"385,551",area:"436 sq mi"),(name:"Mexico",capital:"Mexico City",population:"119,530,753",area:"761,610 sq mi"),(name:"Montserrat",capital:"Plymouth",population:"4,900",area:"39 sq mi"),(name:"Navassa Island",capital:"N/A",population:"Uninhabited",area:"2 sq mi"),(name:"Nicaragua",capital:"Managua",population:"6,167,237",area:"50,338 sq mi"),(name:"Panama",capital:"Panama City",population:"4,058,374",area:"28,640.0 sq mi"),(name:"Puerto Rico",capital:"San Juan",population:"3,411,307",area:"3,515 sq mi"),(name:"Saba",capital:"The Bottom",population:"1,991",area:"5 sq mi"),(name:"Saint Barthelemy",capital:"Gustavia",population:"9,279",area:"9.7 sq mi"),(name:"Saint Kitts and Nevis",capital:"Basseterre",population:"54,961",area:"101 sq mi"),(name:"Saint Lucia",capital:"Castries",population:"184,999",area:"238 sq mi"),(name:"Saint Martin",capital:"Philipsburg",population:"77,741",area:"34 sq mi"),(name:"Saint Pierre and Miquelon",capital:"Saint-Pierre",population:" 6,080",area:"93 sq mi"),(name:"Saint Vincent and the Grenadines",capital:"Kingstown",population:"103,000",area:"150 sq mi"),(name:"Sint Eustatius",capital:"Oranjestad",population:"3,193",area:"390/sq mi"),(name:"Sint Maarten ",capital:"Philipsburg",population:"33,609",area:"14 sq mi"),(name:"Trinidad and Tobago",capital:"Port of Spain",population:"1,349,667",area:"1,981 sq mi"),(name:"Turks and Caicos Islands",capital:"Cockburn Town",population:"31,458",area:"238.0 sq mi"),(name:"US Virgin Islands",capital:"Charlotte Amalie",population:"106,405",area:"133.73 sq mi"),(name:"USA",capital:"Washington, D.C.",population:"325,145,963",area:"3,796,742 sq mi ")]
    
    mutating func changeCards()  {
        
        
        randomNum = priorCountryNum
        while randomNum == priorCountryNum {
            randomNum = Int(arc4random_uniform(UInt32(cardData.count)))
        }
        priorCountryNum = randomNum
        
    }
    

    
    
}
