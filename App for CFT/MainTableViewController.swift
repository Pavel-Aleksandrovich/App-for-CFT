//
//  MainTableViewController.swift
//  App for CFT
//
//  Created by pavel mishanin on 27.09.2021.
//

import UIKit
import RealmSwift

class MainTableViewController: UITableViewController {
    
    let identifireCell = "cell"
    var mainNotes: Results<Model>!
    
    //    var note = [
    //        Model(title: "Балкан Гриль", subTitle: "subTitle", image: "Балкан Гриль", newImage: nil)
    //    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainNotes = realm.objects(Model.self)
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return mainNotes.isEmpty ? 0 : mainNotes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifireCell, for: indexPath) as! CustomTableViewCell
        
        let notes = mainNotes[indexPath.row]
        
        cell.labelForTitle.text = notes.title
        cell.labelForSubTitle.text = notes.subTitle
//        let image = UIImage?.self
        let testImage = #imageLiteral(resourceName: "imagePlaceholder") as? Data
        
        if notes.oneImage != nil {
            cell.imageForNote.image = UIImage(data: notes.oneImage!)
            
        } else {
            cell.imageForNote.image = #imageLiteral(resourceName: "imagePlaceholder")
        }
        
        cell.imageForNote.layer.cornerRadius = cell.imageForNote.frame.size.height / 2
        cell.imageForNote.clipsToBounds = true
        
        
        
        return cell
    }
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        guard let newNoteVC = segue.source as? NewNoteViewController else {return}
        
        newNoteVC.saveNewNote()
        tableView.reloadData()
        
        
    }
    
    // MARK: - Table View Delegate
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let note = mainNotes[indexPath.row]
            StorageManager.deleteObject(note)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
}
