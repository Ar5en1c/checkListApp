//
//  ChecklistDataViewController.swift
//  checklistApp
//
//  Created by Kuldeep Singh on 6/8/24.
//

import UIKit

protocol ChecklistDataDelegate: AnyObject {
    func updateChecklist(at index: Int, with items: [ChecklistItem])
}


class ChecklistDataViewController: UIViewController {
    
    var checklistItems: [ChecklistItem]?
    var checklistIndex: Int?
    weak var delegate: ChecklistDataDelegate?
    
    @IBOutlet weak var checklistDataTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checklistDataTableView.dataSource = self
        checklistDataTableView.delegate = self  
        let addButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem = addButton
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if let index = checklistIndex {
            delegate?.updateChecklist(at: index, with: checklistItems!)
        }
    }
    
    @objc func addButtonTapped() {
        let modifyChecklistVC = storyboard?.instantiateViewController(identifier: "AddItemToChecklistVC") as! AddItemToChecklistVC
        navigationController?.pushViewController(modifyChecklistVC, animated: true)
    }

}


extension ChecklistDataViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        checklistItems?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = checklistDataTableView.dequeueReusableCell(withIdentifier: "ChecklistDataTableViewCell", for: indexPath) as! ChecklistDataTableViewCell
        let item = checklistItems?[indexPath.row]
        cell.checklistItemLabel.text = item?.title
        cell.checkImageView?.isHidden = !(item?.isChecked ?? false)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? ChecklistDataTableViewCell else { return }
        checklistItems?[indexPath.row].isChecked.toggle()
        cell.checkImageView?.isHidden.toggle()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
