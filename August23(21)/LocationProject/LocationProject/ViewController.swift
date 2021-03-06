//
//  ViewController.swift
//  LocationProject
//
//  Created by hackeru on 23/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKAnnotationView {

    @IBOutlet var addreesLabel: UILabel!
    
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        mapView.addAnnotations(Branch.allBranches)
        
        //the oldest version
        //NotificationCenter.default.addObserver(self, selector: #selector(handleNotification(_:)), name: .locationUpdate, object: nil)
        
        //the new code to operate on he main thread
        NotificationCenter.default.addObserver(forName: .locationUpdate, object: nil, queue: OperationQueue.main) { (note : Notification) in
            
            //what to do when notification received - get the location and switch it to address
            guard let location = AppManager.shared.userLocation else{
                return
            }
            
            let geoCoder = CLGeocoder()
            geoCoder.reverseGeocodeLocation(location, completionHandler: { (arr : [CLPlacemark]?, err : Error?) in
                guard let p = arr?.first else{
                    self.addreesLabel.text = err?.localizedDescription
                    return
                }
              
                let lines = p.addressDictionary?["FormattedAddressLines"] as? [String] ?? []
                
                self.addreesLabel.text = lines.joined(separator: ", ")
                
            })
            
        }
    }

    /*
    // in order to run on main thread in the past the code was
    func handleNotification(_ note : Notification){
        guard Thread.inMainThread else {
            DispatchQueue.main.async {
                self.handleNotification(note)
            }
            return
        }
    }*/
    
    func mapView(_ mapView : MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation is MKUserLocation{
            return nil
        }
        
        var annView = mapView.dequeueReusableAnnotationView(withIdentifier: "ann") as? MKPinAnnotationView
        if annView == nil{
            //no recycle, create new
            annView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "ann")
            
            annView?.pinTintColor = .purple
            annView?.animatesDrop = true
            
            annView?.canShowCallout = true
            
            let button = UIButton(type: .infoDark)
            annView?.rightCalloutAccessoryView = button
        } else {
            //reusing old one, refresh its data
            annView?.annotation = annotation
        }
        
        return annView
    }
    
    func mapView(callout...)

}

