//
//  Player.swift
//  newProjet3
//
//  Created by Clément Martin on 29/11/2018.
//  Copyright © 2018 Clément Martin. All rights reserved.
//

import Foundation

class Player: Character {
    var name = ""           //name player
    var type: CharacterType // type player(mage, nain, figter ...)
    var weapon: Weapon      // weapon type associed on the player type
    var life: Int           // life associed on the player type
    var status = "Normal"   // mental state of the player
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
        print("Nom du personnage:")
        player.name = uniqueName(player)()
        return player
    }
    func description() {
     if self.life == 0 {
     print("Ce personnage est MORT.")
     } else if self.type == .Magus{
        print("\(self.name) de type \(self.type) à \(self.life) de vie, un pouvoir de soin de \(self.weapon.dp) et un pouvoir mental qui est la PEUR. \(self.status)")
     } else {
        print("\(self.name) de type \(self.type) à \(self.life) de vie et fait \(self.weapon.dp) de dégat. \(self.status)")
     }
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
        print("====================================================================================="
            + "\n\(self.name) de type \(self.type) attaque \(player.name) de type \(player.type) : "
            + "\n\(player.name) de type \(player.type) a maintenant \(player.life) de vie."
            + "\n===================================================================================")
        }
// function to check if player is dead
    func isDead() -> Bool {
         print("Le personnage \(self.name) de type \(self.type) est mort")
        return self.life == 0
    }
// func receive care
    func receiveCare(care: Int) {
        self.life = self.life + care
    }
// func player receive care
    func care(player: Player) {
        if self.weapon.dp == 10 {
        player.receiveCare(care: self.weapon.dp)
        print("")
            print("===================================================================================="
            + "\n\(self.name) de type mage soigne \(player.name) de type \(player.type) :"
            + "\n\(player.name) de type \(player.type) a été soigné, il a maintenant \(player.life) de vie."
            + "\n======================================================================================")
        } else {
            player.receiveCare(care: self.weapon.dp)
            player.status = "Normal"
            print("")
            print("================================")
            print("Le personnage \(player.name) de type \(player.type) a été soigné, il a maintenant \(player.life) de vie et son état est \(player.status).")
            print("================================")
        }
    }
// function care of status
    func careStatus(player: Player) {
        player.status = "Normal"
        print("")
        print("================================")
        print("Le personnage \(player.name) de type \(player.type) a été soigné, son status est maintenant \(player.status).")
        print("================================")
    }
// function scared, player scared not playing
    func isScared(affraid: String) {
        self.status = "PEUR"
    }
//function affraid player
    func affraid(player: Player) {
        player.isScared(affraid: self.status)
        print("")
        print("=======================================================")
        print("Le mage \(self.name) effraie le \(player.type) \(player.name),"
            + "\n\(player.name) a changé de status, maintenant il est paralysé par la \(player.status)"
            + "\n=============================================================================")
    }
// function of the chest that one opens or not, and different for the mage and the combatants
    func chest() {
        print("Un coffre apparait, voulez vous l'ouvrir ?"
        + "\n1. Oui                     2.Non")
        let choice = readLine()
        switch choice {
        case "1":
            print("====================================================================")
            print("Vous trouvez une arme légendaire dans ce coffre, votre personnage s'en équipe")
            self.weapon = self.type == .Magus ? LegendarySceptre() : LegendaryWeapon()
            if self.type == .Magus {
            print("\(self.name) à maintenant une arme qui à \(self.weapon.dp) de soin")
            } else {
                print("\(self.name) à maintenant une arme qui à \(self.weapon.dp) de dégat")
            }
            print("======================================================================")
        case "2":
            print("tant pis pour vous !")
        default: break
        }
    }
//function for the appearance of the safe randomly
    func appiritionChest() {
        let choice = Int.random(in: 1...5)
        switch choice {
        case 1 :
            self.chest()
        default : break
        }
        
    }
// function for the choice of the mage between attack(mental) or care
    func choiceMagusAttack(teamA: Team, teamD: Team) {
        print("======================================")
        print("Qu'elle magie voulez vous utiliser ? "
            + "\n1.Soin                 2.La peur."
            + "\n====================================")
        let choice1 = readLine()
        switch choice1 {
        case "1":
            self.magusChoiceCare(team: teamA)
        case "2":
            let playerScared = teamD.chooseCharDefence()
            self.affraid(player: playerScared)
        default: break
        }
    }
// funcion for the choice of mage care between life or status
    func magusChoiceCare(team: Team) {
        print("====================")
        print("Voulez vous soigner ? (si vous avez une arme legendaire, celle ci soigne la vie et le status en meme temps)"
        + "\n1.Vie       2.Status"
        + "\n=======================")
        let choice = readLine()!
        switch choice {
        case "1" :
            let charToHeal = team.chooseCharToHeal()
            self.care(player: charToHeal)
        case "2" :
            let charToStatus = team.chooseCharToHeal()
            self.careStatus(player: charToStatus)
        default: print("Pas compris")
        }
    }
}
