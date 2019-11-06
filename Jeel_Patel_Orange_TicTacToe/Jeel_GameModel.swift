//
//  Jeel_GameModel.swift
//  Jeel_Patel_Orange_TicTacToe
//
//  Created by Jeel Patel on 2019-10-09.
//  Copyright © 2019 Jeel Patel. All rights reserved.
//

import Foundation

class Jeel_GameModel {
    
    //Variables
    var whoseTurn = "X"
    var lastPlayed = ""
    var numberOfMoves = 0
    var whoWon = ""
    var squareContent = Array(repeating: "", count: 10)
    var orderOfMoves = [Int]()
    
    //Possible winning combinations 
    let winningCombination = [
        [1,2,3], [4,5,6], [7,8,9],
        [1,4,7], [2,5,8], [3,6,9],
        [1,5,9], [3,5,7]
    ]
    
    func playMove(tag: Int){
        orderOfMoves.append(tag)
        
        squareContent[tag] = whoseTurn
        
        //Who played last
        lastPlayed = whoseTurn
        
        //Alternate the turn
        if(whoseTurn == "X"){
            whoseTurn = "O"
        } else {
            whoseTurn = "X"
        }
        
        //Increase No. move
        numberOfMoves += 1
    }
    
    func gameStatus() -> Bool {
        if(numberOfMoves < 5){
            return false
        }
        
        // Look for winner
        for winningCombo in winningCombination{
            let index1 = winningCombo[0]
            let index2 = winningCombo[1]
            let index3 = winningCombo[2]
            
            // Only need to check for who played last
            if(squareContent[index1] == lastPlayed && squareContent[index2] == lastPlayed && squareContent[index3] == lastPlayed){
                //last played won the game
                whoWon = lastPlayed
                
                saveGame()
                
                return true
            }
        }
        
        // Declare gameover on 9th move
        if(numberOfMoves == 9) {
            saveGame()
            return true
        }
        
        //By Default
        return false
    }
    
    func saveGame() {
        //Number of games played using USERDEFAULTS storage for history
        var numberOfGamesPlayed = UserDefaults.standard.integer(forKey: Constants.NUM_GAMES)
        
        numberOfGamesPlayed += 1
        
        UserDefaults.standard.set(numberOfGamesPlayed, forKey: Constants.NUM_GAMES)
        
        if(whoWon == ""){
            UserDefaults.standard.set("Draw!", forKey: Constants.WHO_WON + String(numberOfGamesPlayed))
        } else {
            UserDefaults.standard.set(whoWon, forKey: Constants.WHO_WON + String(numberOfGamesPlayed))
        }
        
        UserDefaults.standard.set(whoWon, forKey: Constants.WHO_WON + String(numberOfGamesPlayed))
        
        let date = Date()
        
        UserDefaults.standard.set(date, forKey: Constants.DATE_TIME + String(numberOfGamesPlayed))
        
        UserDefaults.standard.set(orderOfMoves, forKey: Constants.ORDERS_OF_MOVES + String(numberOfGamesPlayed))
        
        print("Game Saved")
    }
}
