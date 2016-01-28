//
//  ViewController.swift
//  College Profile Builder
//
//  Created by Jose Ramon Soto on 1/20/16.
//  Copyright © 2016 Jose Ramon Soto. All rights reserved.
//

import UIKit

class College: NSObject
{
    var name = ""
    var location = ""
    var numberOfStudents = 0
    var image = UIImage(named: "InsertPictureHere")
    
    init(Name: String, Location: String, NumberOfStudents: Int, Image: UIImage)
    {
        super.init()
        name = Name
        location = Location
        numberOfStudents = NumberOfStudents
        image = Image
    }
    init(Name: String, Location: String, NumberOfStudents: Int)
    {
        super.init()
        name = Name
        location = Location
        numberOfStudents = NumberOfStudents
    }
}
