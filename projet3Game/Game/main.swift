//
//  main.swift
//  est
//
//  Created by Clément Martin on 21/11/2018.
//  Copyright © 2018 Clément Martin. All rights reserved.
//

import Foundation

var team1 = Team()
var team2 = Team()

func input() -> Int {
    let strData = readLine()
    
    return Int(strData!)!
}



/*func startGame() {
    
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
*/

Game.startGame()


    

func recevoir(degats: Int) {
    team1.myCharac[0].life = team1.myCharac[0].life - degats
    
    if team1.myCharac[0].life < 0 {
        team1.myCharac[0].life = 0
    }
}

func attaquer() {
    personnage.recevoir(degats: team1.myCharac[0].weapon.dp)
}
