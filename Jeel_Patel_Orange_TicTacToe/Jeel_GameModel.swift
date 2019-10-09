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
    
    var numberOfMoves = 0
    
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
        return false
    }
}
