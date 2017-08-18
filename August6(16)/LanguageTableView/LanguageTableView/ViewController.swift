//
//  ViewController.swift
//  LanguageTableView
//
//  Created by hackeru on 06/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableArray : [String]
    var selectionSet : Set<String> = []  // to the check marked
    
    required init?(coder aDecoder: NSCoder) {
        
        // to show all output in hebrew
        let hebLang = Locale(identifier: "he")
        
        let arr = Locale.availableIdentifiers.flatMap{
            hebLang.localizedString(forLanguageCode: $0)
        }
        
        tableArray = Array(Set(arr)).sorted()
        
        super.init(coder: aDecoder)
    }

    // no need method number of section cause default 1
    
    //first must method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
    //second must table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = tableArray[indexPath.row]
        
        let name = tableArray[indexPath.row]
        cell.textLabel?.text = name
        
        if selectionSet.contains(name){
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        /*
        if indexPath.row % 2 == 0{
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }*/
        
        return cell
    }
    
    // lets continue extra
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let name = tableArray[indexPath.row]
        
        let cell = tableView.cellForRow(at: indexPath)   // refresh instead of reload line 84
        
        if selectionSet.contains(name){
            selectionSet.remove(name)
            cell?.accessoryType = .none
        } else{
            if selectionSet.count >= 5{
                let alert = UIAlertController(title: "error", message: "you cant choosh more than 5 langs", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
            } else {
                selectionSet.insert(name)
                cell?.accessoryType = .checkmark
            }
            
        }
        
        //tableView.reloadRows(at: indexPath, with: .automatic)   // recommend without reload
        
        //print(tableArray[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
}

