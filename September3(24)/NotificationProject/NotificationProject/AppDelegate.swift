//
//  AppDelegate.swift
//  NotificationProject
//
//  Created by Benny Davidovitz on 30/08/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import AVFoundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    
    //MARK: - Remote Notificaiton Support
    
    func application(_ application: UIApplication, didRegister notificationSettings: UIUserNotificationSettings) {
        
        //request device token
        application.registerForRemoteNotifications()
        
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
        print(deviceToken as NSData)
        //send deviveToken to server
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        
        print(error)
        
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
        print(userInfo)
    }
    
    func application(_ application: UIApplication, handleActionWithIdentifier identifier: String?, forRemoteNotification userInfo: [AnyHashable : Any], withResponseInfo responseInfo: [AnyHashable : Any], completionHandler: @escaping () -> Void) {
        
        
        if identifier == "reminder"{
            //handle reminder action
        } else if identifier == "quickReply"{
            //handle quick reply
        }
        
        //callback to apple
        completionHandler()
    }
    
    //MARK: -
    
    
    
    
    

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        
        application.applicationIconBadgeNumber = 0
    }
    
    var player : AVAudioPlayer?

    func application(_ application: UIApplication, didReceive notification: UILocalNotification) {
        
        if application.applicationState == .active{
            //notification received while user is in the app, the developer should implement the behavior in this scenario
            let alert = UIAlertController(title: notification.alertTitle, message: notification.alertBody, preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            
            window?.rootViewController?.present(alert, animated: true, completion: nil)
            
            if let url = Bundle.main.url(forResource: "sound", withExtension: "wav"){
                player = try? AVAudioPlayer(contentsOf: url)
                player?.play()
            }
        }
        
        if let eventId = notification.userInfo?["event_id"] as? Int{
            print("show data for event id \(eventId)")
        }
    }
    
    
    func application(_ application: UIApplication, handleActionWithIdentifier identifier: String?, for notification: UILocalNotification, completionHandler: @escaping () -> Void) {
        
        application.applicationIconBadgeNumber = 0
        
        if identifier == "reminder"{
            
            notification.fireDate = Date(timeIntervalSinceNow: 7)
            application.scheduleLocalNotification(notification)
        }
        
        completionHandler()
    }
    
    func application(_ application: UIApplication, handleActionWithIdentifier identifier: String?, for notification: UILocalNotification, withResponseInfo responseInfo: [AnyHashable : Any], completionHandler: @escaping () -> Void) {
        
        application.applicationIconBadgeNumber = 0
        
        if identifier == "quickReply"{
            let text = responseInfo[UIUserNotificationActionResponseTypedTextKey] as? String ?? ""
            print("user typed " + text)
        }
        
        if identifier == "reminder"{
            
            notification.fireDate = Date(timeIntervalSinceNow: 7)
            application.scheduleLocalNotification(notification)
        }
        
        completionHandler()
        
    }
    
}


















