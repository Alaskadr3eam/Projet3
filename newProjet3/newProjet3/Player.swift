//
//  Player.swift
//  newProjet3
//
//  Created by Clément Martin on 29/11/2018.
//  Copyright © 2018 Clément Martin. All rights reserved.
//

import Foundation

class Player: Character {
    var name = ""
    var type: CharacterType
    var weapon: Weapon
    var life: Int
    static var myCharacName = [String]()

    init(type: CharacterType) {
        
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
    // chek if name player is unique
    func uniqueName() -> String {
        let unique = false
        repeat{
            if let name = readLine() {
                if checkUniqueName(name){
                    return name
                } else {
                    print("Le nom doit être unique, veuillez renommer le personnage")
                }
            }
        } while !unique
    }
    // chek if name player is unique
    func checkUniqueName(_ name: String) -> Bool {
        for character in Player.myCharacName {
            if(name == character) {
                print("Le nom existe deja")
                return false
            }
        }
        Player.myCharacName.append(name)
        return true
    }
    // creation player, and choice type characters
    static func createPlayer() -> Player {
        var choiceCharac: String
        repeat {
            print("")
            print("Classe personnage :"
                + "\n1.Fighter          2.Mage          3.Colosse          4.Nain")
            choiceCharac = readLine()!
        } while choiceCharac != "1" && choiceCharac != "2" && choiceCharac != "3"
        
        var type1: CharacterType!
        switch choiceCharac {
        case "1":
            type1 = .Fighter
        case "2":
            type1 = .Magus
        case "3":
            type1 = .Giant
        case "4":
            type1 = .Dwarf
        default: break
        }
        let player = Player(type: type1)
        
        print("Nom du personnage ?")
        player.name = uniqueName(player)()

        return player
    }
    // function receive degat
    func receive(degat: Int) {
        self.life = self.life - degat
        if self.life < 0 {
            self.life = 0
        }
    }
    // attack, player attack player, and when life<0 then player is DEAD
    func attack(player: Player) {
        player.receive(degat: self.weapon.dp)
        print("")
        if player.isDead(player: player) == true {
            print("")
        } else {
        print("Le personnage \(player.name) de type \(player.type) a maintenant \(player.life) de vie.")
        }
    }
    // function to check if player is dead
    func isDead(player: Player) -> Bool{
        if player.life == 0 {
            print("Le personnage \(player.name) de type \(player.type) est mort")
        }
        return true
    }
    // func receive care
    func receiveCare(care: Int) {
        self.life = self.life + care
    }
    // func player receive care
    func care(player: Player) {
        player.receiveCare(care: self.weapon.dp)
        print("")
        print("Le personnage \(player.name) de type \(player.type) a été soigné, il a maintenant \(player.life) de vie.")
    }
    
    func chest(player: Player) -> Player {
        print("Un coffre apparait, voulez vous l'ouvrir ?"
        + "\n1. Oui                     2.Non")
        var choice = readLine()
        switch choice {
        case "1":
            print("Vous trouvez une arme légendaire dans ce coffre, votre personnage s'en équipe")
            player.weapon = LegendaryWeapon()
            
        case "2":
            print("tant pis pour vous !")
        default: break
        }
        return player
    }
    
    func nil1(player: Player) -> Player{
        var player = player
        return player
    }
    
    func nil2(player: Player)-> Player{
        var player = player
        return player
    }
    
    
    func randomFunc(player: Player) -> Player {
        let randomFunc = [self.chest(player: player), self.nil1(player: player), self.nil2(player: player)] as [Any]
        var player = Int(arc4random_uniform(UInt32(randomFunc.count)))
        return randomFunc[player] as! Player
    }
    
}
