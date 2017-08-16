//
//  SearchViewController.swift
//  MarvelProject
//
//  Created by hackeru on 16/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var collectionView : UICollectionView!
    var collectionArray : [Character] = []
    
    func reload(with name : String){
        
        func completion(_ arr : [Character]?, _ err : Error?){
            guard let arr = arr else{
                //TODO: toast it
                print(err?.localizedDescription ?? "unknown error")
                return
            }
            
            self.collectionArray = arr
            self.collectionView.reloadData()
        }
        
        MarvelManager.manager.getCharacters(by: name, completion: completion)
    }
    
}

extension SearchViewController : UICollectionViewDataSource{
    
    // the 2 must methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CharacterCell
        
        cell.configure(with: collectionArray[indexPath.item])
        
        return cell
    }
}

extension SearchViewController : UISearchBarDelegate{
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        collectionArray = []
        collectionView.reloadData()
        
        searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let name = searchBar.text, !name.isEmpty else {
            return
        }
        
        reload(with: name)
    }
}












