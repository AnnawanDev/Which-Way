//
//  AdminViewController.swift
//  Which-Way
//
//  Created by Ed Wied on 9/10/20.
//  Copyright © 2020 Ed Wied. All rights reserved.
//

import UIKit

class AdminViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func press_home(_ sender: Any) {
        print("HOME")
        transition(goingTo: "homeID")
    }
    
    @IBAction func login(_ sender: Any) {
        print("loging in")
        transition(goingTo: "addHoleID")
    }
    
    func transition(goingTo:String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyboard.instantiateViewController(identifier: goingTo)
        secondVC.modalPresentationStyle = .fullScreen
        secondVC.modalTransitionStyle = .crossDissolve
        show(secondVC, sender: self)
    }
}
