//
//  ViewController.swift
//  Map
//
//  Created by 엄승주 on 1/9/24.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet var myMap: MKMapView! // map
    @IBOutlet var lblInfo1: UILabel! // lbl 1
    @IBOutlet var lblInfo2: UILabel! // lbl 2
    
    // delegate set for use map
    let locationManager = CLLocationManager()
    
    //load
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //set label text
        lblInfo1.text = ""
        lblInfo2.text = ""
        
        //set locationManager
        locationManager.delegate = self
        
        // set accruacy of map
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        //request authorization of location to user
        locationManager.requestWhenInUseAuthorization()
        
        //start track location
        locationManager.startUpdatingLocation()
        
        //show location
        myMap.showsUserLocation = true
    }
    
    // move map to input location
    func goLocation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span :Double)->CLLocationCoordinate2D{
        // set location let, and span let
        let pLocation = CLLocationCoordinate2DMake(latitudeValue,longitudeValue)
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        
        // set area to show
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        
        // show area
        myMap.setRegion(pRegion, animated: true)
        
        //return pLocation
        return pLocation
    }
    
    // set pin
    func setAnnotation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span :Double, title strTitle: String, subtitle strSubtitle:String){
        // get annotation
        let annotation = MKPointAnnotation()
        
        // set annoation data
        annotation.coordinate = goLocation(latitudeValue: latitudeValue, longitudeValue: longitudeValue, delta: span)
        annotation.title = strTitle
        annotation.subtitle = strSubtitle
        
        // show annotation
        myMap.addAnnotation(annotation)
        
    }
    
    // use to control map
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let pLocation = locations.last
        
        // show that area with goLocation // ignore return
        _ = goLocation(latitudeValue: (pLocation?.coordinate.latitude)!, longitudeValue:  (pLocation?.coordinate.longitude)!, delta: 0.01)
        //                                              closure
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {
            (placemarks, error)-> Void in
            // 지도 표시
            let pm = placemarks!.first
            let country = pm!.country
            var address: String = country!
            
            // add localty and thoroughfare if exist
            if pm!.locality != nil {
                address += " "
                address += pm!.locality!
            }
            if pm!.thoroughfare != nil {
                address += " "
                address += pm!.thoroughfare!
            }
            
            // set lbl
            self.lblInfo1.text = "현재 위치"
            self.lblInfo2.text = address
            
        })
        
        locationManager.stopUpdatingLocation()
    }
    
    //sg
    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            // now location
            self.lblInfo1.text = ""
            self.lblInfo2.text = ""
            
            locationManager.startUpdatingLocation()
            
        }else if sender.selectedSegmentIndex == 1 {
            // skku natural science
            setAnnotation(latitudeValue: 37.294627, longitudeValue: 126.973743, delta: 0.01, title: "성균관대학교", subtitle: "자연과학 캠퍼스")
            self.lblInfo1.text = "보고 계신 위치"
            self.lblInfo2.text = "성균관대학교 자연과학 캠퍼스"
        }else if sender.selectedSegmentIndex == 2{
            // skku Humanities and Social Sciences
            setAnnotation(latitudeValue: 37.588376, longitudeValue: 126.993427, delta: 0.01, title: "성균관대학교", subtitle: "인문사회 캠퍼스")
            self.lblInfo1.text = "보고 계신 위치"
            self.lblInfo2.text = "성균관대학교 인문사회 캠퍼스"
        }
    }
    
    
}

