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

class ARViewController: BaseViewController, CLLocationManagerDelegate, ARSCNViewDelegate {
    
    //outlets
    @IBOutlet weak var distanceAwayInYards: UILabel!
    @IBOutlet weak var sceneView: ARSCNView!
    @IBOutlet weak var newHoleButton: UIButton!
    @IBOutlet weak var goHomeButton: UIButton!
    
    //instance variables
    var locationManager: CLLocationManager!
    var userCurrentLongitude: Double = 0.0
    var userCurrentLatitude: Double = 0.0
    var holes:Holes!
    let configruation = ARWorldTrackingConfiguration()
    var userCurrentLocation:CLLocation!
    //var holeChosen: Int!
    
    //overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initialize hole data
        holes = Holes.holeDS
        //holeChosen = holes.currentHole
        
        //add AR debug options
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        
        // as soon as scene view, need to mnake sure scene view has configuration
        self.sceneView.session.run(configruation)
        
        //set sceneview delegate to self
        self.sceneView.delegate = self
        
        //place buttons and labels on top of ARScene
        self.distanceAwayInYards.layer.zPosition = 100
        self.newHoleButton.layer.zPosition = 99
        self.goHomeButton.layer.zPosition = 98
        
        //confirm hole chosen
        print("Chose hole # \(Int(holes.currentHole))")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        determineUserLocation()
    }

    //buttons
    @IBAction func press_home(_ sender: Any) {
        transition(goingTo: Destination.homeID.rawValue)
    }
    
    @IBAction func press_new_hole(_ sender: Any) {
        transition(goingTo: Destination.userHolePicker.rawValue)
    }
    
    // delegate methods
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //let userCurrentLocation:CLLocation = locations[0] as CLLocation
        userCurrentLocation = locations[0] as CLLocation
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
            print("You must enable location services")
        } else {
            locationManager.startUpdatingLocation()
        }
    }
    
    func getDistance() {
        let holeLocation = CLLocation(latitude:holes.holeGPSLocations[holes.currentHole-1].lat, longitude: holes.holeGPSLocations[holes.currentHole-1].long)
        let userLocation = CLLocation(latitude: userCurrentLatitude, longitude: userCurrentLongitude)
        let distance = holeLocation.distance(from: userLocation) //distance in meters
        let distanceInYards = distance * 1.0936
        let doubleFormat = ".1"
        distanceAwayInYards.text = "Distance to pin: \(distanceInYards.format(f: doubleFormat))"
        
        // TODO: get bearing

    }
}

//extension method used from https://stackoverflow.com/questions/24051314/precision-string-format-specifier-in-swift
extension Double {
    func format(f: String) -> String {
        return String(format: "%\(f)f", self)
    }
    
    func toRadians() -> Double {
        return self * .pi / 180.0
    }
    
    func toDegrees() -> Double {
        return self * 180.0 / .pi
    }
}
