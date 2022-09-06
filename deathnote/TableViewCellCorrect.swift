//
//  TableViewCellCorrect.swift
//  deathnote
//
//  Created by Vitaliy Plaschenkov on 12.08.2022.
//

import UIKit

class TableViewCellCorrect: UITableViewCell {

    @IBOutlet weak var namePerson: UILabel!
    @IBOutlet weak var timeDeath: UILabel!
    @IBOutlet weak var reasonDeath: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
