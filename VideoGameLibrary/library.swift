//
//  library.swift
//  VideoGameLibrary
//
//  Created by Spencer Casteel on 9/4/18.
//  Copyright © 2018 Spencer Casteel. All rights reserved.
//

import Foundation

class Library {
    
    private var gameArray: [Game] = [Game(title: "farming simulator 19"), Game(title: "fallout 3"), Game(title: "GTA V"), Game(title: "Marvel's Spider-Man")]
    
    func addGame() {
        print("please enter the title of the game:")
        
        var newGameTitle = readLine()
        
        while newGameTitle == nil || newGameTitle == "" {
            print("invalid title, please try again:")
            newGameTitle = readLine()
        }
        
        let newGame = Game(title: newGameTitle!)
        
        gameArray.append(newGame)
        
    }
    
    func removeGame () {
        
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
    }
    
    
    func listAvailableGames() {
        for game in gameArray {
            if game.checkedIn {
                print(game.title)
                
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
            print("\(index). \(gameArray[index].title)")
        }
        
        print("please enter the index of the game you wish to check out:\n")
        
        var userInput = Int(readLine()!)
        
        while userInput == nil {
            print("Invalid input. please enter a usable index")
        userInput = Int(readLine()!)
    }
    
    gameArray[userInput!].checkedIn = false
        
    
    
    let currentCalendar = Calendar.current
    
        let dueDate = currentCalendar.date(byAdding: .day, value: 14, to: Date())
    
        gameArray[userInput!].dueDate = dueDate
        
    }
    func checkGameIN() {
        for index in 0..<gameArray.count {
            print("\(index). \(gameArray[index].title)")
        }
            print("please enter the index of the game you wish to check in:\n")
            
            var userInput = Int(readLine()!)
            
            while userInput == nil {
                print("Invalid input. please enter a usable index")
                userInput = Int(readLine()!)
            }
            
            gameArray[userInput!].checkedIn = true
            
            gameArray[userInput!].dueDate = nil
        }
    }

