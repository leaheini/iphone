//
//  ViewController.swift
//  LocalNotificationProject
//
//  Created by hackeru on 30/08/2017.
//  Copyright © 2017 Hackeru.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // the timePicker will be on the closest min without sec
        var timestamp = Int(Date().timeIntervalSince1970)   //10:36:12    -> removed the mili sec
        timestamp -= timestamp % 60  //10:36:00    -> removed the sec
        timestamp += 60    //10:37:00
        
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
        datePicker.date = date
        datePicker.minimumDate = date
        
        requestPermissions()
    }

    func requestPermissions(){
        
        let app = UIApplication.shared
        
        let reminderAction = UIMutableUserNotificationAction()
        reminderAction.identifier = "reminder"
        reminderAction.title = "נודניק"
        reminderAction.activationMode = .background
        reminderAction.isAuthenticationRequired = false // no password needed
        
        let quickReplyAction = UIMutableUserNotificationAction()
        quickReplyAction.identifier = "quickReply"
        quickReplyAction.title = "השב"
        quickReplyAction.activationMode = .background
        quickReplyAction.isAuthenticationRequired = true    // only if password to whatsapp you can reply
        quickReplyAction.behavior = .textInput
        
        let category = UIMutableUserNotificationCategory()
        category.identifier = "cat"
        category.setActions([reminderAction, quickReplyAction], for: .default)
        
        let settings = UIUserNotificationSettings(types: [.sound, .alert, .badge], categories: [category])
        
        app.registerUserNotificationSettings(settings)
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        
        let note = UILocalNotification()
        note.alertTitle = "Pay attention 🎵🎶√"
        note.alertBody = textField.text
        note.fireDate = datePicker.date
        //note.soundName = UILocalNotificationDefaultSoundName
        note.soundName = "sound.mp3"
        note.applicationIconBadgeNumber = 1
        note.category = "cat"
        note.userInfo = ["event_id":42]
        
        
        UIApplication.shared.scheduleLocalNotification(note)
        
        
        
    }
    

}

