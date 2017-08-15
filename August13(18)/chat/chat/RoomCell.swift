//
//  RoomCell.swift
//  chat
//
//  Created by Leah  Eini on 15/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit
import Firebase

class RoomCell: UITableViewCell {

    @IBOutlet weak var edit: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var room : Room?
    
    func configure(with room : Room){
        nameLabel.text = room.name
        dateLabel.text = room.date?.toString
        self.room = room
        
        // check if its the room's owner
        edit.isHidden = room.owner != Auth.auth().currentUser?.uid
    }
    
    @IBAction func editAction(_ sender: Any) {
        let alert = UIAlertController(title: "Enter new room's name", message: nil, preferredStyle: .alert)
        
        alert.addTextField {
            $0.text = self.nameLabel.text
        }
        
        alert.addAction(UIAlertAction(title: "Save", style: .default, handler: { (_) in
            if let name = alert.textFields?.first?.text, !name.isEmpty{
                DBManager.manager.updateRoom(self.room!, name: name)
            }
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.show()
    }

}

extension UIAlertController {
    
    func show() {
        present(animated: true, completion: nil)
    }
    
    func present(animated: Bool, completion: (() -> Void)?) {
        if let rootVC = UIApplication.shared.keyWindow?.rootViewController {
            presentFromController(controller: rootVC, animated: animated, completion: completion)
        }
    }
    
    private func presentFromController(controller: UIViewController, animated: Bool, completion: (() -> Void)?) {
        if let navVC = controller as? UINavigationController,
            let visibleVC = navVC.visibleViewController {
            presentFromController(controller: visibleVC, animated: animated, completion: completion)
        } else
            if let tabVC = controller as? UITabBarController,
                let selectedVC = tabVC.selectedViewController {
                presentFromController(controller: selectedVC, animated: animated, completion: completion)
            } else {
                controller.present(self, animated: animated, completion: completion);
        }
    }
}
