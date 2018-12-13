//
//  Game.swift
//  newProjet3
//
//  Created by Clément Martin on 29/11/2018.
//  Copyright © 2018 Clément Martin. All rights reserved.
//

import Foundation

class Game {
    // funcion startGame for launch the game in the main
    static func startGame() {
        print("Bonjour")
        
        Game.choiceGame()
        
        
    }
    
    private static func menuGame()->String {
        var choice = ""
        print(" Voulez vous commencer une partie d'EpicGame ?"
            + "\n1. Oui                         2.Non               3.Règle du jeu")
        repeat {
            if let str = readLine() {
                choice = str
            }
        } while choice != "1" && choice != "2" && choice != "3"
        return choice
    }
    
    private static func choiceGame() {
        let choice = Game.menuGame()
        switch choice {
        case "1":
            print("")
            print("Creation équipe 1:")
            team1.createTeam()
            print("")
            print("Creation équipe 2:")
            team2.createTeam()
            
            team1.descriptionTeam()
            team2.descriptionTeam()
            
          
            counter = Game.playGame()
            
            
            Game.gameWinner()
            
        case "2":
            print("Au revoir, à bientot")
        case "3":
            print("C'est un jeu de match à mort. 2 équipes composées de 3 personnages s'affrontent jusqu'à ce que tout les personnages d'une des deux équipes n'ai plus de vie."
                + "\nDes armes légendaires apparaissent dans le jeu, attenion, toute fois ça peut etre à double tranchant.")
            Game.choiceGame()
        default:
            print("Je ne comprends pas !")
        }
    }
    // function for deroulement game
    private static func teamPlay(_ teamA: Team,_ teamD: Team) {
        
        let attacker = teamA.choosePlayerForAttack()
        Game.appiritionChest(attacker)
        if attacker.type == .magus {
            attacker.ifMagusAttack(teamA, teamD)
        } else {
            let attacked = teamD.choosePlayerForDefence()
            attacker.attack(player: attacked)
        }
        
        
        
    }
    
    // func winner
    private static func gameWinner() {
        var winnerName: String
        if !team1.isDead() {
            winnerName = team1.nameTeam
        } else {
            winnerName = team2.nameTeam
        }
        print("")
        print("================================================")
        print("Félicitation, le vainqueur est " + winnerName + "!"
            + "\nVous avez gagner en \(counter) attaques"
            + "\n=============================================")
    }
    // func for the game, defense-attack phase
    private static func playGame() -> Int {
        // var counter = 0 // counter to find out how much lap the winning team has won
        var counterStatus = 0
        repeat{
            
            Game.teamPlay(team1,team2)
            counterStatus += 1
            if !team2.isDead() {
                
                Game.teamPlay(team2,team1)
                counterStatus += 1
                
            }
            counter += 1
            
            
            team1.guerrissonStatusPlayer()
            team2.guerrissonStatusPlayer()
            
        } while !team1.isDead() && !team2.isDead()
        return counter
    }
     // function of the chest that one opens or not, and different for the mage and the combatants
   private static func chest(player: Player) {
        print("Un coffre apparait, voulez vous l'ouvrir ?"
            + "\n1. Oui                     2.Non")
        let choice = readLine()
        switch choice {
        case "1":
            print("====================================================================")
            print("Vous trouvez une arme légendaire dans ce coffre, votre personnage s'en équipe")
            player.weapon = player.type == .magus ? LegendarySceptre() : LegendaryWeapon()
            if player.type == .magus {
                print("\(player.name) à maintenant une arme qui à \(player.weapon.dp) de soin")
            } else {
                print("\(player.name) à maintenant une arme qui à \(player.weapon.dp) de dégat")
            }
            print("======================================================================")
        case "2":
            print("tant pis pour vous !")
        default: break
        }
    }
    //function for the appearance of the safe randomly
   private static func appiritionChest(_ player: Player) {
        let choice = Int.random(in: 1...5)
        switch choice {
        case 1 :
            self.chest(player: player)
        default : break
        }
        
    }
    
}


