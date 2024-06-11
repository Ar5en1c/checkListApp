//
//  AddChecklistNameCell.swift
//  checklistApp
//
//  Created by Kuldeep Singh on 6/10/24.
//

import UIKit

class AddChecklistNameCell: UITableViewCell {

    @IBOutlet weak var addChecklistNameLabel: UITextField!
    
    var nameChangedClosure: ((String) -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        addChecklistNameLabel.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension AddChecklistNameCell: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        nameChangedClosure?(textField.text ?? "")
    }
}
