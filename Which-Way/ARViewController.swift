//
//  ARViewController.swift
//  Which-Way
//
//  Created by Ed Wied on 9/10/20.
//  Copyright © 2020 Ed Wied. All rights reserved.
//

import UIKit
import ARKit

class ARViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func press_home(_ sender: Any) {
        print("HOME")
        transition(goingTo: "homeID")
    }
    
    @IBAction func press_new_hole(_ sender: Any) {
        print("NEW HOLE")
        transition(goingTo: "courseID")
    }
    
    func transition(goingTo:String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyboard.instantiateViewController(identifier: goingTo)
        secondVC.modalPresentationStyle = .fullScreen
        secondVC.modalTransitionStyle = .crossDissolve
        show(secondVC, sender: self)
    }
}
