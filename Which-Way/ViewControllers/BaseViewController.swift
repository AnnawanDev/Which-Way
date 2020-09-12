//
//  BaseViewController.swift
//  Which-Way
//
//  Created by Ed Wied on 9/12/20.
//  Copyright © 2020 Ed Wied. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func transition(goingTo:String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationViewControl = storyboard.instantiateViewController(identifier: goingTo)
        destinationViewControl.modalPresentationStyle = .fullScreen
        destinationViewControl.modalTransitionStyle = .coverVertical
        show(destinationViewControl, sender: self)
    }
}
