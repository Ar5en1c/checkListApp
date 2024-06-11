//
//  MainChecklistTableViewCell.swift
//  checklistApp
//
//  Created by Kuldeep Singh on 6/9/24.
//

import UIKit

class MainChecklistTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var checklistLabel: UILabel!
    @IBOutlet weak var checklistRemainingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
