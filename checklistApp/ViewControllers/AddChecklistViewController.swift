//
//  AddChecklistViewController.swift
//  checklistApp
//
//  Created by Kuldeep Singh on 6/8/24.
//

import UIKit

class AddChecklistViewController: UIViewController {

    @IBOutlet weak var addChecklistTableView: UITableView!
    
    var addItem: ((Checklist) -> ())?
    
    var selectedIconName: String?
    var checklistName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addChecklistTableView.dataSource = self
        addChecklistTableView.delegate = self
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        guard let name = checklistName, let iconName = selectedIconName else { return }
        let newChecklist = Checklist(name: name, items: [], iconName: iconName)
        addItem?(newChecklist)
        navigationController?.popViewController(animated: true)
    }
    
}

extension AddChecklistViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = addChecklistTableView.dequeueReusableCell(withIdentifier: "AddChecklistNameCell", for: indexPath) as! AddChecklistNameCell
            cell.nameChangedClosure = { name in
                            self.checklistName = name
                        }
            return cell
        } else {
            let cell = addChecklistTableView.dequeueReusableCell(withIdentifier: "AddChecklistIconTableViewCell", for: indexPath) as! AddChecklistIconTableViewCell
            if let iconName = selectedIconName {
                cell.checklistIconImageView.image = UIImage(systemName: iconName)
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            let checklistIconsVC = storyboard?.instantiateViewController(withIdentifier: "AddIconViewController") as! AddIconViewController
            checklistIconsVC.delegate = self
            
            navigationController?.pushViewController(checklistIconsVC, animated: true)
        }
    }
}


extension AddChecklistViewController: AddIconViewControllerDelegate {
    func didSelectIcon(named iconName: String) {
        selectedIconName = iconName
        addChecklistTableView.reloadData()
    }
}
