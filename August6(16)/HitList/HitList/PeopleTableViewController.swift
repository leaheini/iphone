//
//  PeopleTableViewController.swift
//  HitList
//
//  Created by hackeru on 06/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class PeopleTableViewController: UITableViewController {
    
    var tableArray : [Person] = []
    
    @IBAction func addPersonNameAction(_ sender: Any) {
        
        let alert = UIAlertController(title: "Add Person", message: nil, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { _ in
            
            guard let text = alert.textFields?.first?.text, !text.isEmpty else{
                return
            }

            //add data
            let person = Person(name: text)
            self.tableArray.insert(person, at: 0)
            
            //add row to UI
            let indexPath = IndexPath(row: 0, section: 0)
            self.tableView.insertRows(at: [indexPath], with: .right)  // insert from right side
        }))
        
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        
        alert.addTextField{
            $0.placeholder = "type a name"
        }
        
        self.present(alert, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableArray.append(Person(name: "test"))
        
        // to make edit btn from left to delete option (-)
        navigationItem.leftBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PersonCell

        // Configure the cell...
        cell.configure(with: tableArray[indexPath.row])   // the method we create on Person class

        return cell
    }
   
    
    // we want edit row in order to delete row
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
