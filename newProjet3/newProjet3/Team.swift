//
//  Team.swift
//  newProjet3
//
//  Created by Clément Martin on 29/11/2018.
//  Copyright © 2018 Clément Martin. All rights reserved.
//

import Foundation

class Team {
    var nameTeam = ""     //name team
    var player1: Player?
    var player2: Player?
    var player3: Player?
    
// function for create team
   func createTeam() {
        print("")
        print("Nom de l'équipe ?")
        self.nameTeam = readLine()!
        repeat{
            print("")
            print("Personnage 1:")
            self.player1 = Player.createPlayer()
            print("")
            print("Personnage 2:")
            self.player2 = Player.createPlayer()
            print("")
            print("Personnage 3:")
            self.player3 = Player.createPlayer()
            
        } while self.isTeamFull() == false
    }
// function for chek if full team
    func isTeamFull() -> Bool {
        if player1 != nil && player2 != nil && player3 != nil {
            print("Equipe pleine")
        }
        return true
    }
// function for check if team is Dead
    func isDead() -> Int {
        let teamLife = player1!.life + player2!.life + player3!.life
        if teamLife == 0 {
            print("")
            print("============================")
            print("Toutes l'équipe est morte")
            print("===========================")
        }
        return teamLife
    }
//description team, and players team
   func descriptionTeam() {
        print("")
        print("====================================================")
        print(self.nameTeam)
        print("")
        print("1");self.player1!.description()
        print("2");self.player2!.description()
        print("3");self.player3!.description()
        print("====================================================")
    }
// choose player for receive degat
    func chooseCharDefence() -> Player {
        var player: Player
        print("")
        print("=> Choisie un des personnages adversaire à attaquer :")
        player = self.choiceCharacD()
        return player
    }
//choose player for attack or treat
    func chooseCharAttack() -> Player {
        var player: Player
        print("")
        print(" => \(self.nameTeam) choisie un de tes personnages pour attaquer :")
        player = self.choiceCharacA()
        return player
    }
 //choose player for receive care
   func chooseCharToHeal() -> Player{
        var player: Player
         print(" => Choisie un de tes personnages à soigner")
        player = self.choiceCharacD()
        return player
    }
//func for choice player in the team
    func choiceInTeam() -> Player{
        var choice = ""
        var player: Player?
        
        repeat {
            if let str = readLine() {
                choice = str
            }
        } while choice != "1" && choice != "2" && choice != "3"
       
        switch choice {
        case "1":
            player = self.player1!
        case "2":
            player = self.player2!
        case "3":
            player = self.player3!
        default:
            print("Je ne comprends pas !")
        }
        return player!
    }
// function to choose the character that will be attacked
    func choiceCharacD() -> Player {
        var player: Player
        repeat {
            self.descriptionTeam()
            player = self.choiceInTeam()
           if player.life > 0  {
                print("Vous avez choisi \(player.name) de type \(player.type) qui a \(player.life) de vie de status : \(player.statut)")
            } else {
                print("Choix impossible")
            }
        } while player.life == 0
        return player
    }
// function to choose the player for attack
   func choiceCharacA() -> Player{
        var player: Player
        repeat {
            self.descriptionTeam()
            player = self.choiceInTeam()
            if player.life > 0 && player.statut == "Normal"  {
                print("Vous avez choisi \(player.name) de type \(player.type) qui a \(player.life) de vie")
            } else if player.statut == "PEUR" {
                print("Vous ne pouvez pas sélectionner ce personage car il est effrayé")
            } else {
                print("Choix impossible")
            }
        } while player.life == 0 || player.statut == "PEUR"
        return player
    }

    func guerrissonStatusPlayer() {
        
        self.player1!.guerrisonStatusPlayer()
        self.player2!.guerrisonStatusPlayer()
        self.player3!.guerrisonStatusPlayer()
    }
    
}

