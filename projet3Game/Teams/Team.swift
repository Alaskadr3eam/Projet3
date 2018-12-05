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
    static var myCharacName = [String]()
    
    
    func uniqueName() -> String {
        let unique = false
        repeat{
            if let name = readLine() {
                if checkUniqueName(name){
                    return name
                } else {
                    print("Le nom doit être unique, veuillez renommer le personnage")
                }
            }
        } while !unique
    }
    
    func checkUniqueName(_ name:String)-> Bool {
        for character in Team.myCharacName {
            if(name == character) {
                print("Le nom existe deja")
                return false
            }
        }
        Team.myCharacName.append(name)
        return true
    }
    
    func createCharac() {           ////creation of each character
        
        var choiceCharac: String
        
        
        repeat {
            print("")
            print("Classe personnage  :"
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
            type1 = .Giant
        case "4":
            type1 = .Dwarf
        default : break
        }
        
        let characters = Characters(type: type1)
        
        print("Nom du personnage ?")
        characters.name = uniqueName()
        myCharac.append(characters)
      
        
    }

    func createTeam1() {            //we create the 3 characters that are stored in the array myCharac
        print("")
        print("Nom de l'équipe ?")
        nameTeam = readLine()!
        repeat{
            createCharac()
        } while myCharac.count != 3
    }
    
   func createTeam2() {
        print("")
        print("Nom de l'équipe ")
        team2.nameTeam = readLine()!
        repeat{
            team2.createCharac()
        } while team2.myCharac.count != 3
    }
    


    func descriptionTeam() {        //descriptions of teams, characters, team name.
        print("")
        print(" Nom de l'équipe: \(nameTeam)")
        descriptionCharac1()
        descriptionCharac2()
        descriptionCharac3()
    }
    
    func descriptionCharac1() {
        if myCharac[0].life > 0 {
        print("")
        print("1.Le perso \(myCharac[0].name) de type \(myCharac[0].type) à \(myCharac[0].life) de vie et fait \(myCharac[0].weapon.dp) de dégat ")
        } else {
            print("personnage est DEAD!")
        }
    }
    
    func descriptionCharac2() {
        print("")
        print("2.Le perso \(myCharac[1].name) de type \(myCharac[1].type) à \(myCharac[1].life) de vie et fait \(myCharac[1].weapon.dp) de dégat ")
    }
    
    func descriptionCharac3() {
        print("")
        print("3.Le perso \(myCharac[2].name) de type \(myCharac[2].type) à \(myCharac[2].life) de vie et fait \(myCharac[2].weapon.dp) de dégat ")
    }

    func chooseCharAttack1() {
       var attacker = myCharac[0]
        
        print("\(nameTeam) choisie un de tes personnages pour attaquer :"
        + "\n1.\(descriptionCharac1())"
        + "\n2.\(descriptionCharac2())"
        + "\n3.\(descriptionCharac3())")
        
        var choice = ""
        repeat {
            if let str = readLine() {
            choice = str
            }
        } while choice != "1" && choice != "2" && choice != "3"
        
        switch choice {
        case "1":
            if myCharac[0].life == 0 {
                print("Choississez un autre personnage pour attaquer celui la est DEAD!")
            } else {
            attacker = self.myCharac[0]
            }
            //charac.append(attacker)
        case "2":
            attacker = self.myCharac[1]
            //charac.append(attacker)
        case "3":
            attacker = self.myCharac[2]
            //charac.append(attacker)
        default: break
        }
        // descripion personnage choisi pour attaquer.
        print("Vous avez choisi \(attacker.name) \(attacker.type)  \(attacker.life) \(attacker.weapon.dp)")
         // return attacker
        if attacker.type == .Magus {
            var charToHeal = myCharac[0]
            print("\(nameTeam) choisie un de tes personnages à soigner :"
                + "\n1.\(descriptionCharac1())"
                + "\n2.\(descriptionCharac2())"
                + "\n3.\(descriptionCharac3())")
            var choice = ""
            repeat {
                if let str = readLine() {
                    choice = str
                }
            } while choice != "1" && choice != "2" && choice != "3"
            
            switch choice {
            case "1":
                if myCharac[0].life == 0 {
                    print("Choississez un autre personnage pour attaquer celui la est DEAD!")
                } else {
                    charToHeal = myCharac[0]
                }
            //charac.append(attacker)
            case "2":
                charToHeal = myCharac[1]
            //charac.append(attacker)
            case "3":
                charToHeal = myCharac[2]
            //charac.append(attacker)
            default: break
            }
            
            charToHeal.life = charToHeal.life + attacker.weapon.dp
            print("")
            print("Le personnage \(charToHeal.name) de type \(charToHeal.type)a été soigné, il a maintenant \(charToHeal.life) de vie.")
            charToHeal = myCharac[0]
            
        } else {
    //func chooseCharAttacked() -> Characters {
        var attacked = team2.myCharac[0]
        
        print("\(team1.nameTeam) choisie un des personnages adversaire à attaquer :"
            + "\n1.\(team2.descriptionCharac1())"
            + "\n2.\(team2.descriptionCharac2())"
            + "\n3.\(team2.descriptionCharac3())")
        var choice1 = ""
        repeat {
            if let str = readLine() {
                choice1 = str
            }
        } while choice1 != "1" && choice1 != "2" && choice1 != "3"
        
        switch choice1 {
        case "1":
            if team2.myCharac[0].life == 0 {
                print("Choississez un autre personnage à attaquer, celui la est DEAD!")
            } else {
            attacked = team2.myCharac[0]
            }
        case "2":
            attacked = team2.myCharac[1]
        case "3":
            attacked = team2.myCharac[2]
        default: break
        }
        print("\(attacked.type) \(attacked.name) \(attacked.life) ")
        //return attacked
    //func attack() -> Int{
       attacked.life = attacked.life - attacker.weapon.dp
            if attacked.life < 0 {
                attacked.life = 0
                print("Le personnage \(attacked.name) de type \(attacked.type) à maintenant \(attacked.life) de vie et sort de l'équipe.")
                attacked = team2.myCharac[0]
                //team2.myCharac.remove(at: 0)
            } else {
                //return chooseCharAttacked().life
                print("Le personnage \(attacked.name) de type \(attacked.type) à maintenant \(attacked.life) de vie.")
                attacked = team2.myCharac[0]
        
            }
        }
    }
    
        
    
    
  /*  func chooseCharAttack() -> Characters{
        var attacker = myCharac[0]
        
        print("\(nameTeam) choisie un de tes personnages pour attaquer :"
            + "\n1.\(descriptionCharac1())"
            + "\n2.\(descriptionCharac2())"
            + "\n3.\(descriptionCharac3())")
        
        var choice = ""
        repeat {
            if let str = readLine() {
                choice = str
            }
        } while choice != "1" && choice != "2" && choice != "3"
        
        switch choice {
        case "1":
            if myCharac[0].life == 0 {
                print("Choississez un autre personnage pour attaquer celui la est DEAD!")
            } else {
            attacker = myCharac[0]
            }
        //charac.append(attacker)
        case "2":
            attacker = myCharac[1]
        //charac.append(attacker)
        case "3":
            attacker = myCharac[2]
        //charac.append(attacker)
        default: break
        }
        
        // descripion personnage choisi pour attaquer.
        print("\(attacker.type) \(attacker.name) \(attacker.life) \(attacker.weapon.dp)")
        
        
        return attacker
    }
        
    func chooseCharAttacked() -> Characters {
        var attacked = myCharac[0]
        
        print("Choisie un des personnages adversaire à attaquer :"
            + "\n1.\(descriptionCharac1())"
            + "\n2.\(descriptionCharac2())"
            + "\n3.\(descriptionCharac3())")
        
        var choice1 = ""
        repeat {
            if let str = readLine() {
                choice1 = str
            }
        } while choice1 != "1" && choice1 != "2" && choice1 != "3"
        
        switch choice1 {
        case "1":
            if myCharac[0].life == 0 {
                print("Choississez un autre personnage à attaquer, celui la est DEAD!")
            } else {
            attacked = myCharac[0]
            }
        case "2":
            attacked = myCharac[1]
        case "3":
            attacked = myCharac[2]
        default: break
        }
        
        print("\(attacked.type) \(attacked.name) \(attacked.life) ")
        
        return attacked
    }
        
        
    func attack(attacker: Characters) {
        chooseCharAttacked().life = chooseCharAttacked().life - chooseCharAttack().weapon.dp
        if chooseCharAttacked().life < 0 {
            chooseCharAttacked().life = 0
        }
        print("")
        print("Le personnage \(chooseCharAttacked().name) de type \(chooseCharAttacked().type) à maintenant \(chooseCharAttacked().life) de vie.")
       
    }
    */
    func playing1() {
        team1.chooseCharAttack1()
        team2.descriptionTeam()
        //attack()
       // print("Le personnage \(attacked.name) de type \(attacked.type) à maintenant \(attacked.life) de vie.")
    }
    /*
    func playing2() {
        team2.chooseCharAttack2()
        team1.descriptionTeam()
        //attack()
        // print("Le personnage \(attacked.name) de type \(attacked.type) à maintenant \(attacked.life) de vie.")
    }*/
 
    func teamLife()-> Int {
        var teamLife = 0
        //teamLife = myCharac[0].life + myCharac[1].life + myCharac[2].life
        //return teamLife
        
        for totalLife in myCharac {
            teamLife += totalLife.life
        }
        return teamLife
    }
    /*
    func attackerIsMagus() {
        
            var charToHeal = myCharac[0]
            print("\(nameTeam) choisie un de tes personnages à soigner :"
                + "\n1.\(descriptionCharac1())"
                + "\n2.\(descriptionCharac2())"
                + "\n3.\(descriptionCharac3())")
            
            var choice = ""
            repeat {
                if let str = readLine() {
                    choice = str
                }
            } while choice != "1" && choice != "2" && choice != "3"
            
            switch choice {
            case "1":
                if myCharac[0].life == 0 {
                    print("Choississez un autre personnage pour attaquer celui la est DEAD!")
                } else {
                    charToHeal = myCharac[0]
                }
            //charac.append(attacker)
            case "2":
                charToHeal = myCharac[1]
            //charac.append(attacker)
            case "3":
                charToHeal = myCharac[2]
            //charac.append(attacker)
            default: break
            }
            
            charToHeal.life = charToHeal.life + chooseCharAttack().weapon.dp
           
            print("")
            print("Le personnage \(charToHeal.name) de type \(charToHeal.type)a été soigné, il a maintenant \(charToHeal.life) de vie.")
            charToHeal = myCharac[0]
    }
 */
    
    /*func playing1() {
        chooseCharAttack()
       
        team2.chooseCharAttacked()
        attack(attacker: team2.chooseCharAttacked())
       // }
        //attack()
        // print("Le personnage \(attacked.name) de type \(attacked.type) à maintenant \(attacked.life) de vie.")
    }
    */
    /*
    func playing2() {
        chooseCharAttack()
       
        team1.chooseCharAttacked()
        
        attack(attacker: team1.chooseCharAttacked())
        //attack()
        // print("Le personnage \(attacked.name) de type \(attacked.type) à maintenant \(attacked.life) de vie.")
    }
 */
    func jouer1() {
        
        let attacker = team1.teamChooseCharA()
        
        if teamChooseCharA().type == .Magus {
            
           let charToHeal = team1.teamChooseCharH()
            
            attacker.care(characters:charToHeal)
            self.myCharac[0] = charToHeal
            
        } else {
           
            let attacked = team2.teamchooseCharD()
           
            attacker.attack(characters: attacked)
            
            team2.myCharac[0] = attacked
        }
    }


    func teamchooseCharD() -> Characters { //func chooseCharAttacked() -> Characters {
        var attacked = myCharac[0]
        
        print("Choisie un des personnages adversaire à attaquer :")
        
        descriptionTeam()
        
        var choice1 = ""
        repeat {
            if let str = readLine() {
                choice1 = str
            }
        } while choice1 != "1" && choice1 != "2" && choice1 != "3"
        
        switch choice1 {
        case "1":
            if myCharac[0].life == 0 {
                print("Choississez un autre personnage à attaquer, celui la est DEAD!")
            } else {
                attacked = myCharac[0]
            }
        case "2":
            attacked = myCharac[1]
        case "3":
            attacked = myCharac[2]
        default: break
        }
        print("\(attacked.type) \(attacked.name) \(attacked.life) ")
        return attacked
    }
    
    func teamChooseCharH() -> Characters{
        var charToHeal = myCharac[0]
        print("\(self.nameTeam) choisie un de tes personnages à soigner :")
        
        self.descriptionTeam()
        
        var choice = ""
        repeat {
            if let str = readLine() {
                choice = str
            }
        } while choice != "1" && choice != "2" && choice != "3"
        
        switch choice {
        case "1":
            if self.myCharac[0].life == 0 {
                print("Choississez un autre personnage pour attaquer celui la est DEAD!")
            } else {
                charToHeal = self.myCharac[0]
            }
        case "2":
            charToHeal = self.myCharac[1]
        case "3":
            charToHeal = self.myCharac[2]
        default: break
        }
        return charToHeal
    }
    
    func teamChooseCharA() -> Characters {
        var attacker = self.myCharac[0]
        
        print("\(self.nameTeam) choisie un de tes personnages pour attaquer :")
        
        self.descriptionTeam()
        
        var choice = ""
        repeat {
            if let str = readLine() {
                choice = str
            }
        } while choice != "1" && choice != "2" && choice != "3"
        
        switch choice {
        case "1":
            if self.myCharac[0].life == 0 {
                print("Choississez un autre personnage pour attaquer celui la est DEAD!")
            } else {
                attacker = self.myCharac[0]
            }
        case "2":
            attacker = self.myCharac[1]
        case "3":
            attacker = self.myCharac[2]
        default: break
        }
        // descripion personnage choisi pour attaquer.
        print("Vous avez choisi \(attacker.name) \(attacker.type)  \(attacker.life) \(attacker.weapon.dp)")
        return attacker
    }
    
}
