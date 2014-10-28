//
//  AllTasksViewController.swift
//  Workday
//
//  Created by Henry Freel on 10/19/14.
//  Copyright (c) 2014 siddiqui. All rights reserved.
//

import UIKit

class AllTasksViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var allTasksImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = allTasksImage.image!.size

        // Do any additional setup after loading the view.
    }

    @IBAction func didPressBack(sender: UIButton) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }

  
}
