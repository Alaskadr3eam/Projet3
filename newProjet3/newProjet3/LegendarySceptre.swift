//
//  File.swift
//  newProjet3
//
//  Created by Clément Martin on 04/12/2018.
//  Copyright © 2018 Clément Martin. All rights reserved.
//

import Foundation

final class LegendarySceptre: Weapon { // legendary Weapon that appears randomly with the vault and whose stats are random too
    
    init() {
        super.init(dp: Int.random(in: 0...100)) // choice of the care bonus randomly between 10 and 100
    }
    
}


