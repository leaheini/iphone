//
//  ViewController.swift
//  NotificationProject
//
//  Created by Benny Davidovitz on 30/08/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var timestamp = Int(Date().timeIntervalSince1970) //10:36:12
        timestamp -= timestamp % 60 //10:36:00
        timestamp += 60 //10:37:00
        
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
        datePicker.date = date
        datePicker.minimumDate = date
        
        
        requestPermissions()
    }
    
    func requestPermissions(){
        
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.badge, .sound, .carPlay]) { (success, error) in
                if success {
                    print("success")
                    
                    UIApplication.shared.registerForRemoteNotifications()
                    
                } else {
                    print("faile with error: \(error?.localizedDescription ?? "")")
                }
            }
        } else {
            // Fallback on earlier versions
            let app = UIApplication.shared
            
            let reminderAction = UIMutableUserNotificationAction()
            reminderAction.identifier = "reminder"
            reminderAction.title = "נודניק"
            reminderAction.activationMode = .background
            reminderAction.isAuthenticationRequired = false
            
            let quickReplyAction = UIMutableUserNotificationAction()
            quickReplyAction.identifier = "quickReply"
            quickReplyAction.title = "השב"
            quickReplyAction.activationMode = .background
            quickReplyAction.isAuthenticationRequired = true
            quickReplyAction.behavior = .textInput
            
            let category = UIMutableUserNotificationCategory()
            category.identifier = "cat"
            category.setActions([reminderAction,quickReplyAction], for: .default)
            
            
            let settings = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: [category])
            
            app.registerUserNotificationSettings(settings)
        }
        
        
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        
        if #available(iOS 10.0, *) {
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60 /*seconds*/, repeats: false)
            
            let content = UNMutableNotificationContent()
            
            content.title = "Pay Attention 💰"
            content.body = textField.text ?? "empty body"
            content.badge = 7
            content.sound = UNNotificationSound(named: "sound.wav")
            
            if let url = Bundle.main.url(forResource: "video", withExtension: "mp4"),
                let att = try? UNNotificationAttachment(identifier: "mom", url: url, options: nil){
                
                content.attachments = [att]
                
            }
            
            let request = UNNotificationRequest(identifier: "my_request", content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request, withCompletionHandler: { (err) in
                print(err)
            })
            
            
            
            
        } else {
            // Fallback on earlier versions
            
            
            
            let note = UILocalNotification()
            note.alertTitle = "Pay Attention 💰"
            note.alertBody = textField.text
            note.fireDate = datePicker.date
            //note.soundName = UILocalNotificationDefaultSoundName
            note.soundName = "sound.wav"
            note.applicationIconBadgeNumber = 1
            note.category = "cat"
            note.userInfo = ["event_id":42]
            
            UIApplication.shared.scheduleLocalNotification(note)
        }
        
        
        
    }
    
    
}
























