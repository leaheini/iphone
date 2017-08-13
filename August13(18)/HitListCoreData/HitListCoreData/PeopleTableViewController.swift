//
//  PeopleTableViewController.swift
//  HitListCoreData
//
//  Created by hackeru on 09/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit
import CoreData

class PeopleTableViewController: UITableViewController {

    @IBOutlet var searchBar: UISearchBar!
    
    var controller = DBManager.manager.fetchAllPeople()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.leftBarButtonItem = self.editButtonItem
        controller.delegate = self  // delegate of the core data, to recieve changes
        searchBar.delegate = self
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return controller.sections?[section].name
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return controller.sections?.count ?? 0
    }
    
    // suuport of index titles - addind sargel A-Z on side
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return controller.sectionIndexTitles
    }
    
    override func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return controller.section(forSectionIndexTitle: title, at: index)
    }
    // end of support
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller.sections![section].numberOfObjects
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PersonCell

        // Configure the cell...
        let p : Person = controller.object(at: indexPath)
        cell.configure(with: p)

        return cell
    }
 

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }


    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
        
            let p : Person = controller.object(at: indexPath)
            DBManager.manager.context.delete(p)
            DBManager.manager.saveContext()
        }
    }
 

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension PeopleTableViewController : NSFetchedResultsControllerDelegate{
    // will start updates
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    // did finish updates
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
    // new family section added or removed
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
        let indexSet = IndexSet(integer: sectionIndex)
        switch type {
        case .delete:
            tableView.deleteSections(indexSet, with: .automatic)
        case .insert:
            tableView.insertSections(indexSet, with: .automatic)
        default:
            break
        }
    }
    
    // notify about Person instance event (add, delete, change)
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            tableView.insertRows(at: [newIndexPath!], with: .automatic)
        case .delete:
            tableView.deleteRows(at: [indexPath!], with: .automatic)
        case .update:
            let cell = tableView.cellForRow(at: indexPath!) as? PersonCell
            let p : Person = self.controller.object(at: indexPath!)
            cell?.configure(with: p)
        case .move:
            tableView.moveRow(at: indexPath!, to: newIndexPath!)
        }
    }
    
    
}

extension PeopleTableViewController : UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.controller = DBManager.manager.fetchAllPeople(filter: searchText)
        controller.delegate = self   // everytime we create controller we need to code who's the delegate
        tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()  // close keybaurd
        
        // reload data
        controller = DBManager.manager.fetchAllPeople()
        controller.delegate = self
        // reload UI
        tableView.reloadData()
    }
    
}


