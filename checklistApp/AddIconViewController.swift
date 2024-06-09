//
//  AddChecklistViewController.swift
//  checklistApp
//
//  Created by Kuldeep Singh on 6/8/24.
//

import UIKit

class AddIconViewController: UIViewController {

    @IBOutlet weak var addIconTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addIconTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    

}

extension AddIconViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = addIconTableView.dequeueReusableCell(withIdentifier: "AddIconTableCell", for: indexPath)
        return cell
    }
}
