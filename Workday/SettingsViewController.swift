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
    
    @IBAction func onTap(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    @IBAction func didEndTextField(sender: UITextField) {
        view.endEditing(true)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = settingsImage.image!.size

        let tintColor = UIColor(red: 0.12, green: 0.40, blue: 0.51, alpha: 1)
        eventsSwitch.onTintColor = tintColor
        tasksSwitch.onTintColor = tintColor
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func didPressCancel(sender: UIButton) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }

}
