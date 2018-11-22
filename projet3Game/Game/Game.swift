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
            team2.createTeam2()
            team1.descriptionTeam()
            team2.descriptionTeam()
            
            
            
        } else if choice == "2" {
            print("Au revoir, à bientot !")
        } else if choice == "3" {
            print("C'est un jeu de match à mort. 2 équipes composé de 3 personnages s'affrontent jusqu'a ce que tout les personnages d'une des deux équipes n'ai plus de vie.")
        } else {
            print("Je ne comprends pas !")
        }
    } while choice != "1" && choice != "2"
    
}
}
