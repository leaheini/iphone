//
//  ViewController.swift
//  TableViewProject
//
//  Created by hackeru on 06/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10   // not must method - on default 1
    }
    
    //the first method must
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section + 1
    }
    
    // the second and last method must
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Row \(indexPath.row)"  // title to each row
        return cell
    }
    
    // title to each section
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }

}

