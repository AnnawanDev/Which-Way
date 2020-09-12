//
//  ChooseCourseViewController.swift
//  Which-Way
//
//  Created by Ed Wied on 9/10/20.
//  Copyright © 2020 Ed Wied. All rights reserved.
//

import UIKit

class ChooseCourseViewController: BaseViewController, UIPickerViewDelegate {
    
    //outlets
    @IBOutlet weak var coursePicker: UIPickerView!
    
    //instance variables
    var courses:GolfCourses!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set up picker
        courses = GolfCourses.golfCoursesDS
        
        //set up picker
        coursePicker.delegate = self
        self.coursePicker.dataSource = self.courses
    }

    //navigation
    @IBAction func press_home(_ sender: Any) {
        transition(goingTo: Destination.homeID.rawValue)
    }
    
    @IBAction func press_ar(_ sender: Any) {
        transition(goingTo: Destination.arID.rawValue)
    }
    
    // delegate methods
    func pickerView(_: UIPickerView, didSelectRow: Int, inComponent: Int) {
        print(courses.courseChoices[didSelectRow])
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return courses.courseChoices[row]
    }
}
