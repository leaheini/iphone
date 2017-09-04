//
//  GalleryViewController.swift
//  RandomUserProject
//
//  Created on 27/08/2017.
//  Copyright © 2017 leah.eini. All rights reserved.
//

//  https://developer.apple.com/documentation/foundation/nsnotificationcenter
// http://dev.iachieved.it/iachievedit/notifications-and-userinfo-with-swift-3-0/

import UIKit
import CCBottomRefreshControl
import Toaster

class GalleryViewController: UIViewController {
        
    @IBOutlet weak var collectionView: UICollectionView!
    var collectionArray : [User] = []
    weak var refreshControl : UIRefreshControl!
    var page : UInt = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(refresh), name: .genderSettingsChanged, object: nil)
        
        //collectionView.backgroundView = UIImageView(image: #imageLiteral(resourceName: "purple_background"))
        
        let control = UIRefreshControl()
        control.addTarget(self, action: #selector(refresh), for: .valueChanged)
        collectionView.addSubview(control)
        self.refreshControl = control
        
        let bottomControl = UIRefreshControl()
        bottomControl.addTarget(self, action: #selector(loadNextPage), for: .valueChanged)
        bottomControl.triggerVerticalOffset = 100
        collectionView.bottomRefreshControl = bottomControl
        
        refresh()
        
    }
    
    @IBAction func refreshBarButton(_ sender: UIBarButtonItem) {
        
        refresh()
    }
    
    func loadNextPage(){
        
        page += 1
        reload()
    }
    
    func refresh(){
        
        guard Thread.isMainThread else{
            DispatchQueue.main.async {
                self.refresh()
            }
            return
        }
        
        switch Settings.shared.gender {
        case .female:
            navigationItem.title = "Female Random Users"
        case .male:
            navigationItem.title = "Male Random Users"
        case .all:
            navigationItem.title = "All Random Users"
        }
        
        page = 0
        reload()
    }
    
    func reload(){
        
        func completion(_ arr : [User]?, _ err : Error?){
            self.refreshControl.endRefreshing()
            self.collectionView.bottomRefreshControl?.endRefreshing()
            
            guard let arr = arr else {
                Toast(text: err?.localizedDescription ?? "unknown error", delay: Delay.short, duration: Delay.long).show()
                return
            }
            
            if self.page == 0{
                self.collectionArray = arr
            } else {
                self.collectionArray += arr
            }
            
            self.collectionView.reloadData()
        }
        
        APIManager.manager.getUsers(page: page, completion: completion)
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









































