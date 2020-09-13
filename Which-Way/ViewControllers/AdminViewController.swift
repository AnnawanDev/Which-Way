//
//  AdminViewController.swift
//  Which-Way
//
//  Created by Ed Wied on 9/10/20.
//  Copyright © 2020 Ed Wied. All rights reserved.
//

import UIKit

class AdminViewController: BaseViewController {
    
    @IBOutlet weak var loginFeedback: UILabel!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    //todo: implement real authentication
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loginFeedback.text = ""
        username.text = ""
        password.text = ""
        
    }

    @IBAction func press_home(_ sender: Any) {
        transition(goingTo: Destination.homeID.rawValue)   //go to "home" page
    }
    
    @IBAction func login(_ sender: Any) {
        if username.text == "admin" && password.text == "admin" {
            transition(goingTo: Destination.addHoleID.rawValue)
        } else {
            loginFeedback.text = "Sorry, wrong username and/or password"
        }
        
    }
    
}
