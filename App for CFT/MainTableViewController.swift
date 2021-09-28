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
    
    let note = [
        Model(title: "Балкан Гриль", subTitle: "subTitle", image: "Балкан Гриль"),
        Model(title: "Бочка", subTitle: "subTitle", image: "Бочка")
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
        cell.labelForTitle.text = note[indexPath.row].title
        cell.labelForSubTitle.text = note[indexPath.row].subTitle
        cell.imageForNote.image = UIImage(named: note[indexPath.row].image)
        cell.imageForNote.layer.cornerRadius = cell.imageForNote.frame.size.height / 2
        cell.imageForNote.clipsToBounds = true

        

        return cell
    }
    
    @IBAction func cancelAction(_ segue: UIStoryboardSegue) {}
}
