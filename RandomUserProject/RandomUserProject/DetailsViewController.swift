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

class DetailsViewController: UIViewController {
    
    @IBOutlet var faceImageView: UIImageView!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
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
        
        nameLabel.text = user.fullName

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
   
    func dialANumber(_ sender: UIButton){
        
        if let number = sender.currentTitle,
            let url = URL(string: "tel://" + number),
            UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        } else{
            let alert = UIAlertController(title: "Could Not dial a phone number", message: "Your device could not dial a number.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            
        }
    }
    
    @IBAction func callAction(_ sender: UIButton) {
        
        dialANumber(sender)
    }
}

extension DetailsViewController : MFMailComposeViewControllerDelegate{
    
    @IBAction func emailAction(_ sender: UIButton) {
        if MFMailComposeViewController.canSendMail() {
            let mailComposeViewController = configuredMailComposeViewController()
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        
        let alert = UIAlertController(title: nil, message: "Type your email subject and content", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "send email", style: .default, handler: { _ in
            guard let subject = alert.textFields?.first?.text,
                let body = alert.textFields?.last?.text else{
                    return
            }
            mailComposerVC.setSubject(subject)
            mailComposerVC.setMessageBody(body, isHTML: false)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alert.addTextField{
            $0.placeholder = "type your email subject"
            $0.keyboardType = .default
        }
        
        alert.addTextField{
            $0.placeholder = "type your message body"
            $0.keyboardType = .default
        }
        
        self.present(alert, animated: true, completion: nil)
        
        mailComposerVC.setToRecipients([user.email])
        
        return mailComposerVC
    }
    
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertController(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", preferredStyle: .alert)
        
        sendMailErrorAlert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
        
        self.present(sendMailErrorAlert, animated: true, completion: nil)
    }
    
    // MARK: MFMailComposeViewControllerDelegate
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}

extension DetailsViewController : MFMessageComposeViewControllerDelegate {
    
    func sendSMS(){
        if MFMessageComposeViewController.canSendText(){
            let msgVC = MFMessageComposeViewController()
            
            let smsTextAlert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
            
            smsTextAlert.addAction(UIAlertAction(title: "Type your message", style: .default, handler: { (_) in
                guard let smsText = smsTextAlert.textFields?.first?.text else{
                    return
                }
                msgVC.body = smsText
            }))
            
            smsTextAlert.addAction(UIAlertAction(title: "Dismiss", style: .destructive, handler: nil))
            
            smsTextAlert.addTextField{
                $0.placeholder = "Type your sms message"
            }
            
            self.present(smsTextAlert, animated: true, completion: nil)
            
            msgVC.recipients = [self.user.cell]
            msgVC.messageComposeDelegate = self
            self.present(msgVC, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Could not send sms", message: "Your device could not send sms", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func cellAction(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Select action", message: "Do you want to call or send SMS?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Call number", style: .default, handler: { (_) in
            self.dialANumber(sender)
        }))
        
        alert.addAction(UIAlertAction(title: "Send SMS", style: .destructive, handler: { (_) in
            self.sendSMS()
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: MFMessageComposeViewControllerDelegate
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true, completion: nil)
    }
}
