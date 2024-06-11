//
//  AddIconTableViewCell.swift
//  checklistApp
//
//  Created by Kuldeep Singh on 6/9/24.
//

import UIKit

class AddIconTableViewCell: UITableViewCell {

    @IBOutlet weak var iconsListName: UILabel!
    @IBOutlet weak var iconsListImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
