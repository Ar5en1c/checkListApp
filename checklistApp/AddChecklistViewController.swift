//
//  AddChecklistViewController.swift
//  checklistApp
//
//  Created by Kuldeep Singh on 6/8/24.
//

import UIKit

class AddChecklistViewController: UIViewController {

    @IBOutlet weak var addChecklistTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addChecklistTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    

}

extension AddChecklistViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = addChecklistTableView.dequeueReusableCell(withIdentifier: "AddChecklistNameCell", for: indexPath)
            return cell
        } else {
            let cell = addChecklistTableView.dequeueReusableCell(withIdentifier: "AddIconCell", for: indexPath)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    
    
    
}
