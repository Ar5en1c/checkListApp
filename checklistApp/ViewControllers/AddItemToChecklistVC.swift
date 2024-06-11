//
//  AddItemToChecklistVC.swift
//  checklistApp
//
//  Created by Kuldeep Singh on 6/11/24.
//

import UIKit

class AddItemToChecklistVC: UIViewController {

    @IBOutlet weak var addItemChecklistTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addItemChecklistTableView.dataSource = self
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButtonTapped))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc func doneButtonTapped() {
        navigationController?.popViewController(animated: true)
    }

}


extension AddItemToChecklistVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = addItemChecklistTableView.dequeueReusableCell(withIdentifier: "ChecklistItemNameCell", for: indexPath)
            return cell
        } else if indexPath.row == 1 {
            let cell = addItemChecklistTableView.dequeueReusableCell(withIdentifier: "RemindMeChecklistItemCell", for: indexPath)
            return cell
        } else {
            let cell = addItemChecklistTableView.dequeueReusableCell(withIdentifier: "DueDateChecklistItemCell", for: indexPath)
            return cell
        }
    }
    
    
}
