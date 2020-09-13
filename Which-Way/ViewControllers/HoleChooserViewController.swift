//
//  ViewController.swift
//  Which-Way
//
//  Created by Ed Wied on 9/13/20.
//  Copyright © 2020 Ed Wied. All rights reserved.
//

import UIKit

class HoleChooserViewController: BaseViewController, UIPickerViewDelegate {

    //outlets
    @IBOutlet weak var holePicker: UIPickerView!
    
    //instance variables
    var holes:Holes!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initialize hole data
        holes = Holes.holeDS
        
        //set up picker
        self.holePicker.delegate = self
        self.holePicker.dataSource = holes
        
    }

    //navigation
    @IBAction func press_home(_ sender: Any) {
        transition(goingTo: Destination.homeID.rawValue)     //go to "home" page
    }
    
    @IBAction func press_ar(_ sender: Any) {
        holes.currentHole = self.holePicker.selectedRow(inComponent: 0) + 1   //adding 1 because holes are not 0-based
        transition(goingTo: Destination.arID.rawValue)        //go to "holes AR" page
    }
    
    @IBAction func press_goBack(_ sender: Any) {
        transition(goingTo: Destination.courseID.rawValue)   //go back to "courses" page
    }
    
    // delegate methods
    func pickerView(_: UIPickerView, didSelectRow: Int, inComponent: Int) {
        //holes.currentHole = didSelectRow + 1
        print("Chose hole # \(holes.currentHole)")
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return holes.holeChoices[row]
    }
    
}

