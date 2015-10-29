//
//  TomorrowViewController.swift
//  Workday
//
//  Created by Henry Freel on 10/19/14.
//  Copyright (c) 2014 siddiqui. All rights reserved.
//

import UIKit

class TomorrowViewController: UIViewController {

    var refreshControl: UIRefreshControl!
    
    var defaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var taskScrollView: UIScrollView!
    @IBOutlet weak var calendarScrollView: UIScrollView!
    
    @IBOutlet weak var task1: UIImageView!
    @IBOutlet weak var task2: UIImageView!
    @IBOutlet weak var task3: UIImageView!
    @IBOutlet weak var tasksLabel: UILabel!
    
    @IBOutlet weak var calendarImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        task1.hidden = true
        task1.alpha = 0
        
        // Do any additional setup after loading the view.
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: "onRefresh", forControlEvents: UIControlEvents.ValueChanged)
        taskScrollView.insertSubview(refreshControl, atIndex: 0)
        
        let task1Height = self.task1.image!.size.height
        let task2Height = task2.image!.size.height
        let task3Height = task3.image!.size.height
        
        task2.frame.origin.y = 0
        task3.frame.origin.y = 0 + task1Height
        
        let scrollHeight = task1Height + task2Height + task3Height
        taskScrollView.contentSize = CGSizeMake(375, scrollHeight)
        
        calendarScrollView.contentSize = calendarImage.image!.size
        
    }

   
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    func onRefresh() {
        delay(2, closure: {
            self.refreshControl.endRefreshing()
            
            let task1Height = self.task1.image!.size.height
            let task2Height = self.task2.image!.size.height
            let task3Height = self.task3.image!.size.height
            
            let initalVal = self.defaults.integerForKey("task-moved")
            print("On returning NSUserDefaults------------------ is \(initalVal)")
            
            if initalVal == 2 {
                
                print("nailed it")
                self.task1.hidden = false
                
                UIView.animateWithDuration(0.7, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.7, options: [], animations: { () -> Void in
                    
                    self.task2.frame.origin.y = task1Height
                    self.task3.frame.origin.y = task1Height + task2Height
                    
                    }, completion: { (finished: Bool) -> Void in
                        
                        UIView.animateWithDuration(0.3, animations: { () -> Void in
                            
                            self.task1.alpha = 1
                            self.tasksLabel.text = "3 Tasks"

                        })
                        
                })
                
                
            }
            
            let scrollHeight = task1Height + task2Height + task3Height
            self.taskScrollView.contentSize = CGSizeMake(375, scrollHeight)
            
        })
    }
    
    
// last one
}
