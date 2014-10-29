//
//  TrelloArchiveViewController.swift
//  Workday
//
//  Created by Bjørn Eivind Rostad on 10/26/14.
//  Copyright (c) 2014 siddiqui. All rights reserved.
//

import UIKit

class TrelloArchiveViewController: UIViewController {
    
    var taskPanned : UIImage!
    
    var defaults = NSUserDefaults.standardUserDefaults()

    @IBOutlet weak var imageModal: UIImageView!
    @IBOutlet weak var closeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Dashboard Task
        if taskPanned == UIImage(named: "trello - dashboard") {
            
            println("dashboard wireframes")
            imageModal.image = UIImage(named: "dashboardModal-later")
            imageModal.sizeToFit()
            imageModal.frame.origin.y = 137
            
            let laterButton = UIButton()
            laterButton.setTitle("", forState: .Normal)
            laterButton.frame = CGRectMake(22, 305, 330, 60)
            laterButton.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
            laterButton.addTarget(self, action: "dashboardLaterButtonPressed:", forControlEvents: .TouchUpInside)
            self.view.addSubview(laterButton)
        
        // Q4 Road Map Task
        } else if taskPanned == UIImage(named: "pivotal - q4 roadmap") {
            
            println("Q4 road map")
            imageModal.image = UIImage(named: "q4Modal-later")
            imageModal.sizeToFit()
            imageModal.frame.origin.y = 137
            
            let tomorrowButton = UIButton()
            tomorrowButton.setTitle("", forState: .Normal)
            tomorrowButton.frame = CGRectMake(22, 243, 330, 60)
            tomorrowButton.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
            tomorrowButton.addTarget(self, action: "Q4TomorrowButtonPressed:", forControlEvents: .TouchUpInside)
            self.view.addSubview(tomorrowButton)

        // Billing info Task
        } else if taskPanned == UIImage(named: "trello - billing info") {
            
            println("billing info with apple pay")
            imageModal.image = UIImage(named: "billingModal-complete")
            imageModal.sizeToFit()
            imageModal.frame.origin.y = 137
            
        // Error and Warning States
        } else if taskPanned == UIImage(named: "pivotal - error and warning states") {
            
            println("error and wearning states")
            println("no available image")
            
        // Home page Specs
        } else if taskPanned == UIImage(named: "pivotal - home page specs") {
            
            println("homepage specs")
            imageModal.image = UIImage(named: "homepageModal-complete")
            imageModal.sizeToFit()
            imageModal.frame.origin.y = 137
            
            let finishButton = UIButton()
            finishButton.setTitle("", forState: .Normal)
            finishButton.frame = CGRectMake(22, 358, 330, 60)
            finishButton.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
            finishButton.addTarget(self, action: "homeFinishButtonPressed:", forControlEvents: .TouchUpInside)
            self.view.addSubview(finishButton)

        }
        
        
    }
    
    func dashboardLaterButtonPressed(sender: UIButton) {
        
        defaults.setInteger(1, forKey: "task-moved")
        defaults.synchronize()
        var initalVal = defaults.integerForKey("dashboard-moved")
        println("On laterButton pressed NSUserDefaults------------------ is \(initalVal)")
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func Q4TomorrowButtonPressed(sender: UIButton) {
        
        defaults.setInteger(2, forKey: "task-moved")
        defaults.synchronize()
        var initalVal = defaults.integerForKey("task-moved")
        println("On laterButton pressed NSUserDefaults------------------ is \(initalVal)")
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func homeFinishButtonPressed(sender: UIButton) {
        
        defaults.setInteger(3, forKey: "task-moved")
        defaults.synchronize()
        var initalVal = defaults.integerForKey("task-moved")
        println("On archive pressed NSUserDefaults------------------ is \(initalVal)")
        dismissViewControllerAnimated(true, completion: nil)
        
    }

    @IBAction func closeButton(sender: UIButton) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }

    
    
    
// last one
}










