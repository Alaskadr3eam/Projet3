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

/*func createCharac1() {
    var choiceperso1: Int
    
    repeat {
        print("Classe personnage 1 :"
            + "\n1.Fighter          2.Mage          3.Colosse")
        choiceperso1 = input()
    } while choiceperso1 != 1 && choiceperso1 != 2 && choiceperso1 != 3
    
    var type1: TypesCharacters!
    switch choiceperso1 {
    case 1:
        type1 = .Fighter
    case 2:
        type1 = .Mage
    case 3:
        type1 = .Colosse
    default : break
    }
    
    let characters1 = Characters(type: type1)
    
    print("Nom du personnage1 ?")
    characters1.name = readLine()!
    
    team1.mesPerso.append(characters1)
    
}


func createCharac2() {
    
    var choiceperso2: Int
    
    repeat {
        print("Classe personnage 2 :"
            + "\n1.Figter           2.Mage          3.Colosse")
        choiceperso2 = input()
    } while choiceperso2 != 1 && choiceperso2 != 2 && choiceperso2 != 3
    
    var type2: TypesCharacters!
    switch choiceperso2 {
    case 1:
        type2 = .Fighter
    case 2:
        type2 = .Mage
    case 3:
        type2 = .Colosse
    default : break
    }
    
    let characters2 = Characters(type: type2)
    
    print("Nom du \(characters2) ?")
    characters2.name = readLine()!
    
    team1.mesPerso.append(characters2)
    
}


func createCharac3() {
    
    var choiceperso3: Int
    
    repeat {
        print("Classe personnage 3 :"
            + "\n1.Figter           2.Mage          3.Colosse")
        choiceperso3 = input()
    } while choiceperso3 != 1 && choiceperso3 != 2 && choiceperso3 != 3
    
    var type3: TypesCharacters!
    switch choiceperso3 {
    case 1:
        type3 = .Fighter
    case 2:
        type3 = .Mage
    case 3:
        type3 = .Colosse
    default : break
    }
    
    let characters3 = Characters(type: type3)
    
    print("Nom du \(characters3) ?")
    characters3.name = readLine()!
    
    team1.mesPerso.append(characters3)
}

func createTeam1() {
    
    print("Nom de l'équipe 1 ?")
    team1.nameTeam = readLine()!
    
    team1.createCharac1()
    
    team1.createCharac2()
    
    team1.createCharac3()
    
}

func createTeam2() {
    
    print("Nom de l'équipe ?")
    team2.nameTeam = readLine()!
    
    team2.createCharac1()
    
    team2.createCharac2()
    
    //createCharac3()
    
}*/

var choice: Int

repeat{
    
    print("Bonjour, Voulez vous commencer une partie d'EpicGame ?"
    + "\n1. Oui                         2.Non")

    choice = input()
    
if choice == 1 {
    
    team1.createTeam1()
    
    team1.descriptionTeam1()
    
    team2.createTeam2()
    
    
    
} else {
    print("Au revoir, à bientot !")
}
} while choice != 1 && choice != 2





