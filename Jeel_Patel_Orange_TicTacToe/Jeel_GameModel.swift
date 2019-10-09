//
//  Jeel_GameModel.swift
//  Jeel_Patel_Orange_TicTacToe
//
//  Created by Jeel Patel on 2019-10-09.
//  Copyright © 2019 Jeel Patel. All rights reserved.
//

import Foundation

class Jeel_GameModel {
    var whoseTurn = "X"
    var lastPlayed = ""
    var numberOfMoves = 0
    var whoWon = ""
    var squareContent = Array(repeating: "", count: 10)
    
    let winningCombination = [
        [1,2,3], [4,5,6], [7,8,9],
        [1,4,7], [2,5,8], [3,6,9],
        [1,5,9], [3,5,7]
    ]
    
    func playMove(tag: Int){
        squareContent[tag] = whoseTurn
        
        if(whoseTurn == "X"){
            whoseTurn = "O"
        } else {
            whoseTurn = "X"
        }
        
        numberOfMoves += 1
        
    }
    
    func gameStatus() -> Bool {
        if(numberOfMoves < 5){
            return false
        } else if(numberOfMoves == 9) {
            return true
        }
        
        for winningCombo in winningCombination{
            let index1 = winningCombo[0]
            let index2 = winningCombo[1]
            let index3 = winningCombo[2]
            
            // Only need to check for who played last
            if(squareContent[index1] == lastPlayed && squareContent[index2] == lastPlayed && squareContent[index3] == lastPlayed){
                //last played won the game
                whoWon = lastPlayed
                return true
            }
        }
        return false
    }
}
