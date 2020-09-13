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
        aboutText.text = """
        Which Way? is an app made as part of the OSU Hackathon project, Sept 10-13th.
        
        OSU Hackathon Slack: http://osu-hackathon.slack.com

        Hacathon page on DevPost: https://beaverhacks-fall-2020.devpost.com/
        
        This app addresses the issue of not being able to find the golf flag (or pin) while on a course. Sometimes there are hills, trees, or other obstacls that block view of exactly where the pin is located. This helps the golfer orient toward the flag.  The app makes use of Core Location to get the location of the user and the destination and then ARKit to serve visual markers on where the golfer should orient.

        This app was made by Ed Wied, a fair amount of coffee, and his trusty orange cat Starbuck

        """
    }

    @IBAction func press_home(_ sender: Any) {
        transition(goingTo: Destination.homeID.rawValue)     //go to "home" page
    }
    
}
