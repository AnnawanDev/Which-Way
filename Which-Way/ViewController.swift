//
//  ViewController.swift
//  Which-Way
//
//  Created by Ed Wied on 9/10/20.
//  Copyright © 2020 Ed Wied. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func press_course(_ sender: Any) {
        print("COURSE")
        transition(goingTo: "courseID")
    }
    
    @IBAction func press_about(_ sender: Any) {
        print("ABOUT")
        transition(goingTo: "aboutID")
    }
    
    @IBAction func press_admin(_ sender: Any) {
        print("ADMIN")
        transition(goingTo: "adminID")
    }
    
    func transition(goingTo:String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyboard.instantiateViewController(identifier: goingTo)
        secondVC.modalPresentationStyle = .fullScreen
        secondVC.modalTransitionStyle = .crossDissolve
        show(secondVC, sender: self)
    }
}

