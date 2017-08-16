//
//  RoomsViewController.swift
//  chat
//
//  Created by Benny Davidovitz on 13/08/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import Firebase

class RoomsViewController: UIViewController , UITableViewDataSource{

    @IBOutlet weak var tableView : UITableView!
    var tableArray : [Room] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        DBManager.manager.observeRoomAdded {
            self.tableArray.insert($0, at: 0)
            let indexPath = IndexPath(row: 0, section: 0)
            self.tableView.insertRows(at: [indexPath], with: .automatic)
        }
        
        DBManager.manager.observeRoomRemoved { id in
            
            let index = self.tableArray.index(where: { room in
                return room.id == id
            })
            
            if let index = index{
                let row : Int = Int(index)
                
                self.tableArray.remove(at: row)
                let indexPath = IndexPath(row: row, section: 0)
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
                
            }
            
            
        }
        
    }

    @IBAction func addRoomAction(){
        let alert = UIAlertController(title: "Add Room", message: nil, preferredStyle: .alert)
        
        alert.addTextField {
            $0.placeholder = "Room Name"
        }
        
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { (_) in
            guard let text = alert.textFields?.first?.text, !text.isEmpty else{
                return
            }
            
            DBManager.manager.createRoom(with: text)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }

    //MARK: - UITableview
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let r : Room = tableArray[indexPath.row]
        
        cell.textLabel?.text = r.name
        cell.detailTextLabel?.text = r.date?.toString
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        //only owner may delete
        return tableArray[indexPath.row].owner == Auth.auth().currentUser?.uid
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else{
            return
        }
        
        DBManager.manager.deleteRoom(tableArray[indexPath.row])
    }
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //making sure we are going now to chat screen, from a cell, and the tableview knowns its index path
        //using indexPath we can extract the Room object and set it to the coming chatVC instance
        if let chatVC = segue.destination as? ChatViewController,
            let cell = sender as? UITableViewCell,
            let indexPath = tableView.indexPath(for: cell){
            
            chatVC.room = tableArray[indexPath.row]
            
        }
    }
    
}
















