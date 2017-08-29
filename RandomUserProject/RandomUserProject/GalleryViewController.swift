//
//  GalleryViewController.swift
//  RandomUserProject
//
//  Created on 27/08/2017.
//  Copyright © 2017 leah.eini. All rights reserved.
//

import UIKit
import CCBottomRefreshControl

class GalleryViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var collectionArray : [User] = []
    var searchName : String?
    weak var refreashControl : UIRefreshControl!
    var page : UInt = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.backgroundView = UIImageView(image: #imageLiteral(resourceName: "randomusergenerator"))
        
        let control = UIRefreshControl()
        control.addTarget(self, action: #selector(refresh), for: .valueChanged)
        collectionView.addSubview(control)
        self.refreashControl = control
        
        let bottomControl = UIRefreshControl()
        bottomControl.addTarget(self, action: #selector(loadNextPage), for: .valueChanged)
        bottomControl.triggerVerticalOffset = 100
        collectionView.bottomRefreshControl = bottomControl
        
    }
    
    func loadNextPage(){
        guard let name = searchName else {
            collectionView.bottomRefreshControl?.endRefreshing()
            return
        }
        
        page += 1
        reload(with: name)
    }
    
    func refresh(){
        guard let name = searchName else {
            refreashControl.endRefreshing()
            return
        }
        
        page = 0
        reload(with: name)
    }
    
    func reload(with name: String){
        
        func completion(_ arr : [User]?, _ err : Error?){
            self.refreashControl.endRefreshing()
            self.collectionView.bottomRefreshControl?.endRefreshing()
            
            guard let arr = arr else {
                // todo Toast
                print(err?.localizedDescription ?? "unknown error")
                return
            }
            
            if self.page == 0{
                self.collectionArray = arr
            } else {
                self.collectionArray += arr
            }
            
            self.collectionView.reloadData()
        }
        
        // ***** recs per page ?
        APIManager.manager.getUsers(page: page, completion: completion)
    }

}

extension GalleryViewController : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UserCell
        cell.configure(with: collectionArray[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //remove the spacing between cells
        
        let width = Int(collectionView.bounds.width)
        let cellsInRow = width / 100
        let size = 100 + (width % 100) / cellsInRow
        
        return CGSize(width: size, height: size)
    }
    
}


extension GalleryViewController : UISearchBarDelegate{
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        collectionArray = []
        collectionView.reloadData()
        
        searchBar.resignFirstResponder()
        searchName = nil
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let name = searchBar.text, !name.isEmpty else {
            return
        }
        
        searchName = name
        page = 0
        
        reload(with: name)
    }
}







































