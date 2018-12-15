//
//  Player.swift
//  newProjet3
//
//  Created by Clément Martin on 29/11/2018.
//  Copyright © 2018 Clément Martin. All rights reserved.
//

import Foundation

final class Player {
    var name = ""           //name player
    var type: CharacterType // type player(mage, nain, figter ...)
    var weapon: Weapon      // weapon type associed on the player type
    var life: Int           // life associed on the player type
    var statut: Statut = .normal   // mental state of the player
    static var myCharacName = [String]() // array for check player name is unique
    
    init(type: CharacterType) {
        
        self.type = type
        //switch to assign a type to the character
        switch self.type {
        case .magus:
            self.weapon = Scepter()
            self.life = 90
        case .fighter:
            self.weapon = Blade()
            self.life = 100
        case .giant:
            self.weapon = Hammer()
            self.life = 130
        case .dwarf:
            self.weapon = Ax()
            self.life = 70
            
        }
    }
    // chek if name player is unique
    private func uniqueName() -> String {
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
    private func checkUniqueName(_ name: String) -> Bool {
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
        } while choiceCharac != "1" && choiceCharac != "2" && choiceCharac != "3" && choiceCharac != "4"
        
        var type1: CharacterType!
        switch choiceCharac {
        case "1":
            type1 = .fighter
        case "2":
            type1 = .magus
        case "3":
            type1 = .giant
        case "4":
            type1 = .dwarf
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
        } else if self.type == .magus{
            print("\(self.name) de type \(self.type) à \(self.life) de vie, un pouvoir de soin de \(self.weapon.dp) et un pouvoir mental qui est la PEUR. \(self.statut)")
        } else {
            print("\(self.name) de type \(self.type) à \(self.life) de vie et fait \(self.weapon.dp) de dégat. \(self.statut)")
        }
    }
    // function receive degat
    private func receive(degat: Int) {
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
    private func isDead() -> Bool {
        print("Le personnage \(self.name) de type \(self.type) est mort")
        return self.life == 0
    }
    // func receive care
    private func receiveCare(care: Int) {
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
            player.statut = .normal
            print("")
            print("================================")
            print("Le personnage \(player.name) de type \(player.type) a été soigné, il a maintenant \(player.life) de vie et son état est \(player.statut).")
            print("================================")
        }
    }
    // function care of status
    func careStatus(player: Player) {
        player.statut = .normal
        print("")
        print("================================")
        print("Le personnage \(player.name) de type \(player.type) a été soigné, son statut est maintenant \(player.statut).")
        print("================================")
    }
    // function scared, player scared not playing
    private func isScared(affraid: Statut) {
        self.statut = .peur
    }
    //function affraid player
    func affraid(player: Player) {
        player.isScared(affraid: self.statut)
        print("")
        print("=======================================================")
        print("Le mage \(self.name) effraie le \(player.type) \(player.name),"
            + "\n\(player.name) a changé de statut, maintenant il est paralysé par la \(player.statut)"
            + "\n=============================================================================")
    }
    // function for the choice of the mage between attack(mental) or care
    func ifMagusAttack(_ teamA: Team,_ teamD: Team) {
        var choice1: String
        repeat {
            print("======================================")
            print("Qu'elle magie voulez vous utiliser ? "
                + "\n1.Soin                 2.La peur."
                + "\n====================================")
            choice1 = readLine()!
        } while choice1 != "1" && choice1 != "2"
        
        switch choice1 {
        case "1":
            self.magusChooseHisMagic(teamA)
        case "2":
            let playerScared = teamD.choosePlayerForDefence()
            self.affraid(player: playerScared)
        default: print("pas compris")
        self.ifMagusAttack(teamA,teamD)
        }
    }
    // funcion for the choice of mage care between life or status
    func magusChooseHisMagic(_ team: Team) {
        var choice: String
        repeat{
            print("====================")
            print("Voulez vous soigner ? (si vous avez une arme legendaire, celle ci soigne la vie et le statut en meme temps)"
                + "\n1.Vie       2.Statut"
                + "\n=======================")
            choice = readLine()!
        }while choice != "1" && choice != "2"
        
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
    // function to heal the status automatically every 3 turns
    func guerrisonStatusPlayer() {
        if (counter%3 == 0 && self.statut == .peur) {
            self.statut = .normal
        }
    }
}
