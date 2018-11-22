//
//  Characters.swift
//  est
//
//  Created by Clément Martin on 21/11/2018.
//  Copyright © 2018 Clément Martin. All rights reserved.
//

import Foundation

class Characters {
    var name = ""
    let type: TypesCharacters
    var weapon: Weapon
    var vie: Int
    
    init(type: TypesCharacters) {
        
        self.type = type
        
        switch self.type {
        case .Magus:
            self.weapon = Scepter()
            self.vie = 90
        case .Fighter:
            self.weapon = Blade()
            self.vie = 100
        case .Colossus:
            self.weapon = Hammer()
            self.vie = 130
        case .Dwarf:
            self.weapon = Ax()
            self.vie = 70
            
        }
    }
    
}

    
    

