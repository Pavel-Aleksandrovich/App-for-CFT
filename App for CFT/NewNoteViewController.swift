//
//  NewNoteViewController.swift
//  App for CFT
//
//  Created by pavel mishanin on 28.09.2021.
//

import UIKit

class NewNoteViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    // MARK: Table View Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 2 {
            
        } else {
            view.endEditing(true)
        }
    }
    
}

// MARK: Text Field

extension NewNoteViewController: UITextFieldDelegate {
    // Скрываем клавиатуру по нажатию на Done

    func textFieldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
