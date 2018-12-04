//
//  Game.swift
//  newProjet3
//
//  Created by Clément Martin on 29/11/2018.
//  Copyright © 2018 Clément Martin. All rights reserved.
//

import Foundation

class Game {
    
    static func startGame() {
        //var compteur = 0
        var choice = ""
        print("Bonjour")
        
        print(" Voulez vous commencer une partie d'EpicGame ?"
            + "\n1. Oui                         2.Non               3.Règle du jeu")
        repeat {
            if let str = readLine() {
                choice = str
            }
        } while choice != "1" && choice != "2"
        
        switch choice {
        case "1":
            
            Team.createTeam(team: team1)
            Team.createTeam(team: team2)
            
            Team.descriptionTeam(team: team1)
            Team.descriptionTeam(team: team2)
            
            
            
            
            compteur = Game.playGame()
           
            
            Game.gameWinner()
            
        case "2":
            print("Au revoir, à bientot")
        case "3":
            print("C'est un jeu de match à mort. 2 équipes composé de 3 personnages s'affrontent jusqu'a ce que tout les personnages d'une des deux équipes n'ai plus de vie.")
        default:
            print("Je ne comprends pas !")
        }
    }
// function play team1
static func jouer() {
        
       var attacker = Team.chooseCharAttack(team: team1)
    
    attacker = attacker.appiritionChest(player: attacker)
        if attacker.type == .Magus {
            let charToHeal = Team.chooseCharToHeal(team: team1)
            attacker.care(player: charToHeal)
        } else {
            let attacked = Team.chooseCharDefence(team: team2)
            attacker.attack(player: attacked)
        }
    
    }
 // function play team 2
static func jouer2() {
        var attacker = Team.chooseCharAttack(team: team2)
    attacker = attacker.appiritionChest(player: attacker)
        if attacker.type == .Magus {
            let charToHeal = Team.chooseCharToHeal(team: team2)
            attacker.care(player: charToHeal)
        } else {
            let attacked = Team.chooseCharDefence(team: team1)
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
        print("Félicitation, le vainqueur est " + winnerName + "!"
    + "\n vous avez gagner en \(compteur) attaques")
    }
// func for the game
static func playGame() -> Int {
    var compteur = 0
        repeat{
            
            Game.jouer()
            if team2.isDead() != 0 {
                Game.jouer2()
              
            }
            compteur += 1
        } while team1.isDead() != 0 && team2.isDead() != 0
    return compteur
    }
    
}


