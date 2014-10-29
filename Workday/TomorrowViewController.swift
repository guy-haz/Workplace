//
//  TomorrowViewController.swift
//  Workday
//
//  Created by Henry Freel on 10/19/14.
//  Copyright (c) 2014 siddiqui. All rights reserved.
//

import UIKit

class TomorrowViewController: UIViewController {

    @IBOutlet weak var taskScrollView: UIScrollView!
    @IBOutlet weak var calendarScrollView: UIScrollView!
    
    @IBOutlet weak var task1: UIImageView!
    @IBOutlet weak var task2: UIImageView!
    @IBOutlet weak var task3: UIImageView!
    
    @IBOutlet weak var calendarImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var task1Height = task1.image!.size.height
        var task2Height = task2.image!.size.height
        var task3Height = task3.image!.size.height
        
        var scrollHeight = task1Height + task2Height + task2Height
        taskScrollView.contentSize = CGSizeMake(375, scrollHeight)
        
        calendarScrollView.contentSize = calendarImage.image!.size
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
