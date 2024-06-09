//
//  ChecklistDataViewController.swift
//  checklistApp
//
//  Created by Kuldeep Singh on 6/8/24.
//

import UIKit

class ChecklistDataViewController: UIViewController {

    @IBOutlet weak var checklistDataTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        checklistDataTableView.dataSource = self
        checklistDataTableView.delegate = self
    }

}


extension ChecklistDataViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = checklistDataTableView.dequeueReusableCell(withIdentifier: "ChecklistDataTableViewCell", for: indexPath) as! ChecklistDataTableViewCell
        cell.checkImageView?.isHidden = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? ChecklistDataTableViewCell else { return }
        cell.checkImageView?.isHidden = false
    }
    
}
