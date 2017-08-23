//
//  CharacterViewController.swift
//  MarvelProject
//
//  Created by hackeru on 20/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit
import SDWebImage

class CharacterViewController: UIViewController {
    
    @IBOutlet var textViewTopLayout: NSLayoutConstraint!
    var defaultTop : CGFloat = 0
    var defaultOffset : CGFloat = 0
    
    
    @IBOutlet var tableView: UITableView!
    var tableArray : [Comic] = []
    
    var char : Character!

    @IBOutlet var bgImageView: UIImageView!
    @IBOutlet var descTextView: UITextView!
    @IBOutlet var textViewHeightLayout: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        defaultTop = textViewTopLayout.constant
        defaultOffset = defaultTop * 2 + textViewHeightLayout.constant
        
        tableView.backgroundColor = .clear     //שקוף
        tableView.separatorStyle = .none     // remove the lines between the rows at the table view
        
        if char.desc.isEmpty{
            textViewHeightLayout.constant = 0
        }
        
        // to start the table not from top of the screen
        tableView.contentInset = UIEdgeInsets(top: defaultOffset, left: 0, bottom: 0, right: 0)
        
        navigationItem.title = char.name
        descTextView.text = char.desc
        bgImageView.sd_setImage(with: char.thumbnailURL, placeholderImage: #imageLiteral(resourceName: "marvel_logo_bg_image"))
    
        MarvelManager.manager.getComicsFor(charId: char.id.description) { (arr, err) in
            guard let arr = arr else{
                print(err?.localizedDescription ?? "unknown error")
                return
            }
            
            self.tableArray = arr
            self.tableView.reloadData()
        }
    }
    
    
}

extension CharacterViewController : UITableViewDelegate, UITableViewDataSource{
    /*
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Comics"
    }
 */
    
    // 2 methods must by the data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 + tableArray.count    // 1 of the title
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let isTitle = indexPath.row == 0
        let identifier = isTitle ? "title_cell" : "cell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
        let label = cell.viewWithTag(1) as? UILabel
        if isTitle{
            
            label?.text = "Comics"
            
        } else {
            
            let comic : Comic = tableArray[indexPath.row - 1]   // cause rows are one more from the array

            label?.text = comic.title
            label?.textColor = .red
            //cell.textLabel?.text = comic.title
            
            cell.accessoryType = comic.purchaseURL == nil ? .none : .disclosureIndicator  // if nil dont show the >
            
            //cell.backgroundColor = UIColor.white.withAlphaComponent(0.6)  // we do by story
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let row = indexPath.row - 1
        guard row >= 0, row < tableArray.count else {
            return
        }
        
        let comic: Comic = tableArray[row]

        guard let url = comic.purchaseURL else{
            return
        }
 
        let webVC = WebViewController.webViewController()
        
        webVC.name = comic.title
        webVC.url = url
        
        navigationController?.show(webVC, sender: nil)
        // or    navigationController?.pushViewController(webVC, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        var y = scrollView.contentOffset.y
        y = min(y,0)
        
        let delta = max(abs(defaultOffset) - abs(y) , 0)   // abs = ערך מוחלט    // max so the desc wont get down with the table
        
        textViewTopLayout.constant = defaultTop - delta   // defaultTop on story 16 from top

        
        print("y: \(scrollView.contentOffset.y)")
        print("delta: \(delta)")
    }
    
}
