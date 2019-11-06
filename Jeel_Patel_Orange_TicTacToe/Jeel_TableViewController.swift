//
//  Jeel_TableViewController.swift
//  Jeel_Patel_Orange_TicTacToe
//
//  Created by Jeel Patel on 2019-09-25.
//  Copyright © 2019 Jeel Patel. All rights reserved.
//

import UIKit

class Jeel_TableViewController: UITableViewController {
    
    var gameDataArray = [gameInData]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        loadData()
        tableView.reloadData()
    }

    // MARK: - Table view data source
    
    func loadData() {
        
        gameDataArray = [gameInData]()
        
        let numberOfGamesPlayed = UserDefaults.standard.integer(forKey: Constants.NUM_GAMES)
        
        for i in (0..<numberOfGamesPlayed).reversed() {
            
            let whoWon = UserDefaults.standard.string(forKey: Constants.WHO_WON + String(i + 1))!
            
            let dateTime = UserDefaults.standard.object(forKey: Constants.DATE_TIME + String(i + 1)) as! Date
            
            let orderOfMoves = UserDefaults.standard.array(forKey: Constants.ORDERS_OF_MOVES + String(i + 1)) as! [Int]
            
            let gameData = gameInData(whoWon: whoWon, dateTime: dateTime, orderOfMoves: orderOfMoves)
            
            gameDataArray.append(gameData)
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let numberOfGamesPlayed = UserDefaults.standard.integer(forKey: Constants.NUM_GAMES)
        return numberOfGamesPlayed
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "jeel_TableCell", for: indexPath) as! Jeel_TableViewCell

        // Configure the cell...
        //For cell 'i'
        let i = indexPath.row
        
        //Load gamedata
        let gameData = gameDataArray[i]
        
        //Date Formatter -> date to string
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        
        let formattedDateTime = dateFormatter.string(from: gameData.dateTime)
        
        //Change labels with data
        if (gameData.whoWon == ""){
            cell.whoWonLabel.text = "Draw!"
        } else {
            cell.whoWonLabel.text = gameData.whoWon + " Won!"
        }
        cell.dateTimeLabel.text = formattedDateTime
        
        if(gameData.whoWon == "X"){
            cell.winLossImage.image = UIImage(named: "orange_win")
        } else {
            cell.winLossImage.image = UIImage(named: "orange_loss")
        }
        cell.gameData = gameData
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        //CHECK New VS Previous game
        let identifier = segue.identifier
        
        if(identifier == "newGame"){
            return
        }
        
        //Setup for previous Game
        let whichCell = sender as! Jeel_TableViewCell
        let destinationView = segue.destination as! Jeel_ViewController
        
        destinationView.replayingPastGame = true
        destinationView.pastGameData = whichCell.gameData
    }

}


struct gameInData {
    var whoWon : String
    var dateTime : Date
    var orderOfMoves : [Int]
}
