//
//  DetailsViewController.swift
//  RandomUserProject
//
//  Created by leah on 30/08/2017.
//  Copyright © 2017 leah.eini. All rights reserved.
//

import UIKit
import SDWebImage
import CoreLocation
import MessageUI

class DetailsViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    @IBOutlet var faceImageView: UIImageView!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var nameTextView: UITextView!
    @IBOutlet var genderImageView: UIImageView!
    
    @IBOutlet var dobLabel: UILabel!
    @IBOutlet weak var locationButton: UIButton!
    @IBOutlet weak var emailButton: UIButton!
    @IBOutlet var registeredLabel: UILabel!
    @IBOutlet weak var phoneButton: UIButton!
    @IBOutlet weak var cellButton: UIButton!
    @IBOutlet var natLabel: UILabel!
    
    var user : User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        faceImageView.image = nil
        if let url = user.picture?.large{
            faceImageView.sd_setImage(with: url)
        } else {
            faceImageView.sd_cancelCurrentImageLoad()
        }
        
        if let age = user.dob?.age{
            ageLabel.text = "\(age)"
        } else {
            ageLabel.text = ""
        }
        
        nameTextView.text = user.fullName

        genderImageView.image = nil
        switch user.gender {
        case .male:
            genderImageView.image = #imageLiteral(resourceName: "icons8-male_filled")
        case .female:
            genderImageView.image = #imageLiteral(resourceName: "icons8-female_filled")
        default:
            genderImageView.image = nil
        }
        
        if let dob = user.dob?.toString{
            dobLabel.text = "Date of birth: " + dob
        } else {
            dobLabel.text = "No date of birth"
        }
        
        if let registered = user.registered?.toString{
            registeredLabel.text = "Member since: " + registered
        } else{
            registeredLabel.text = "No date of registered"
        }
        
        locationButton.setTitle(user.location, for: .normal)
        emailButton.setTitle(user.email, for: .normal)
        phoneButton.setTitle(user.phone, for: .normal)
        cellButton.setTitle(user.cell, for: .normal)
        natLabel.text = "National: " + user.nat
        
    }

    @IBAction func locationAction(_ sender: UIButton) {
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(user.location) { (placemarks, error) in
            guard
                let placemarks = placemarks,
                let location = placemarks.first?.location
                else {
                    // taost no place found
                    return
            }
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            
            let urlString = "waze://?ll=\(lat),\(lon)&navigate=yes"
            
            guard let url = URL(string: urlString) else{
                return
            }
            
            guard UIApplication.shared.canOpenURL(url) else{
                print("waze not installed")
                return
            }
            
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
   
    @IBAction func emailAction(_ sender: UIButton) {
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } /*else {
            self.showSendMailErrorAlert()
        }*/
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        
        mailComposerVC.setToRecipients([user.email])
        //mailComposerVC.setSubject("Sending you an in-app e-mail")
        //mailComposerVC.setMessageBody("Sending e-mail to random user", isHTML: false)
        
        return mailComposerVC
    }
    
    /*
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertController(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", preferredStyle: .alert)
        
        sendMailErrorAlert.addAction(UIAlertAction(title: "no", style: .cancel, handler: nil))

        self.present(sendMailErrorAlert, animated: true, completion: nil)
    }*/
    
    // MARK: MFMailComposeViewControllerDelegate Method
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func callAction(_ sender: UIButton) {
        
    }
    

}
