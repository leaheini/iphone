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
    weak var refreashControl : UIRefreshControl!
    var page : UInt = 0
    var type : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //collectionView.backgroundView = UIImageView(image: #imageLiteral(resourceName: "randomusergenerator"))
        
        let control = UIRefreshControl()
        control.addTarget(self, action: #selector(refresh), for: .valueChanged)
        collectionView.addSubview(control)
        self.refreashControl = control
        
        let bottomControl = UIRefreshControl()
        bottomControl.addTarget(self, action: #selector(loadNextPage), for: .valueChanged)
        bottomControl.triggerVerticalOffset = 100
        collectionView.bottomRefreshControl = bottomControl
        
        refresh()
        
    }
    
    func loadNextPage(){
        
        page += 1
        reload()
    }
    
    func refresh(){
        
        //type = UserDefaults.standard.string(forKey: "gender") ?? ""
        page = 0
        reload()
    }
    
    func reload(){
        
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
        
        //type = UserDefaults.standard.string(forKey: "gender") ?? ""
        
        APIManager.manager.getUsers(page: page, gender: type, completion: completion(_:_:))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailsVC = segue.destination as? DetailsViewController,
            let cell = sender as? UserCell,
            let indexPath = self.collectionView.indexPath(for: cell)
        {
            detailsVC.user = self.collectionArray[indexPath.item]
            
        }
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









































