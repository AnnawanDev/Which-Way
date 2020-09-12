//
//  AddHoleViewController.swift
//  Which-Way
//
//  Created by Ed Wied on 9/10/20.
//  Copyright © 2020 Ed Wied. All rights reserved.
//

import UIKit
import CoreLocation

class AddHoleViewController: BaseViewController, CLLocationManagerDelegate, UIPickerViewDelegate {

    //outlets
    @IBOutlet weak var currentlatitudePosition: UILabel!
    @IBOutlet weak var currentlongitudePosition: UILabel!
    @IBOutlet weak var savedlatitudePosition: UILabel!
    @IBOutlet weak var savedlongitudePosition: UILabel!
    @IBOutlet weak var holePicker: UIPickerView!
    @IBOutlet weak var saveConfirmation: UILabel!
    
    //instance variables
    var locationManager: CLLocationManager!
    var holes:Holes!
    
    //buttons
    @IBAction func press_home(_ sender: Any) {
        transition(goingTo: Destination.homeID.rawValue)
    }
    
    //TODO - currently saving data to singleton - replace by saving to disk or some kind of coredata solution
    @IBAction func update_hole_GPS(_ sender: Any) {
        //todo - safely unwrap value
        let currentlySelectedHoleIndex:Int = 0// Int(holes.holeChoices[holePicker.selectedRow(inComponent: 0)])!
        
        //todo - get from CoreData rather than text
        //todo - safely unwrap values
        holes.holeGPSLocations[currentlySelectedHoleIndex].long =  Double(currentlongitudePosition.text!)!
        holes.holeGPSLocations[currentlySelectedHoleIndex].lat =  Double(currentlatitudePosition.text!)!
        
        //provide save confirmation
        saveConfirmation.text = "SAVED"
        
        //TODO - error handling?
        
        //update "saved position" labels
        savedlatitudePosition.text = currentlatitudePosition.text
        savedlongitudePosition.text = currentlongitudePosition.text
    }
    
    //overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //initialize text
        currentlatitudePosition.text = ""
        currentlongitudePosition.text = ""
        savedlatitudePosition.text = ""
        savedlongitudePosition.text = ""
        saveConfirmation.text = ""
        
        // initialize hole data
        holes = Holes.holeDS
        
        //set up picker
        self.holePicker.delegate = self
        self.holePicker.dataSource = holes
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //update view with every visit
        determineUserLocation()
        
        //get initial saved position for hole 1
        savedlatitudePosition.text = String(holes.holeGPSLocations[0].lat)
        savedlongitudePosition.text = String(holes.holeGPSLocations[0].long)
    }
    
    // delegate methods
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userCurrentLocation:CLLocation = locations[0] as CLLocation
        currentlatitudePosition.text = String(userCurrentLocation.coordinate.latitude)
        currentlongitudePosition.text = String(userCurrentLocation.coordinate.longitude)
    }
    
    func pickerView(_: UIPickerView, didSelectRow: Int, inComponent: Int) {
        //setHoleText.text = "Set GPS for: " + holes.holeChoices[didSelectRow]
        savedlatitudePosition.text = String(holes.holeGPSLocations[didSelectRow].lat)
        savedlongitudePosition.text = String(holes.holeGPSLocations[didSelectRow].long)
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return holes.holeChoices[row]
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
    
}
