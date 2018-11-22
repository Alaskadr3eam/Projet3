//
//  Characters.swift
//  est
//
//  Created by Clément Martin on 21/11/2018.
//  Copyright © 2018 Clément Martin. All rights reserved.
//

import Foundation
//creating a character
class Characters {
    var name = ""
    let type: TypesCharacters
    var weapon: Weapon
    var life: Int
    
    init(type: TypesCharacters) {
        
        self.type = type
//switch to assign a type to the character
        switch self.type {
        case .Magus:
            self.weapon = Scepter()
            self.life = 90
        case .Fighter:
            self.weapon = Blade()
            self.life = 100
        case .Colossus:
            self.weapon = Hammer()
            self.life = 130
        case .Dwarf:
            self.weapon = Ax()
            self.life = 70
            
        }
    }
    
    func recevoir(degats: Int) {
        self.life = self.life - degats
        
        if self.life < 0 {
            self.life = 0
        }
    }
    
    func attaquer(personnage: Characters) {
        personnage.recevoir(degats: self.weapon.dp)
    }
    
    
}

    

