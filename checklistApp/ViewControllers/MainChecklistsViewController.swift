//
//  ViewController.swift
//  checklistApp
//
//  Created by Kuldeep Singh on 6/7/24.
//

import UIKit

class MainChecklistsViewController: UIViewController {

    @IBOutlet weak var checklistTableView: UITableView!
    var addItemClosure: ((Checklist) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        checklistTableView.dataSource = self
        checklistTableView.delegate = self
        
        addItemClosure = { checklist in
                    checklists.append(checklist)
                    self.checklistTableView.reloadData()
                }
    }
    
    
    @IBAction func addButtonTapped(_ sender: Any) {
        let addChecklistVC = storyboard?.instantiateViewController(withIdentifier: "AddChecklistViewController") as! AddChecklistViewController
        addChecklistVC.addItem = addItemClosure
        navigationController?.pushViewController(addChecklistVC, animated: true)
    }
    

}


extension MainChecklistsViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return checklists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = checklistTableView.dequeueReusableCell(withIdentifier: "MainChecklistTableViewCell", for: indexPath) as! MainChecklistTableViewCell
        let checklist = checklists[indexPath.row]
        let checked = checklist.items.filter { $0.isChecked }.count
        let unchecked = checklist.items.count - checked
        cell.checklistLabel.text = checklist.name
        cell.checklistRemainingLabel.text = "\(unchecked) Remaining"
        cell.iconImage.image = UIImage(systemName: checklists[indexPath.row].iconName)
        return cell
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
            let addChecklistVC = storyboard?.instantiateViewController(withIdentifier: "AddChecklistViewController") as! AddChecklistViewController
            navigationController?.pushViewController(addChecklistVC, animated: true)
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let checklistDataVC = storyboard?.instantiateViewController(withIdentifier: "ChecklistDataViewController") as! ChecklistDataViewController
        checklistDataVC.checklistItems = checklists[indexPath.row].items
        checklistDataVC.checklistIndex = indexPath.row
        checklistDataVC.delegate = self
        navigationController?.pushViewController(checklistDataVC, animated: true)
    }
}


extension MainChecklistsViewController: ChecklistDataDelegate {
    func updateChecklist(at index: Int, with items: [ChecklistItem]) {
            checklists[index].items = items 
            checklistTableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
        }
}
