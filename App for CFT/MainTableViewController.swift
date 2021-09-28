//
//  MainTableViewController.swift
//  App for CFT
//
//  Created by pavel mishanin on 27.09.2021.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    let identifireCell = "cell"
//    let notes = ["Балкан Гриль", "Бочка"]
    
    var note = [
        Model(title: "Балкан Гриль", subTitle: "subTitle", image: "Балкан Гриль", newImage: nil)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return note.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifireCell, for: indexPath) as! CustomTableViewCell
        
        let notes = note[indexPath.row]
        
        cell.labelForTitle.text = notes.title
        cell.labelForSubTitle.text = notes.subTitle
        
        if notes.newImage == nil {
            cell.imageForNote.image = UIImage(named: notes.image!)
        } else {
            cell.imageForNote.image = notes.newImage
        }
        
        
        cell.imageForNote.layer.cornerRadius = cell.imageForNote.frame.size.height / 2
        cell.imageForNote.clipsToBounds = true

        

        return cell
    }
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        guard let newNoteVC = segue.source as? NewNoteViewController else {return}
        
        newNoteVC.saveNewNote()
        note.append(newNoteVC.newModel!)
        tableView.reloadData()
        
        
    }
}
