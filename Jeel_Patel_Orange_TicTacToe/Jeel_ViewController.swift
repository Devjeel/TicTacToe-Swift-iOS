//
//  Jeel_ViewController.swift
//  Jeel_Patel_Orange_TicTacToe
//
//  Created by Jeel Patel on 2019-10-09.
//  Copyright © 2019 Jeel Patel. All rights reserved.
//

import UIKit

class Jeel_ViewController: UIViewController {
    
    //MARK:- Class Variables
    var theGameModel = Jeel_GameModel()
    var gameFinished  = false
    var replayingPastGame = false
    var pastGameData : gameInData? 
    
    //MARK:- Outlets
    @IBOutlet weak var gameStateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        gameStateLabel.text = theGameModel.whoseTurn + "'s Turn"
        
        if(replayingPastGame){
            theGameModel.isPastGame = true
            //show the past game
            navigationItem.title = "Past Game"
            //Game moves
            let pastGameMoves  = (pastGameData?.orderOfMoves)!
            //Delay Time
            var delay : Double = Double(0)
            
            for i in pastGameMoves{
                //Delay Time
                delay = delay + 1.0
                DispatchQueue.main.asyncAfter(deadline: .now() + delay,
                    execute: {
                        //Show moves
                        let button = self.view.viewWithTag(i)
                        self.squareTouched(button as! UIButton)
                })
                
            }
        } else {
            //nothing
        }
    }
    
    //MARK:- IBActions
    
    @IBAction func squareTouched(_ sender: UIButton) {
        print(sender.tag)
        
        // check if label is empty or game finished 
        if(!(sender.currentTitle == "X" || sender.currentTitle == "O" || gameFinished )) {
            sender.setTitle(theGameModel.whoseTurn, for: .normal)
            theGameModel.playMove(tag: sender.tag)
            
            // check if game is finished
            gameFinished = theGameModel.gameStatus()
            
            if(gameFinished){
                
                let whoWon = theGameModel.whoWon
                
                if(whoWon == ""){
                    gameStateLabel.text = "Match Draw !"
                } else {
                    gameStateLabel.text = whoWon + " Won!"
                    
                }
                
            } else {
                gameStateLabel.text = theGameModel.whoseTurn + "'s Turn"
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
