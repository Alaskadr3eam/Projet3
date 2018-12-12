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
    
    static func menuGame()->String {
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
    
    static func choiceGame() {
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
            
            //  Game.teamPlay( team1, teamD: team2)
            // Game.teamPlay( team2, teamD: team1)
            counter = Game.playGame()
            
            
            Game.gameWinner()
            
        case "2":
            print("Au revoir, à bientot")
        case "3":
            print("C'est un jeu de match à mort. 2 équipes composé de 3 personnages s'affrontent jusqu'a ce que tout les personnages d'une des deux équipes n'ai plus de vie.")
            Game.choiceGame()
        default:
            print("Je ne comprends pas !")
        }
    }
// function for deroulement game
    static func teamPlay(_ teamA: Team, teamD: Team) {
        
        let attacker = teamA.chooseCharAttack()
        attacker.appiritionChest()
        if attacker.type == .Magus {
            attacker.choiceMagusAttack(teamA: teamA, teamD: teamD)
        } else {
            let attacked = teamD.chooseCharDefence()
            attacker.attack(player: attacked)
        }
       
        
        
    }
    
// func winner
static func gameWinner() {
        var winnerName: String
        if team1.isDead() > 0 {
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
static func playGame() -> Int {
   // var counter = 0 // counter to find out how much lap the winning team has won
    var counterStatus = 0
        repeat{
            
            Game.teamPlay(team1,teamD: team2)
            counterStatus += 1
            if team2.isDead() != 0 {
                
                Game.teamPlay(team2, teamD: team1)
                counterStatus += 1
                
            }
            counter += 1
            
            print("\(counterStatus)")
            print("\(counter)")
            team1.guerrissonStatusPlayer()
            team2.guerrissonStatusPlayer()
            
        } while team1.isDead() != 0 && team2.isDead() != 0
    return counter
    }
    
   
}


