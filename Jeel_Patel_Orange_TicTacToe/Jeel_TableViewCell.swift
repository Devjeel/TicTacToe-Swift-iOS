//
//  Jeel_TableViewCell.swift
//  Jeel_Patel_Orange_TicTacToe
//
//  Created by Jeel Patel on 2019-09-25.
//  Copyright © 2019 Jeel Patel. All rights reserved.
//

import UIKit

class Jeel_TableViewCell: UITableViewCell {
    
    //MARK:-Outlets
    @IBOutlet weak var winLossImage: UIImageView!
    @IBOutlet weak var whoWonLabel: UILabel!
    @IBOutlet weak var dateTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
