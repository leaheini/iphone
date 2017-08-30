//
//  AppDelegate.swift
//  LocalNotificationProject
//
//  Created by hackeru on 30/08/2017.
//  Copyright © 2017 Hackeru.com. All rights reserved.
//

import UIKit
import AVFoundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var player : AVAudioPlayer?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        
        application.applicationIconBadgeNumber = 0  
    }
    
    func application(_ application: UIApplication, didReceive notification: UILocalNotification) {

        // notification received while user is in the app, the developer should implement the behavior in this scenario
        if application.applicationState == .active{
            let alert = UIAlertController(title: notification.alertTitle, message: notification.alertBody, preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            
            window?.rootViewController?.present(alert, animated: true, completion: nil)
            
            if let url = Bundle.main.url(forResource: "sound", withExtension: "mp3"){
                player = try? AVAudioPlayer(contentsOf: url)
                player?.play()
            }
        }
        
        if let eventId = notification.userInfo?["event_id"] as? Int{
            print("show data for event id \(eventId)")
        }
    }
    
/*   //// איחדנו אותם יחד במתודה הבאה
    func application(_ application: UIApplication, handleActionWithIdentifier identifier: String?, for notification: UILocalNotification, completionHandler: @escaping () -> Void) {
        
        application.applicationIconBadgeNumber = 0
        
        if identifier == "reminder"{
            notification.fireDate = Date(timeIntervalSinceNow: 5)  // 5 sec since now
            application.scheduleLocalNotification(notification)
        }
        
        completionHandler()
    }
 */
    
    func application(_ application: UIApplication, handleActionWithIdentifier identifier: String?, for notification: UILocalNotification, withResponseInfo responseInfo: [AnyHashable : Any], completionHandler: @escaping () -> Void) {
        
        application.applicationIconBadgeNumber = 0
        
        if identifier == "reminder"{
            notification.fireDate = Date(timeIntervalSinceNow: 5)  // 5 sec since now
            application.scheduleLocalNotification(notification)
        }

        if identifier == "quickReply"{
            let text = responseInfo[UIUserNotificationActionResponseTypedTextKey] as? String ?? ""
            print("user typed " + text)
        }
        
        completionHandler()
    }
   
}

