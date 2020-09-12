//
//  ARViewController.swift
//  Which-Way
//
//  Created by Ed Wied on 9/10/20.
//  Copyright © 2020 Ed Wied. All rights reserved.
//

import UIKit
import ARKit
import CoreLocation


class ARViewController: BaseViewController, CLLocationManagerDelegate {
    
    //outlets
    @IBOutlet weak var distanceAwayInYards: UILabel!
    @IBOutlet weak var sceneView: ARSCNView!
    
    //instance variables
    var locationManager: CLLocationManager!
    var userCurrentLongitude: Double = 0.0
    var userCurrentLatitude: Double = 0.0
    var holes:Holes!
    let configruation = ARWorldTrackingConfiguration()
    
    //overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initialize hole data
        holes = Holes.holeDS
        
        //add AR debug options
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        
        // as soon as scene view, need to mnake sure scene view has configuration
        self.sceneView.session.run(configruation)
        
        //make sure distance label is on top
        self.distanceAwayInYards.layer.zPosition = 100

    }
    
    override func viewDidAppear(_ animated: Bool) {
        determineUserLocation()
    }

    //buttons
    @IBAction func press_home(_ sender: Any) {
        transition(goingTo: Destination.homeID.rawValue)
    }
    
    @IBAction func press_new_hole(_ sender: Any) {
        transition(goingTo: Destination.courseID.rawValue)
    }
    
    // delegate methods
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userCurrentLocation:CLLocation = locations[0] as CLLocation
        userCurrentLatitude = userCurrentLocation.coordinate.latitude
        userCurrentLongitude = userCurrentLocation.coordinate.longitude
        getDistance()
    }
    
    //helper functions
    func determineUserLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if !CLLocationManager.locationServicesEnabled() {
            print("You must enabled location services")
        } else {
            locationManager.startUpdatingLocation()
        }
    }
    
    func getDistance() {
        //https://developer.apple.com/documentation/corelocation/cllocation/1423689-distance
        //distance(from:)
        //Returns the distance (measured in meters) from the current object's location to the specified location.
        //func distance(from location: CLLocation) -> CLLocationDistance
        
        let holeLocation = CLLocation(latitude:holes.holeGPSLocations[0].lat, longitude: holes.holeGPSLocations[0].long)
        let secondLocation = CLLocation(latitude: userCurrentLatitude, longitude: userCurrentLongitude)
        let distance = holeLocation.distance(from: secondLocation) //distance in meters
        let distanceInYards = distance * 1.0936
        let doubleFormat = ".1"
        print("user latitude: \(userCurrentLatitude)")
        print("user longitude:  \(userCurrentLongitude)")
        print(" \(String(format:"%.02f", distanceInYards)) yards ")
        print("-----------------------------")
        distanceAwayInYards.text = "Distance to pin: \(distanceInYards.format(f: doubleFormat))"
    }
}

//extension method used from https://stackoverflow.com/questions/24051314/precision-string-format-specifier-in-swift
extension Double {
    func format(f: String) -> String {
        return String(format: "%\(f)f", self)
    }
}
