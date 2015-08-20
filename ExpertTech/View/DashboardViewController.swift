//
//  DashboardViewController.swift
//  ExpertTech
//
//  Created by Kewalin Sakawattananon on 8/14/2558 BE.
//  Copyright © 2558 IBM. All rights reserved.
//

import UIKit
import MapKit

class DashboardViewController: UIViewController,MKMapViewDelegate, UIPopoverControllerDelegate {
    @IBOutlet weak var vMapView: MKMapView!
    let regionRadius: CLLocationDistance = 1000
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.vMapView.delegate = self
        
        let initialLocation = CLLocation(latitude: 13.781116, longitude: 100.545497)
        self.centerMapOnLocation(initialLocation)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        vMapView.setRegion(coordinateRegion, animated: true)
        let point:MKPointAnnotation = MKPointAnnotation()
        point.coordinate = location.coordinate
        point.title = "1"
        self.vMapView.addAnnotation(point)
    }
    
    func mapView(mapView: MKMapView, didSelectAnnotationView view: MKAnnotationView) {
        mapView.deselectAnnotation(view.annotation, animated: true)
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("PopOverDetailMapTableViewController") as! UITableViewController
        let popover = UIPopoverController(contentViewController: controller)
        popover.delegate = self
        popover.presentPopoverFromRect(view.frame, inView: view.superview!, permittedArrowDirections: UIPopoverArrowDirection.Any, animated: true)
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = PinAnnotationView(annotation: annotation, reuseIdentifier: "pin")
        return annotationView
    }
        /*
   func mapView(mapView: MKMapView, didUpdateUserLocation userLocation: MKUserLocation) {
        let region:MKCoordinateRegion = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 2000, 2000);
        self.vMapView.setRegion(self.vMapView.regionThatFits(region), animated: true)
        // Add annotation
        let point:MKPointAnnotation = MKPointAnnotation()
        point.coordinate = userLocation.coordinate
        point.title = "Where am I?"
        point.subtitle = "I'm here"
        self.vMapView.addAnnotation(point)
    }
    */
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
