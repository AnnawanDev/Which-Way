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
        transition(goingTo: Destination.courseID.rawValue)
    }
    
    @IBAction func press_about(_ sender: Any) {
        transition(goingTo: Destination.aboutID.rawValue)
    }
    
    @IBAction func press_admin(_ sender: Any) {
        //transition(goingTo: "adminLoginScreen")
        transition(goingTo: Destination.addHoleID.rawValue)
    }
}

