//
//  SettingsViewController.swift
//  Workday
//
//  Created by Henry Freel on 10/19/14.
//  Copyright (c) 2014 siddiqui. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var settingsImage: UIImageView!
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var eventsSwitch: UISwitch!
    @IBOutlet weak var tasksSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = settingsImage.image!.size

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func didPressCancel(sender: UIButton) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }

}
