//
//  NewTeam1.swift
//  project3
//
//  Created by Clément Martin on 26/11/2018.
//  Copyright © 2018 Clément Martin. All rights reserved.
//
/*
import Foundation

class NewTeam1 {
    var name = ""
    var myCharac: [Characters] = []
    static var myCharacName: [String] = []
    
    
    func createTeam() {            //we create the 3 characters that are stored in the array myCharac
        print("")
        print("Nom de l'équipe 1 ?")
        team1.name = readLine()!
        while myCharac.count != 3 {
        team1.createCharac()
        }
        if myCharac.count == 3 {
            listOfCharacter()
        }
    }
    
 
    func createCharac() {           ////creation of each character
        
        var choiceCharac: String
        
        
        repeat {
            print("")
            print("Classe personnage 1 :"
                + "\n1.Fighter          2.Mage          3.Colosse          4.Nain")
            choiceCharac = readLine()!
        } while choiceCharac != "1" && choiceCharac != "2" && choiceCharac != "3"
        
        let personne: Characters!
        switch choiceCharac {
        case "1":
            print("Vous avez choisie le Chevalier")
            let personnage = Fighter()
            //fighter.name = unique_name()
            //myCharac.append(fighter)
        case "2":
            print("Vous avez choisie le Mage.")
            //print("Choississez son Nom?")
            let personnage = Magus()
           // NewTeam1.myCharacName.append(magusName)
            //let magus = Magus(name: magusName)
            //myCharac.append(magus)
        case "3":
            print("Vous avez choisie le Colosse")
            //print("Choississez son Nom ?")
            let personne = Giant()            //NewTeam1.myCharacName.append(giantName)
            //let giant = Giant(name: giantName)
            //myCharac.append(giant)
        case "4":
            print("Vous avez choisie le Nain")
            //print("Choississez son Nom ?")
            let personne = Dwarf()
            //NewTeam1.myCharacName.append(dwarfName)
            //let dwarf = Dwarf(name: dwarfName)
            //myCharac.append(dwarf)
        default :
            print("Je ne comprends pas veuillez choisir entre 1-2-3-4 SVP")
        }
       
        personne.name = unique_name()
        
    }
    
    func unique_name()->String {
        let unique = false
        repeat {
            if let name = readLine() {
                if (checkuniquename(name)) {
                    return name
                }
                else {
                    print("Le nom doit être unique, veuillez renommer le personnage")
                }
            }
        } while !unique
    }
    
 func checkuniquename(_ name:String)-> Bool {
 for character in NewTeam1.myCharacName {
 if(name == character) {
 print("Le nom existe deja")
 return false
 }
 }
 NewTeam1.myCharacName.append(name)
 return true
 }
    
    func listOfCharacter() {
        for personnage in myCharac {
            print("Votre personnage s'appel \(personnage.name), de type \(personnage) et a ") //(personnage.life) de vie.")
        }
        
    }
    
    

}
*/
