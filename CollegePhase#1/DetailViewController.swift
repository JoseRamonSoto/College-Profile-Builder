//
//  ViewController.swift
//  College Profile Builder
//
//  Created by Jose Ramon Soto on 1/20/16.
//  Copyright © 2016 Jose Ramon Soto. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController
{
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myNameTextField: UITextField!
    @IBOutlet weak var myLocationTextField: UITextField!
    @IBOutlet weak var myNumberOfStudentsTextField: UITextField!
    var college: College!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myImage.image = college.image
        myNameTextField.text = college.name
        myLocationTextField.text = college.location
        myNumberOfStudentsTextField.text = String(college.numberOfStudents)
    }

    @IBAction func mySaveTapped(sender: AnyObject) {
        college.numberOfStudents = Int(myNumberOfStudentsTextField.text!)!
        college.name = myNameTextField.text!
        college.location = myLocationTextField.text!
        college.image = myImage.image!
        
    }

    

}
