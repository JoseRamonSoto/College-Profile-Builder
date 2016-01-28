//
//  ViewController.swift
//  College Profile Builder
//
//  Created by Jose Ramon Soto on 1/20/16.
//  Copyright © 2016 Jose Ramon Soto. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var myTableView: UITableView!
    var colleges: [College] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
myTableView.dataSource = self
myTableView.delegate = self
        colleges.append(College(Name: "Hartpury College", Location: "Gloucestershire, England", NumberOfStudents: 3300, Image: UIImage(named: "hartpury")!))
        colleges.append(College(Name: "College of West Anglia", Location: "Cambridgeshire, England", NumberOfStudents: 10000, Image:UIImage(named: "Cambridgeshirecollege")!))
        colleges.append(College(Name: "Skidmore College", Location: "Saratoga Springs, New York", NumberOfStudents: 2646, Image:UIImage(named: "Skidmore_College")!))
        colleges.append(College(Name: "University Of Kentucky", Location: "Lexington, Kentucky", NumberOfStudents: 29385, Image:UIImage(named: "UniversityofKentuckyLogo")!))
    
        
    }
    @IBAction func myEditTapped(sender: AnyObject) {
        myTableView.editing = !myTableView.editing
    }
    @IBAction func myAddTapped(sender: AnyObject) {
        let myAlert = UIAlertController(title: "Add College", message: nil, preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        myAlert.addAction(cancelAction)
        let addAction = UIAlertAction(title: "Add", style: .Default) { (addAction) -> Void in
            let collegeNameTextField = myAlert.textFields![0] as UITextField
            let locationTextField = myAlert.textFields![1] as UITextField
            let numberOfStudentsTextField = myAlert.textFields![2] as UITextField
            self.colleges.append(College(Name: collegeNameTextField.text!, Location: locationTextField.text!, NumberOfStudents: Int(numberOfStudentsTextField.text!)!))
            self.myTableView.reloadData()
        }
        myAlert.addAction(addAction)
        myAlert.addTextFieldWithConfigurationHandler { (nameTextField) -> Void in
            nameTextField.placeholder = "Add College Name"
        }
        myAlert.addTextFieldWithConfigurationHandler { (locationTextField) -> Void in
            locationTextField.placeholder = "Add College Location"
        }
        myAlert.addTextFieldWithConfigurationHandler { (numberOfStudentsTextField) -> Void in
            numberOfStudentsTextField.placeholder = "Number of Students Attending"
        }
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let myTableViewCell = myTableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        myTableViewCell.textLabel?.text = colleges[indexPath.row].name
        myTableViewCell.detailTextLabel?.text = colleges[indexPath.row].location
        return myTableViewCell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
return colleges.count
    }
   func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete
    {
        colleges.removeAtIndex(indexPath.row)
        myTableView.reloadData()
    }
   }
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let college = colleges[sourceIndexPath.row]
        colleges.removeAtIndex(sourceIndexPath.row)
        colleges.insert(college, atIndex: destinationIndexPath.row)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let detailVC = segue.destinationViewController as! DetailViewController
        let selectRow = myTableView.indexPathForSelectedRow!.row
        detailVC.college = colleges[selectRow]
    }
}

