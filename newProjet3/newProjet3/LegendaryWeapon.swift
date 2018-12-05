//
//  LegendaryWeapon.swift
//  newProjet3
//
//  Created by Clément Martin on 03/12/2018.
//  Copyright © 2018 Clément Martin. All rights reserved.
//

import Foundation

class LegendaryWeapon: Weapon {
    
        init() {
           
            super.init(dp: Int(arc4random_uniform(UInt32(100 - 20)) + UInt32(20)))
    }
    
 
    
}
    
    //l'arme legendaire permet de porter des coup critique impressionnant, amenant la mort du personnage adversaire en un seul coup. Par contre le coup est aléatoire.
    



