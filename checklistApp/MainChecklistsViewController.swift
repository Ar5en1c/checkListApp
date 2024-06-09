//
//  ViewController.swift
//  checklistApp
//
//  Created by Kuldeep Singh on 6/7/24.
//

import UIKit

class MainChecklistsViewController: UIViewController {

    @IBOutlet weak var checklistTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        checklistTableView.dataSource = self
        checklistTableView.delegate = self
    }
    
    
    @IBAction func addButtonTapped(_ sender: Any) {
        let addChecklistVC = storyboard?.instantiateViewController(withIdentifier: "AddChecklistViewController") as! AddChecklistViewController
        navigationController?.pushViewController(addChecklistVC, animated: true)
    }
    

}


extension MainChecklistsViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = checklistTableView.dequeueReusableCell(withIdentifier: "MainChecklistCell", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
            let addChecklistVC = storyboard?.instantiateViewController(withIdentifier: "AddChecklistViewController") as! AddChecklistViewController
            navigationController?.pushViewController(addChecklistVC, animated: true)
        }
    
}
