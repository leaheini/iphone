//
//  ViewController.swift
//  LocationProject
//
//  Created by Benny Davidovitz on 23/08/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController , MKMapViewDelegate{

    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        mapView.addAnnotations(Branch.allBranches)
        
        //NotificationCenter.default.addObserver(self, selector: #selector(handleNotification(_:)), name: .locationUpdate, object: nil)
        
        NotificationCenter.default.addObserver(forName: .locationUpdate, object: nil, queue: OperationQueue.main) { (note : Notification) in
            
            //what to do when notificatino received
            guard let location = AppManager.shared.userLocation else{
                return
            }
            
            let geoCoder = CLGeocoder()
            geoCoder.reverseGeocodeLocation(location, completionHandler: { (arr : [CLPlacemark]?, err : Error?) in
                
                guard let p = arr?.first else{
                    self.addressLabel.text = err?.localizedDescription
                    return
                }
                
                let lines = p.addressDictionary?["FormattedAddressLines"] as? [String] ?? []
                
                self.addressLabel.text = lines.joined(separator: ", ")
                
                
                
                
            })
        }
    }

    /*
    func handleNotification(_ note : Notification){
        guard Thread.isMainThread else{
            DispatchQueue.main.async {
                self.handleNotification(note)
            }
            return
        }
    }*/

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
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
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        guard let branch = view.annotation as? Branch else{
            return
        }
        
        guard let detailsVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController else{
            return
        }
        
        detailsVC.branch = branch
        
        navigationController?.show(detailsVC, sender: nil)
        
        
    }

}
















