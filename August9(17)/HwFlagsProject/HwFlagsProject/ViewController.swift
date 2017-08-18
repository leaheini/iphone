//
//  ViewController.swift
//  HwFlagsProject
//
//  Created by hackeru on 09/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var tableArray : [Currency] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ServerLogic.shared.getCurrencies(with: "USD") {  // can switch to other currency state
            self.navigationItem.title = $1   // the date
            self.tableArray = $0    // the Currency array we load at class ServerLogic
            self.tableView.reloadData()
        }
        
        /*   //// we made instead class ServerLogic
        let url = "https://api.fixer.io/latest"
        let params : [String:Any] = [
            "base":"USD"
            ]
        
        Alamofire.request(url, method: .get, parameters: params).responseJSON {
            (response) in
            
            guard let result = response.result.value as? [String:Any] else{
                print(response.error?.localizedDescription ?? "unkown error")
                return
            }
            
            // lets print the date on top
            let dateString = result["date"] as? String
            self.navigationItem.title = dateString
            
            //print(result)  // now we get the json data
            
            guard let ratesDict = result["rates"] as? [String:Double] else{
                return
            }
            
            self.tableArray = ratesDict.flatMap({
                Currency(code: $0.key, value: $0.value)
            })
            
            self.tableView.reloadData()
        }
 */
        
        /*
        Alamofire.request("http://api.fixer.io/latest?base=USD").responseJSON{
            redponse in
            
        }
         */
    }

}

extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CurrencyCell
        
        let c = tableArray[indexPath.row]
        cell.configure(with: c)
        
        if indexPath.row % 2 == 0 {
            cell.contentView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        } else {
            cell.contentView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.7)
        }
        
        return cell
    }
}

