//
//  DetailWorkOrderTableViewController.swift
//  ExpertTech
//
//  Created by Kewalin Sakawattananon on 7/31/2558 BE.
//  Copyright © 2558 IBM. All rights reserved.
//

import UIKit
import MapKit

class DetailWorkOrderTableViewController: UITableViewController, MKMapViewDelegate {

    @IBOutlet weak var vCustomerDetailTxtView: UITextView!
    @IBOutlet weak var vRequestDetailTxtView: UITextView!
    @IBOutlet weak var vMapView: MKMapView!
    let regionRadius: CLLocationDistance = 1000
    var indexNumber:Int = 0
    var workOrderId:Int = 0
    var workOrderList = Constants.WorkOrderList.workOrderList
    override func viewDidLoad() {
        super.viewDidLoad()
        self.vMapView.delegate = self
    }
    
    override func viewDidAppear(animated: Bool) {
        self.centerAndPointOnLocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = PinAnnotationView(annotation: annotation, reuseIdentifier: "pin")
        return annotationView
    }
    
    func centerAndPointOnLocation(){
        let location = CLLocation(latitude: Double(workOrderList[indexNumber].woo_latitude)!, longitude: Double(workOrderList[indexNumber].woo_longitude)!)
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        vMapView.setRegion(coordinateRegion, animated: false)
        let point:MKPointAnnotation = MKPointAnnotation()
        point.coordinate = location.coordinate
        point.title = String(indexNumber+1)
        point.subtitle = String(workOrderId)
        self.vMapView.addAnnotation(point)
    }


}
