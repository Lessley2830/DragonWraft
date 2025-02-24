//
//  main.swift
//  DragonWraft
//
//  Created by Lamara Hand-Smith on 11/21/24.
//

import Foundation

func startGame() {
    var lifePoints = 100
    var playerName = ""
    
    print("Coming up on the dark hill there was an almost forgotten kingdom ")
    print("A tall, yet fragile peasant approached")
    print("")
    print ("The Black Dragon has taken a the princess back to its lair for the last 5 years.")
    print ("Full of grief and depression the king fell to be the leader his kingdom needed to preserve through these dark times.")
   print ("The kingdom has fallen under a gloom of fear. The mighty dragon lived in a dark, towering castle,  guarded by flames.")
    print("")
    print("But first, what's your name?")

    getNameInput()
    func getNameInput () {
        
        if let nameInput = readLine() {
            
            if nameInput.isEmpty {
                print("do You Not Want To be A Hero?!")
                getNameInput()
            } else {
                print("The hero's name will be \(nameInput). A heroic Choice! Let the Journey Begins")
                playerName = nameInput
            }
        }
    }
    
    print("\nHello, \(playerName)! You have heard from an old hermit that a dragon has kidnapped the princess.")
    print("Do you wish to embark on a quest to rescue her? (yes/no)")
    
    let decision = readLine()?.lowercased()
    
    if decision == "yes" || decision == "y" {
        print("\nGreat! You are brave, \(playerName). Your journey begins in the Enchanted Forest.")
    } else {
        print("\nYou have chosen not to go. The kingdom will be doomed without you.")
        return
    }
    
    print("\nYou reach the Enchanted Forest. You must now choose your path:")
    print("1. River")
    print("2. Dark Pathway")
    print("3. Yellow Brick Road")
    
    let pathChoice = readLine()
    
    switch pathChoice {
    case "1":
        lifePoints -= 5
        print("\nYou chose the River path. Strong currents, a waterfall, and an alligator chase have cost you 5 Life Points!")
    case "2":
        lifePoints -= 10
        print("\nYou chose the Dark Pathway. A big oak tree, a poisonous snake, and poison ivy have cost you 10 Life Points!")
    case "3":
        print("\nYou chose the Yellow Brick Road. Friendly Tin Man, Lion, and Scarecrow. No Life Points lost.")
    default:
        print("\nInvalid choice. The journey ends here.")
        return
    }
    
    print("You now have \(lifePoints) Life Points.")
    
    print("\nYou reach the castle gates. As you enter, you find countless fallen knights scattered around.")
    print("Do you wish to grab armor from the fallen knights? (yes/no)")
    
    let armorChoice = readLine()?.lowercased()
    
    switch armorChoice {
    case "yes":
        print("\nYou see 3 sets of armor:")
        print("1. Damaged armor with dragon bite marks. Adds 20 Life Points.")
        print("2. Burnt armor missing a boot. Adds 10 Life Points.")
        print("3. Clean armor missing a shield and helmet. Adds 15 Life Points.")
        
        let armorSelection = readLine()
        
        switch armorSelection {
        case "1":
            lifePoints += 20
            print("You selected the damaged armor. Your Life Points are now \(lifePoints).")
        case "2":
            lifePoints += 10
            print("You selected the burnt armor. Your Life Points are now \(lifePoints).")
        case "3":
            lifePoints += 15
            print("You selected the clean armor. Your Life Points are now \(lifePoints).")
        default:
            print("Invalid armor choice. Proceeding without armor.")
        }
        
    case "no":
        print("You decide to proceed without armor.")
        
    default:
        print("Invalid choice. Proceeding without armor.")
    }
    
    print("\nAs you approach the dragon's lair, the temperature rises. You see the dragon!")
    print("It spots you and begins charging toward you.")
    print("Do you wish to grab a weapon from a fallen knight? (yes/no)")
    
    let weaponChoice = readLine()?.lowercased()
    var currentWeapon: String = ""
    
    switch weaponChoice {
    case "yes":
        print("\nYou see several weapons: ")
        print("1. Sword (Adds 30 Life Points)")
        print("2. Run and choose a new weapon.")
        
        let weaponSelection = readLine()
        
        switch weaponSelection {
        case "1":
            currentWeapon = "Sword"
            lifePoints += 30
            print("You chose the sword. Your Life Points are now \(lifePoints).")
        case "2":
            print("\nYou run for your life to the other side of the castle.")
            print("You find some other weapons: ")
            print("1. Staff (Adds 15 Life Points)")
            print("2. Bow and Arrow (Adds 20 Life Points)")
            print("3. Mace (Adds 25 Life Points)")
            
            let newWeapon = readLine()
            
            switch newWeapon {
            case "1":
                currentWeapon = "Staff"
                lifePoints += 15
            case "2":
                currentWeapon = "Bow and Arrow"
                lifePoints += 20
            case "3":
                currentWeapon = "Mace"
                lifePoints += 25
            default:
                print("Invalid choice. You have no weapon.")
            }
            
            print("You chose the \(currentWeapon). Your Life Points are now \(lifePoints).")
        default:
            print("Invalid choice. You have no weapon.")
        }
        
    case "no":
        print("You decide not to grab a weapon and prepare to face the dragon with only your courage.")
    default:
        print("Invalid choice. You have no weapon.")
    }
    
    // Dragon Battle
    var dragonLifePoints = 100
    var battleOver = false
    
    while !battleOver {
        print("\nThe dragon roars and attacks you!")
        print("Your Life Points: \(lifePoints), Dragon's Life Points: \(dragonLifePoints)")
        print("What will you do?")
        print("1. Attack")
        print("2. Defend")
        print("3. Focus")
        print("4. Hide")
        
        let action = readLine()
        
        switch action {
        case "1": // Attack
            dragonLifePoints -= 20
            lifePoints -= 25
            print("You attack the dragon but take damage! The dragon's life points are now \(dragonLifePoints). Your life points are now \(lifePoints).")
            
        case "2": // Defend
            dragonLifePoints -= 15
            lifePoints -= 20
            print("You defend yourself. The dragon's life points are now \(dragonLifePoints). Your life points are now \(lifePoints).")
            
        case "3": // Focus
            dragonLifePoints -= 10
            lifePoints -= 15
            print("You focus, dodging some attacks. The dragon's life points are now \(dragonLifePoints). Your life points are now \(lifePoints).")
            
        case "4": // Hide
            dragonLifePoints -= 5
            lifePoints -= 10
            print("You hide, but the dragon still finds you. The dragon's life points are now \(dragonLifePoints). Your life points are now \(lifePoints).")
            
        default:
            print("Invalid action. The dragon attacks!")
            lifePoints -= 10
            
        }
        
        if dragonLifePoints <= 0 {
            battleOver = true
            print("\nYou have defeated the dragon!")
            print("The princess thanks you, and the kingdom celebrates your bravery!")
            print("You live happily ever after.")
        }
        
        if lifePoints <= 0 {
            battleOver = true
            print("\nYou have been defeated. Game over!")
        }
    }
}

startGame()



