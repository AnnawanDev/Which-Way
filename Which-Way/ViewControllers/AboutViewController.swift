//
//  AboutViewController.swift
//  Which-Way
//
//  Created by Ed Wied on 9/10/20.
//  Copyright © 2020 Ed Wied. All rights reserved.
//

import UIKit

class AboutViewController: BaseViewController {
    
    @IBOutlet weak var aboutText: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        aboutText.text = "Some kind of about text\n\nBlah blah blah..."
    }

    @IBAction func press_home(_ sender: Any) {
        transition(goingTo: Destination.homeID.rawValue)
    }
    
}
