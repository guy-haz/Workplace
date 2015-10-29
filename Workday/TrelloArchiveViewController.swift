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
            
            print("dashboard wireframes")
            imageModal.image = UIImage(named: "dashboard-wireframes-modal")
            imageModal.sizeToFit()
            imageModal.frame.origin.y = 137
            
            let laterButton = UIButton()
            laterButton.setTitle("", forState: .Normal)
            laterButton.frame = CGRectMake(22, 295, 330, 60)
            laterButton.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
            laterButton.addTarget(self, action: "dashboardLaterButtonPressed:", forControlEvents: .TouchUpInside)
            self.view.addSubview(laterButton)
        
        // Q4 Road Map Task
        } else if taskPanned == UIImage(named: "pivotal - q4 roadmap") {
            
            print("Q4 road map")
            imageModal.image = UIImage(named: "roadmap-modal")
            imageModal.sizeToFit()
            imageModal.frame.origin.y = 137
            
            let tomorrowButton = UIButton()
            tomorrowButton.setTitle("", forState: .Normal)
            tomorrowButton.frame = CGRectMake(22, 257, 330, 60)
            tomorrowButton.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
            tomorrowButton.addTarget(self, action: "Q4TomorrowButtonPressed:", forControlEvents: .TouchUpInside)
            self.view.addSubview(tomorrowButton)

        // Billing info Task
        } else if taskPanned == UIImage(named: "trello - billing info") {
            
            print("billing info with apple pay")
            imageModal.image = UIImage(named: "billing-info-modal")
            imageModal.sizeToFit()
            imageModal.frame.origin.y = 137
            
            let archiveButton = UIButton()
            archiveButton.setTitle("", forState: .Normal)
            archiveButton.frame = CGRectMake(22, 255, 330, 64)
            archiveButton.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
            archiveButton.addTarget(self, action: "billingInfoButtonPressed:", forControlEvents: .TouchUpInside)
            self.view.addSubview(archiveButton)
            
        // Error and Warning States
        } else if taskPanned == UIImage(named: "pivotal - error and warning") {
            
            print("error and wearning states")
            imageModal.image = UIImage(named: "error-states-modal")
            imageModal.sizeToFit()
            imageModal.frame.origin.y = 137
            
            let finishButton = UIButton()
            finishButton.setTitle("", forState: .Normal)
            finishButton.frame = CGRectMake(22, 295, 330, 64)
            finishButton.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
            finishButton.addTarget(self, action: "errorStatesButtonPressed:", forControlEvents: .TouchUpInside)
            self.view.addSubview(finishButton)
            
        // Home page Specs
        } else if taskPanned == UIImage(named: "pivotal - home page specs") {
            
            print("homepage specs")
            imageModal.image = UIImage(named: "homepage-modal")
            imageModal.sizeToFit()
            imageModal.frame.origin.y = 137
            
            let finishButton = UIButton()
            finishButton.setTitle("", forState: .Normal)
            finishButton.frame = CGRectMake(22, 340, 330, 60)
            finishButton.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
            finishButton.addTarget(self, action: "homeFinishButtonPressed:", forControlEvents: .TouchUpInside)
            self.view.addSubview(finishButton)

        }
        
        
    }
    
    func dashboardLaterButtonPressed(sender: UIButton) {
        
        defaults.setInteger(1, forKey: "task-moved")
        defaults.synchronize()
        let initalVal = defaults.integerForKey("dashboard-moved")
        print("On laterButton pressed NSUserDefaults------------------ is \(initalVal)")
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func Q4TomorrowButtonPressed(sender: UIButton) {
        
        defaults.setInteger(2, forKey: "task-moved")
        defaults.synchronize()
        let initalVal = defaults.integerForKey("task-moved")
        print("On laterButton pressed NSUserDefaults------------------ is \(initalVal)")
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func homeFinishButtonPressed(sender: UIButton) {
        
        defaults.setInteger(3, forKey: "task-moved")
        defaults.synchronize()
        let initalVal = defaults.integerForKey("task-moved")
        print("On archive pressed NSUserDefaults------------------ is \(initalVal)")
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func billingInfoButtonPressed(sender: UIButton) {
        
        defaults.setInteger(4, forKey: "task-moved")
        defaults.synchronize()
        let initalVal = defaults.integerForKey("task-moved")
        print("On archive pressed NSUserDefaults------------------ is \(initalVal)")
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func errorStatesButtonPressed(sender: UIButton) {
        
        defaults.setInteger(5, forKey: "task-moved")
        defaults.synchronize()
        let initalVal = defaults.integerForKey("task-moved")
        print("On archive pressed NSUserDefaults------------------ is \(initalVal)")
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    

    @IBAction func closeButton(sender: UIButton) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }

    
    
    
// last one
}










