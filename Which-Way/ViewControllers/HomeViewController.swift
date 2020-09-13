//
//  ViewController.swift
//  Which-Way
//
//  Created by Ed Wied on 9/10/20.
//  Copyright © 2020 Ed Wied. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func press_course(_ sender: Any) {
        transition(goingTo: Destination.courseID.rawValue)     //go to "course" page
    }
    
    @IBAction func press_about(_ sender: Any) {
        transition(goingTo: Destination.aboutID.rawValue)      //go to "about" page
    }
    
    @IBAction func press_admin(_ sender: Any) {
        transition(goingTo: "adminLoginScreen")               //use login screen
        //transition(goingTo: Destination.addHoleID.rawValue)     //skip login screen
    }
}

