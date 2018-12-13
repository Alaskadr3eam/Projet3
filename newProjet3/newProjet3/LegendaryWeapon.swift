//
//  LegendaryWeapon.swift
//  newProjet3
//
//  Created by Clément Martin on 03/12/2018.
//  Copyright © 2018 Clément Martin. All rights reserved.
//

import Foundation

final class LegendaryWeapon: Weapon {
    
    init() {
        
        super.init(dp: Int(arc4random_uniform(UInt32(100 - 20)) + UInt32(20)))
    }
    
    
    
}
    
    // the legendary weapon allows you to make an impressive critical hit, bringing the death of the opposing character in one shot. By cons the shot is random.



