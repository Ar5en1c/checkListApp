//
//  Models.swift
//  checklistApp
//
//  Created by Kuldeep Singh on 6/9/24.
//

import Foundation

struct Checklist {
    let name: String
    var items: [ChecklistItem]
    let iconName: String
}

struct ChecklistItem {
    let title: String
    var isChecked: Bool
}


var checklists: [Checklist] = [
    Checklist(name: "Groceries", items: [
        ChecklistItem(title: "Milk", isChecked: false),
        ChecklistItem(title: "Eggs", isChecked: false),
        ChecklistItem(title: "Bread", isChecked: false)
    ], iconName: "cart.fill"),
    
    Checklist(name: "Work", items: [
        ChecklistItem(title: "Emails", isChecked: false),
        ChecklistItem(title: "Meeting", isChecked: false),
        ChecklistItem(title: "Report", isChecked: false)
    ], iconName: "briefcase.fill"),
    
    Checklist(name: "Chores", items: [
        ChecklistItem(title: "Cleaning", isChecked: false),
        ChecklistItem(title: "Shop for the dog", isChecked: false),
        ChecklistItem(title: "Check Mails", isChecked: false)
    ], iconName: "house.fill"),
    
    Checklist(name: "ToDo", items: [
        ChecklistItem(title: "Assignments", isChecked: false),
        ChecklistItem(title: "Exercise", isChecked: false),
        ChecklistItem(title: "Walk the dog", isChecked: false)
    ], iconName: "checklist"),
    
    Checklist(name: "Groceries", items: [
        ChecklistItem(title: "Milk", isChecked: false),
        ChecklistItem(title: "Eggs", isChecked: false),
        ChecklistItem(title: "Bread", isChecked: false)
    ], iconName: "cart.fill")
]
