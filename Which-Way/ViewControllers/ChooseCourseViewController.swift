//
//  ChooseCourseViewController.swift
//  Which-Way
//
//  Created by Ed Wied on 9/10/20.
//  Copyright © 2020 Ed Wied. All rights reserved.
//

import UIKit

class ChooseCourseViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func press_home(_ sender: Any) {
        transition(goingTo: Destination.homeID.rawValue)
    }
    
    @IBAction func press_ar(_ sender: Any) {
        transition(goingTo: Destination.arID.rawValue)
    }
}
