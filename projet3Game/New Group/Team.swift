//
//  Team.swift
//  est
//
//  Created by Clément Martin on 21/11/2018.
//  Copyright © 2018 Clément Martin. All rights reserved.
//

import Foundation

class Team {
    var nameTeam = ""
    var myCharac = [Characters]()
    var myCharac1 = [String: Characters]()
    
    

    func createCharac() {           ////creation of each character
        
        var choiceCharac: String
        
        
        repeat {
            print("Classe personnage 1 :"
                + "\n1.Fighter          2.Mage          3.Colosse          4.Nain")
            choiceCharac = readLine()!
        } while choiceCharac != "1" && choiceCharac != "2" && choiceCharac != "3"
        
        var type1: TypesCharacters!
        switch choiceCharac {
        case "1":
            type1 = .Fighter
        case "2":
            type1 = .Magus
        case "3":
            type1 = .Colossus
        case "4":
            type1 = .Dwarf
        default : break
        }
        
        let characters = Characters(type: type1)
        
        print("Nom du personnage personnage ?")
        characters.name = readLine()!
        
        myCharac.append(characters)
        myCharac1[characters.name] = characters
        
    }
    
    func createTeam1() {            //we create the 3 characters that are stored in the array myCharac
        print("Nom de l'équipe 1 ?")
        team1.nameTeam = readLine()!
        repeat{
            team1.createCharac()
        } while myCharac.count != 3
    }
    
   func createTeam2() {
        print("Nom de l'équipe ?")
        team2.nameTeam = readLine()!
        repeat{
            team2.createCharac()
        } while team2.myCharac.count != 3
    }
    
    func descriptionTeam() {        //descriptions of teams, characters, team name.
        print(" Nom de l'équipe: \(nameTeam)")
        descriptionCharac1()
        descriptionCharac2()
        descriptionCharac3()
    }
    
    func descriptionCharac1() {
        print("")
        print("\(myCharac[0].name) : Classe: \(myCharac[0].type)"
            + "\n       Arme: \(myCharac[0].weapon), \(myCharac[0].weapon.dp) de dégat"
            + "\n       Vie:  \(myCharac[0].life)")
    }
    
    func descriptionCharac2() {
        print("\(myCharac[1].name) :\(myCharac[1].type)"
            + "\n\(myCharac[1].weapon.dp)"
            + "\n\(myCharac[1].life)")
    }
    
    func descriptionCharac3() {
        print("\(myCharac[2].name) :\(myCharac[2].type)"
            + "\n\(myCharac[2].weapon.dp)"
            + "\n\(myCharac[2].life)")
    }
    
    func choiceCharacForAttak() {
        print("\(nameTeam) choisie un de tes personnages pour attaquer :"
            + "\n1.\(descriptionCharac1())                      2.\(descriptionCharac2())               3.\(descriptionCharac3())")
    }
    
    func choiceCharacIsAttacked() {
        print("\(nameTeam) choisie un personnage à attaquer dans la liste :"
            + "\n1.\(descriptionCharac1())                      2.\(descriptionCharac2())               3.\(descriptionCharac3())")
    }
    
    func degat() {
        myCharac[0].weapon.dp -
    }
    

    func gameAttackTeam1() {
        print("Voila le vrai jeu commence, équipe \(team1.nameTeam) à vous de commencer.")
        
        team1.choiceCharacForAttak()
        team2.choiceCharacIsAttacked()
        
    }
}
