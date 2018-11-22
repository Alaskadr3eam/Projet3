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
    
    

    func createCharac1() {
        
        var choiceperso1: Int
        
        repeat {
            print("Classe personnage 1 :"
                + "\n1.Fighter          2.Mage          3.Colosse          4.Nain")
            choiceperso1 = input()
        } while choiceperso1 != 1 && choiceperso1 != 2 && choiceperso1 != 3
        
        var type1: TypesCharacters!
        switch choiceperso1 {
        case 1:
            type1 = .Fighter
        case 2:
            type1 = .Magus
        case 3:
            type1 = .Colossus
        case 4:
            type1 = .Dwarf
        default : break
        }
        
        let characters1 = Characters(type: type1)
        
        print("Nom du personnage 1 ?")
        characters1.name = readLine()!
        
        myCharac.append(characters1)
        myCharac1[characters1.name] = characters1
        
        }
        
    
    
    func createCharac2() {
        
        var choiceperso2: Int
        
        repeat {
            print("Classe personnage 2 :"
                + "\n1.Figter           2.Mage          3.Colosse          4.Nain")
            choiceperso2 = input()
        } while choiceperso2 != 1 && choiceperso2 != 2 && choiceperso2 != 3
        
        var type2: TypesCharacters!
        switch choiceperso2 {
        case 1:
            type2 = .Fighter
        case 2:
            type2 = .Magus
        case 3:
            type2 = .Colossus
        case 4:
            type2 = .Dwarf
        default : break
        }
        
        let characters2 = Characters(type: type2)
        
        print("Nom du \(characters2.type) ?")
        characters2.name = readLine()!
        
        myCharac.append(characters2)
        myCharac1[characters2.name] = characters2
    }
    
    func createCharac3() {
        
        var choiceperso3: Int
        
        repeat {
            print("Classe personnage 3 :"
                + "\n1.Figter           2.Mage          3.Colosse          4.Nain")
            choiceperso3 = input()
        } while choiceperso3 != 1 && choiceperso3 != 2 && choiceperso3 != 3
        
        var type3: TypesCharacters!
        switch choiceperso3 {
        case 1:
            type3 = .Fighter
        case 2:
            type3 = .Magus
        case 3:
            type3 = .Colossus
        case 4:
            type3 = .Dwarf
        default : break
        }
        
        let characters3 = Characters(type: type3)
        
        print("Nom du \(characters3.type) ?")
        characters3.name = readLine()!
        
        myCharac.append(characters3)
        myCharac1[characters3.name] = characters3
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
        
        team2.createCharac3()
        
    }
    
    func descriptionTeam1() {
        print(team1.nameTeam)
        print(team1.myCharac[0].name)
        print(team1.myCharac[0].type)
        print(team1.myCharac[0].vie)
        print(team1.myCharac[0].weapon)
        print(team1.myCharac[1].name)
       
        for i in myCharac {
            print(i.name)
            print(i.type)
            print(i.vie)
            print(i.weapon)
        }
    }

}
