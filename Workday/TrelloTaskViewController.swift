//
//  TrelloTaskViewController.swift
//  Workday
//
//  Created by Bjørn Eivind Rostad on 10/26/14.
//  Copyright (c) 2014 siddiqui. All rights reserved.
//

import UIKit

class TrelloTaskViewController: UIViewController {

    var taskTapped : UIImage!
    
    var defaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var taskImage: UIImageView!
    @IBOutlet weak var navImageView: UIImageView!
    @IBOutlet weak var actionBar: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if taskTapped == UIImage(named: "trello - dashboard") {
            
            println("dashboard wireframes")
            taskImage.image = UIImage(named: "trello-card-task")
            navImageView.image = UIImage(named: "trello-card-nav")
            actionBar.image = UIImage(named: "trello-action")
            taskImage.sizeToFit()
            
            defaults.setInteger(1, forKey: "task-read")
            defaults.synchronize()
            var initalVal = defaults.integerForKey("task-read")
            println("Read One NSUserDefaults------------------ is \(initalVal)")
            
        } else if taskTapped == UIImage(named: "pivotal - q4 roadmap") {
            
            println("Q4 road map")
            taskImage.image = UIImage(named: "pivotal-card-task")
            navImageView.image = UIImage(named: "pivotal-nav-bar")
            actionBar.image = UIImage(named: "pivotal-action")
            taskImage.sizeToFit()
            
            defaults.setInteger(2, forKey: "task-read")
            defaults.synchronize()
            var initalVal = defaults.integerForKey("task-read")
            println("Read Two NSUserDefaults------------------ is \(initalVal)")
            
        }
        
        scrollView.contentSize = taskImage.image!.size
    }
    
 
    @IBAction func didTapBack(sender: UIButton) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    

}
