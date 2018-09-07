//
//  menu.swift
//  VideoGameLibrary
//
//  Created by Spencer Casteel on 8/30/18.
//  Copyright © 2018 Spencer Casteel. All rights reserved.
//

import Foundation

class Menu {
    
    var shouldQuit = false
    
    let library = Library()
    
    let miniGame = MiniGame()
    
    func go() {
        help()
        
        repeat {
            
            var input = getInput()
            
            if input == "random" {
                miniGame.guessingGame()
                help()
            }
            while validateInput(input) == false {
                print("Invalid input")
                input = getInput()
            }
            
            handleInput(input)
            
        }while !shouldQuit
    }
    
    func help() {
        print("""
        Menu
        1. Add game
        2. Remove game
        3. List Available games
        4. Check out game
        5. Check in Game
        6. List checked out games
        7. Help
        8. Quit

        """)
    }
    
    
    func handleInput(_ input: String) {
        switch input {
        case "1":
            library.addGame()
            help()
        case "2":
            library.removeGame()
            help()
        case "3":
            library.listAvailableGames()
           help()
        case "4":
            library.checkGameOut()
            help()
        case "5":
            library.checkGameIN()
            help()
        case "6":
            library.listUnavailableGames()
        case "7":
            help()
        case "8":
            quit()
        default:
            break
        }
    }
    
    func quit() {
        shouldQuit = true
        print("thank you for choosing my game library")
    }
    
    func validateInput(_ input: String) -> Bool {
        let menuOptions = Array(1...8)
    
        guard let number = Int(input) else { return false }
        
        return menuOptions.contains(number)
    }
    
    func getInput() -> String {
        var input: String? = nil
        
        repeat {
            let line = readLine()!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            if line != "" {
                input = line
            } else {
                print("Invalid input.")
            }
        } while input == nil
        
        return input!
    }
}
