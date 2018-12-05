//
//  File.swift
//  newProjet3
//
//  Created by Clément Martin on 04/12/2018.
//  Copyright © 2018 Clément Martin. All rights reserved.
//

import Foundation

class LegendarySceptre: Weapon { // legendary Weapon that appears randomly with the vault and whose stats are random too
    
    init() {
            super.init(dp: Int(arc4random_uniform(UInt32(100 - 10) + UInt32(10)))) // choice of the care bonus randomly between 10 and 100
        }
    
}
