//
//  Branch.swift
//  LocationProject
//
//  Created by Benny Davidovitz on 27/08/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class Branch: NSObject{
    
    static var allBranches : [Branch]{
        get{
            return [
                Branch(name: "Air Port", latitude: 32.0055365, longitude: 34.8832225),
                Branch(name: "Kochav Yair", latitude: 32.2201686, longitude: 34.9775569),
                Branch(name: "Azrieli", latitude: 32.0756945, longitude: 34.7894783),
                Branch(name: "Nahariya", latitude: 33.0155599, longitude: 35.066733),
                Branch(name: "Dolphin Reef", latitude: 29.5257831, longitude: 34.9260207),
                Branch(name: "Damrak St.", latitude: 52.3751858, longitude: 4.8936877),
                Branch(name: "Statue of Liberty", latitude: 40.6892534, longitude: -74.0466891)
            ]
        }
    }
    
    
    let name : String
    let location : CLLocation
    
    init(name : String, latitude : CLLocationDegrees, longitude : CLLocationDegrees) {
        self.name = name
        self.location = CLLocation(latitude: latitude, longitude: longitude)
        
        super.init()
    }
}

extension Branch : MKAnnotation{
    var coordinate: CLLocationCoordinate2D{
        get{
            return self.location.coordinate
        }
    }
    
    var title: String?{
//        get{
            return self.name
//        }
    }
    
}

extension Branch{
    var distance : CLLocationDistance?{
        guard let userLocation = AppManager.shared.userLocation else {
            return nil
        }
        
        return self.location.distance(from: userLocation)
    }
}
























