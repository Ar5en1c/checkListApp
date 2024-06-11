//
//  AddChecklistViewController.swift
//  checklistApp
//
//  Created by Kuldeep Singh on 6/8/24.
//

import UIKit

protocol AddIconViewControllerDelegate: AnyObject {
    func didSelectIcon(named iconName: String)
}

class AddIconViewController: UIViewController {

    @IBOutlet weak var addIconTableView: UITableView!
    
    let iconNames = [
            "cart.fill",
            "briefcase.fill",
            "house.fill",
            "checklist",
            "heart.fill",
            "star.fill",
            "folder.fill",
            "bell.fill"
        ]
    
    weak var delegate: AddIconViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addIconTableView.dataSource = self
        addIconTableView.delegate = self
    }
    

}

extension AddIconViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return iconNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = addIconTableView.dequeueReusableCell(withIdentifier: "AddIconTableViewCell", for: indexPath) as! AddIconTableViewCell
        cell.iconsListName.text = iconNames[indexPath.row].replacingOccurrences(of: ".fill", with: " ")
        cell.iconsListImage.image = UIImage(systemName: iconNames[indexPath.row])
        return cell
    }
}

extension AddIconViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedIconName = iconNames[indexPath.row]
        delegate?.didSelectIcon(named: selectedIconName)
        navigationController?.popViewController(animated: true)
    }
}
