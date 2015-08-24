//
//  DashboardViewController.swift
//  ExpertTech
//
//  Created by Kewalin Sakawattananon on 8/14/2558 BE.
//  Copyright © 2558 IBM. All rights reserved.
//

import UIKit
import MapKit

class DashboardViewController: UIViewController,MKMapViewDelegate, UIPopoverControllerDelegate{
    @IBOutlet weak var vMapView: MKMapView!
    let regionRadius: CLLocationDistance = 1000
    var workOrderList = Constants.WorkOrderList.workOrderList
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.vMapView.delegate = self
        /*
        let workOrder1 = WorkOrder(woo_id: 0, woo_lat: "13.746203", woo_lng: "100.522836")
        workOrderList.append(workOrder1)
        let workOrder2 = WorkOrder(woo_id: 1, woo_lat: "13.752036", woo_lng: "100.521985")
        workOrderList.append(workOrder2)
        let workOrder3 = WorkOrder(woo_id: 2, woo_lat: "13.747647", woo_lng: "100.521483")
        workOrderList.append(workOrder3)
        */
        self.pointMapOnLocation()
        self.centerMapOnLocation()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - Pin and centerlize MapView
    func centerMapOnLocation(){
        /*
        print("\(Double(workOrderList[0].woo_latitude)!), \(Double(workOrderList[0].woo_longitude)!)")
        let initialLocation = CLLocation(latitude: Double(workOrderList[0].woo_latitude)!, longitude: Double(workOrderList[0].woo_longitude)!)
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(initialLocation.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        vMapView.setRegion(coordinateRegion, animated: false)
        */
        if vMapView.annotations.count == 0 {
            return
        }
        var topLeftCoord: CLLocationCoordinate2D = CLLocationCoordinate2D()
        topLeftCoord.latitude = -90
        topLeftCoord.longitude = 180
        var bottomRightCoord: CLLocationCoordinate2D = CLLocationCoordinate2D()
        bottomRightCoord.latitude = 90
        bottomRightCoord.longitude = -180
        for annotation: MKAnnotation in vMapView.annotations as [MKAnnotation]{
            topLeftCoord.longitude = fmin(topLeftCoord.longitude, annotation.coordinate.longitude)
            topLeftCoord.latitude = fmax(topLeftCoord.latitude, annotation.coordinate.latitude)
            bottomRightCoord.longitude = fmax(bottomRightCoord.longitude, annotation.coordinate.longitude)
            bottomRightCoord.latitude = fmin(bottomRightCoord.latitude, annotation.coordinate.latitude)
        }
        
        var region: MKCoordinateRegion = MKCoordinateRegion()
        region.center.latitude = topLeftCoord.latitude - (topLeftCoord.latitude - bottomRightCoord.latitude) * 0.5
        region.center.longitude = topLeftCoord.longitude + (bottomRightCoord.longitude - topLeftCoord.longitude) * 0.5
        region.span.latitudeDelta = fabs(topLeftCoord.latitude - bottomRightCoord.latitude) * 2
        region.span.longitudeDelta = fabs(bottomRightCoord.longitude - topLeftCoord.longitude) * 2
        region = vMapView.regionThatFits(region)
        vMapView.setRegion(region, animated: true)
        
        
    }
    func pointMapOnLocation(){
        
        var i:Int = 1
        for workOrder in workOrderList{
            let location = CLLocation(latitude: Double(workOrder.woo_latitude)!, longitude: Double(workOrder.woo_longitude)!)
            print("\(Double(workOrderList[i-1].woo_latitude)!), \(Double(workOrderList[i-1].woo_longitude)!)")
            let point:MKPointAnnotation = MKPointAnnotation()
            point.coordinate = location.coordinate
            point.title = String(i)
            point.subtitle = String(workOrder.woo_id)
            self.vMapView.addAnnotation(point)
            i++
        }

    }
    // MARK: - MapView delegate
    func mapView(mapView: MKMapView, didSelectAnnotationView view: MKAnnotationView) {
        mapView.deselectAnnotation(view.annotation, animated: true)
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("PopOverDetailMapTableViewController") as! PopOverDetailMapTableViewController
        let popover = UIPopoverController(contentViewController: controller)
        popover.delegate = self
        let title:String = (view.annotation?.title!!)!
        let subtitle:String = (view.annotation?.subtitle!!)!

        controller.indexNumber = Int(title)!
        controller.workOrderId = Int(subtitle)!
        popover.presentPopoverFromRect(view.frame, inView: view.superview!, permittedArrowDirections: UIPopoverArrowDirection.Any, animated: true)

    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = PinAnnotationView(annotation: annotation, reuseIdentifier: "pin")
        return annotationView
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
