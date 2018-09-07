//
//  library.swift
//  VideoGameLibrary
//
//  Created by Spencer Casteel on 9/4/18.
//  Copyright © 2018 Spencer Casteel. All rights reserved.
//

import Foundation

class Library {
    
    private var gameArray: [Game] = [Game(title: "farming simulator 19", rating: "e"), Game(title: "fallout 3", rating: "t"), Game(title: "GTA V", rating: "m"), Game(title: "Marvel's Spider-Man", rating: "t")]
    
    func addGame() {
        print("please enter the admin password to add a game")
        var input: String? = nil
        
        repeat {
            
            let line = readLine()!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            if line != "" {
                input = line
            } else {
                print("Invalid input.")
            }
        } while input == nil
        
        if input == "P@$$w0rd" {
            
            print("please enter the title of the game:")
            
            var newGameTitle = readLine()
            
            while newGameTitle == nil || newGameTitle == "" {
                print("invalid title, please try again:")
                newGameTitle = readLine()
            }
            print("please enter game rating")
            var rating = readLine()
            
            while rating == nil || rating == "" {
                print("invalid title, please try again:")
                rating = readLine()
            }
            
            let newGame = Game(title: newGameTitle!, rating: rating!)
            
            gameArray.append(newGame)
        } else {
            print("incorrect password")
        }
        
        
    }
    
    func removeGame () {
        
        print("please enter the admin password to remove a game")
        var input: String? = nil
        
        repeat {
            
            let line = readLine()!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            if line != "" {
                input = line
            } else {
                print("Invalid input.")
            }
        } while input == nil
        
        if input == "P@$$w0rd" {
            
            print("\n please enter the index of the game you wish to remove\n")
            
            for index in 0..<gameArray.count {
                print("\(index). \(gameArray[index].title)")
            }
            var userInput = Int(readLine()!)
            
            while userInput == nil {
                print("Invalid input. please enter a usable index")
                userInput = Int(readLine()!)
            }
            gameArray.remove(at: userInput!)
        } else {
            print("wrong password")
        }
    }
    
    func listAvailableGames() {
        for game in gameArray {
            if game.checkedIn {
                print(game.title, game.rating)
                
            }
        }
    }
    
    func listUnavailableGames() {
        for game in gameArray {
            if !game.checkedIn {
                print(game.title)
                if let dueDate = game.dueDate {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "MM/dd/yyyy"
                    print("This game is due on:\(dateFormatter.string(from: dueDate))")
                }
            }
        }
    }
    
    
    
    func checkGameOut() {
        
        
        
        
        
        for index in 0..<gameArray.count {
            if gameArray[index].checkedIn {
                print("\(index). \(gameArray[index].title)")
            }
        }
        
        print("please enter the index of the game you wish to check out:\n")
        
        var userInput = Int(readLine()!)
        
        while userInput == nil || userInput! >= gameArray.count || userInput! < 0 {
            print("Invalid input. please enter a usable index")
            userInput = Int(readLine()!)
        }
        
        if !gameArray[userInput!].checkedIn {
            print("game is already checked out")
            checkGameOut()
        } else {
            
            gameArray[userInput!].checkedIn = false
            
            
            
            let currentCalendar = Calendar.current
            
            let dueDate = currentCalendar.date(byAdding: .day, value: 14, to: Date())
            
            gameArray[userInput!].dueDate = dueDate
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            print("This game is do back on \(dateFormatter.string(from: dueDate!))")
        }
    }
    func checkGameIN() {
        for index in 0..<gameArray.count {
            if !gameArray[index].checkedIn {
                print("\(index). \(gameArray[index].title)")
            }
        }
        
        print("please enter the index of the game you wish to check in:\n")
        
        var userInput = Int(readLine()!)
        
        while userInput == nil || userInput! >= gameArray.count || userInput! < 0 {
            print("Invalid input. please enter a usable index")
            userInput = Int(readLine()!)
        }
        
        if gameArray[userInput!].checkedIn {
            print("game is already checked in")
            checkGameIN()
        } else {
            
            gameArray[userInput!].checkedIn = true
            
            gameArray[userInput!].dueDate = nil
        }
    }
    
}
