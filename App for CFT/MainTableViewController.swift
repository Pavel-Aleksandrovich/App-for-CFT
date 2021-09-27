//
//  MainTableViewController.swift
//  App for CFT
//
//  Created by pavel mishanin on 27.09.2021.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    let notification = ["first", "second"]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return notification.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = notification[indexPath.row]

        

        return cell
    }
   
}
