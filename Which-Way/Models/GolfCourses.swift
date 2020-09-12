//
//  GolfCourses.swift
//  Which-Way
//
//  Created by Ed Wied on 9/12/20.
//  Copyright © 2020 Ed Wied. All rights reserved.
//

import UIKit

class GolfCourses: NSObject, UIPickerViewDataSource {
    
    static let golfCoursesDS = GolfCourses()
    
    //names for each of the holes
    var courseChoices: [String] = ["Sugar Maple", "Geneseo Country Club", "Kewanee Sand Dunes"]
    
    //implementing UIPickerViewDataSource required delegate method
    func numberOfComponents(in: UIPickerView) -> Int {
        return 1
    }
    
    //implementing UIPickerViewDataSource required delegate method
    func pickerView(_: UIPickerView, numberOfRowsInComponent: Int) -> Int {
        return courseChoices.count
    }
}
