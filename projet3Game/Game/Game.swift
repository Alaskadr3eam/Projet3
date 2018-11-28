//
//  Game.swift
//  project3
//
//  Created by Clément Martin on 22/11/2018.
//  Copyright © 2018 Clément Martin. All rights reserved.
//

import Foundation

class Game {
    

static func startGame() {
    
        var choice: String
        print("Bonjour")
        repeat{
        
            print(" Voulez vous commencer une partie d'EpicGame ?"
                + "\n1. Oui                         2.Non               3.Règle du jeu")
        
            choice = readLine()!
        
            if choice == "1" {
            
                team1.createTeam1()
                team2.createTeam1()
                
               // team1.descriptionTeam()
               // team2.descriptionTeam()
                
                repeat{
                team1.playing1()
                //team2.playing2()
                } while team1.teamLife() != 0 || team2.teamLife() != 0
               
            
            } else if choice == "2" {
                print("Au revoir, à bientot !")
            } else if choice == "3" {
                print("C'est un jeu de match à mort. 2 équipes composé de 3 personnages s'affrontent jusqu'a ce que tout les personnages d'une des deux équipes n'ai plus de vie.")
            } else {
                print("Je ne comprends pas !")
            }
        } while choice != "1" && choice != "2"
    
    }
    


static func startGame1() {
    
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
            team1.createTeam1()
            team2.createTeam1()
    
            // team1.descriptionTeam()
            // team2.descriptionTeam()
    
            repeat{
                team1.jouer1()
                //team2.playing2()
            } while team1.teamLife() != 0 || team2.teamLife() != 0
        case "2":
            print("Au revoir, à bientot")
        case "3":
            print("C'est un jeu de match à mort. 2 équipes composé de 3 personnages s'affrontent jusqu'a ce que tout les personnages d'une des deux équipes n'ai plus de vie.")
        default:
                print("Je ne comprends pas !")
        }
    }
    /*
    while team1.teamLife > 0 && team2.teamLife > 0 {
    team1.playing1()
    if team2.teamLife > 0 {
    team2.playing1()
    }
    }
    
    var teamWinner: String
    
    if team1.teamLife > 0 {
    teamWinner = team1.nameTeam
    } else {
    teamWinner = team2.nameTeam
    }
    
    print("Le vainqueur est " + teamWinner + " !")
 */
}
