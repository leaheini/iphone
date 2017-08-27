//
//  ListViewController.swift
//  LocationProject
//
//  Created by Benny Davidovitz on 27/08/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import CoreLocation

class ListViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{
    
    var tableArray : [Branch] = []
    @IBOutlet weak var tableView : UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        reloadBranches()
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadBranches), name: .locationUpdate, object: nil)
    }
    
    func reloadBranches(){
        //sort all branches using distnance from current location (distance prop)
        let arr = Branch.allBranches.sorted {
            $0.distance ?? 0 < $1.distance ?? 0
        }
        //reload table view data
        self.tableArray = arr
        self.tableView.reloadData()
    }

    //MARK: - UITableView 
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BranchCell
        
        cell.configure(with: tableArray[indexPath.row])
        
        return cell
    }
    
    //MARK: - Navigation    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextVC = segue.destination as? DetailsViewController,
            let cell = sender as? UITableViewCell,
            let indexPath = tableView.indexPath(for: cell){
            
            nextVC.branch = tableArray[indexPath.row]
            
        }
    }
   
}









