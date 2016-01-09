//
//  ModalFromDetailViewController.swift
//  Workday
//
//  Created by Henry Freel on 11/2/14.
//  Copyright (c) 2014 siddiqui. All rights reserved.
//

import UIKit

class ModalFromDetailViewController: UIViewController {

    @IBOutlet weak var imageModal: UIImageView!
    @IBOutlet weak var closeButton: UIButton!
    
    var defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageModal.image = UIImage(named: "dashboard-wireframes-modal")
        imageModal.sizeToFit()
        imageModal.frame.origin.y = 137
        imageModal.frame.origin.x = 22
        
        let laterButton = UIButton()
        laterButton.setTitle("", forState: .Normal)
        laterButton.frame = CGRectMake(22, 295, 330, 60)
        laterButton.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        laterButton.addTarget(self, action: "dashboardLaterButtonPressed:", forControlEvents: .TouchUpInside)
        self.view.addSubview(laterButton)

        // Do any additional setup after loading the view.
    }

    @IBAction func didPressClose(sender: UIButton) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func dashboardLaterButtonPressed(sender: UIButton) {
        
        defaults.setInteger(1, forKey: "task-moved")
        defaults.synchronize()
        let initalVal = defaults.integerForKey("task-moved")
        print("On laterButton pressed NSUserDefaults------------------ is \(initalVal)")
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
// last one
}
