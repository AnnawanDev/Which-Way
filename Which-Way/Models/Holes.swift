//
//  Holes.swift
//  Which-Way
//
//  Created by Ed Wied on 9/12/20.
//  Copyright © 2020 Ed Wied. All rights reserved.
//

import UIKit

class Holes: NSObject, UIPickerViewDataSource {
    
    static let holeDS = Holes()
    
    //names for each of the holes
    var holeChoices: [String] = ["Hole 1", "Hole 2", "Hole 3", "Hole 4", "Hole 5", "Hole 6", "Hole 7", "Hole 8", "Hole 9", "Hole 10", "Hole 11", "Hole 12", "Hole 13", "Hole 14", "Hole 15", "Hole 16", "Hole 17", "Hole 18"]
    
    //set initial GPS coordinates of holes to GPS
    var holeGPSLocations:[(long:Double, lat:Double)] = [(0.0, 0.0), (0.0, 0.0), (0.0, 0.0), (0.0, 0.0), (0.0, 0.0), (0.0, 0.0), (0.0, 0.0), (0.0, 0.0), (0.0, 0.0), (0.0, 0.0), (0.0, 0.0), (0.0, 0.0), (0.0, 0.0), (0.0, 0.0), (0.0, 0.0), (0.0, 0.0), (0.0, 0.0), (0.0, 0.0)]
    
    //implementing UIPickerViewDataSource required delegate method
    func numberOfComponents(in: UIPickerView) -> Int {
        return 1
    }
    
    //implementing UIPickerViewDataSource required delegate method
    func pickerView(_: UIPickerView, numberOfRowsInComponent: Int) -> Int {
        return holeChoices.count
    }
}
