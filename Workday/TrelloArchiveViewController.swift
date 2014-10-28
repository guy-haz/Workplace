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

    @IBOutlet weak var imageModal: UIImageView!
    @IBOutlet weak var closeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if taskPanned == UIImage(named: "trello - dashboard") {
            
            println("dashboard wireframes")
            imageModal.image = UIImage(named: "dashboardModal-later")
            imageModal.sizeToFit()
            imageModal.frame.origin.y = 137
            
            let laterButton = UIButton()
            laterButton.setTitle("", forState: .Normal)
            laterButton.frame = CGRectMake(20, 200, 600, 100)
            laterButton.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
            self.imageModal.addSubview(laterButton)
            
        } else if taskPanned == UIImage(named: "pivotal - q4 roadmap") {
            
            println("Q4 road map")
            imageModal.image = UIImage(named: "q4Modal-later")
            imageModal.sizeToFit()
            imageModal.frame.origin.y = 137

        } else if taskPanned == UIImage(named: "trello - billing info") {
            
            println("billing info with apple pay")
            imageModal.image = UIImage(named: "billingModal-complete")
            imageModal.sizeToFit()
            imageModal.frame.origin.y = 137

        } else if taskPanned == UIImage(named: "pivotal - error and warning states") {
            
            println("error and wearning states")
            println("no available image")
            
        } else if taskPanned == UIImage(named: "pivotal - home page specs") {
            
            println("homepage specs")
            imageModal.image = UIImage(named: "homepageModal-complete")
            imageModal.sizeToFit()
            imageModal.frame.origin.y = 137

        }
        
        
    }

    @IBAction func closeButton(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }

// last one
}
