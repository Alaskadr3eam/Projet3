//
//  Team.swift
//  newProjet3
//
//  Created by Clément Martin on 29/11/2018.
//  Copyright © 2018 Clément Martin. All rights reserved.
//

import Foundation

class Team {
    var nameTeam = ""
    var player1: Player?
    var player2: Player?
    var player3: Player?
    
    
  static func createTeam(team: Team) {
        print("")
        print("Nom de l'équipe ?")
        team.nameTeam = readLine()!
        repeat{
            team.player1 = Player.createPlayer()
            team.player2 = Player.createPlayer()
            team.player3 = Player.createPlayer()
            
        } while team.isTeamFull() == false
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
            print("Toutes l'équipe est morte")
        }
        return teamLife
    }
  // description player
    func description(player: Player) {
        if  player.life == 0 {
            print("Ce personnage est MORT.")
            //player? = nil
        } else {
            print("Le perso de type \(player.name) de classe \(player.type) à \(player.life) de vie et fait \(player.weapon.dp) de dégat ")
        }
    }
//description team, and players team
   static func descriptionTeam(team: Team ) {
        print("")
        print(team.nameTeam)
        print("")
        print("1")
            team.description(player: team.player1!)
        print("2");team.description(player: team.player2!)
        print("3");team.description(player: team.player3!)
    }
// choose player for receive degat
    static  func chooseCharDefence(team: Team) -> Player {
        var player: Player
        print("")
        print(" Choisie un des personnages adversaire à attaquer :")
        player = choiceCharac(team: team)
        return player
    }
//choose player for attack or treat
    static func chooseCharAttack(team: Team) -> Player {
        var player: Player
        print("")
        print("\(team.nameTeam) choisie un de tes personnages pour attaquer :")
        player = choiceCharac(team: team)
        return player
    }
 //choose player for receive care
    static func chooseCharToHeal(team: Team) -> Player{
        var player: Player
         print("Choisie un de tes personnages à soigner")
        player = choiceCharac(team: team)
        return player
    }
//func for choice user
    func choiceInTeam() -> Player{//-> String {
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
    
  static func choiceCharac(team: Team) -> Player{
        var player: Player
        repeat {
           
            
            self.descriptionTeam(team: team)
            
            player = team.choiceInTeam()
            if player.life > 0 {
                print("Vous avez choisi \(player.name) de tupe \(player.type) qui a \(player.life) de vie")
                
            } else {
                print("Choix impossible")
            }
        } while player.life == 0
        return player
    }

}
