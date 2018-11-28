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
        case .Giant:
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
    
    func newCreatePerso1() {           ////creation of each character
        
        var choiceCharac: String
        
        
        repeat {
            print("")
            print("Classe personnage 1 :"
                + "\n1.Fighter          2.Mage          3.Colosse          4.Nain")
            choiceCharac = readLine()!
        } while choiceCharac != "1" && choiceCharac != "2" && choiceCharac != "3"
        
        var type1: TypesCharacters!
        switch choiceCharac {
        case "1":
            type1 = .Fighter
        case "2":
            type1 = .Magus
        case "3":
            type1 = .Giant
        case "4":
            type1 = .Dwarf
        default : break
        }
        
       var personnage1 = Characters(type: type1)
       print("Nom du personnage ?")
        personnage1.name = readLine()!
        //myCharac.append(characters)
        // myCharac1[characters.name] = characters
        
    }
 
    func receiveCare(care: Int) {
        self.life = self.life + care
    }
    
    func care(characters: Characters) {
        characters.receiveCare(care: self.weapon.dp)
        print("")
        print("Le personnage \(characters.name) de type \(characters.type)a été soigné, il a maintenant \(characters.life) de vie.")
    }
    
    func receiveDammage(degats: Int){
        self.life = self.life - degats
        if self.life < 0 {
            self.life = 0
        }
    }
    
    func attack(characters: Characters){
        characters.receiveDammage(degats: self.weapon.dp)
        if characters.life == 0 {
            print("Le personnage \(characters.name) de type \(characters.type) à maintenant \(characters.life) de vie et sort de l'équipe.")
        } else {
            //return chooseCharAttacked().life
            print("Le personnage \(characters.name) de type \(characters.type) à maintenant \(characters.life) de vie.")
        }
    }

}

    

