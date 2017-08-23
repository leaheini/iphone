//
//  AppManager.swift
//  LocationProject
//
//  Created by hackeru on 23/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit
import CoreLocation

class AppManager: NSObject {

        static let shared = AppManager()
    
        let locationManager : CLLocationManager
    
    override init() {
        
        locationManager = CLLocationManager()
        
        super.init()
        
        locationManager.activityType = .automotiveNavigation   // navigate at car
        locationManager.distanceFilter = 50 //meter  // notify the user after 50 m   //kCLDistanceFilterNone - notify after every change
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager.delegate = self
    }
    
    func startLocation(){
        let authStatus = CLLocationManager.authorizationStatus()  // get the aprove of the user to get his location
        switch authStatus {
        case .restricted:   //old iphone without location
            return
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
        case .notDetermined:
            //also background
            //locationManager.requestAlwaysAuthorization()
            //or
            //just foreground - only when the app is open
            locationManager.requestWhenInUseAuthorization()
        case .denied:
            //show alert to go to settings to approve location
            let alert = UIAlertController(title: "Error", message: "Please authorize location services", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Nope", style: .cancel, handler: nil))
            
            func handler(_ action : UIAlertAction){   // func to open the settings
                guard let url = URL(string: UIApplicationOpenSettingsURLString) else {
                    return
                }
                
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
            
            alert.addAction(UIAlertAction(title: "Settings", style: .destructive, handler: handler))
            
            let rootVC = UIApplication.shared.delegate?.window??.rootViewController   //cause this is class and not VC
            rootVC?.present(alert, animated: true, completion: nil)
        }
    }
    
}

extension AppManager : CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations[0])
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        self.startLocation()
    }
    
    
}




