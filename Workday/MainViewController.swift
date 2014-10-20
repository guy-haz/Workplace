//
//  MainViewController.swift
//  Workday
//
//  Created by Henry Freel on 10/19/14.
//  Copyright (c) 2014 siddiqui. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    var todayViewController : UIViewController!
    var tomorrowViewController : UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        scrollView.delegate = self
            
        todayViewController = storyboard.instantiateViewControllerWithIdentifier("TodayViewController") as UIViewController
        tomorrowViewController = storyboard.instantiateViewControllerWithIdentifier("TomorrowViewController") as UIViewController
        
        scrollView.contentSize = CGSize(width: 750, height: scrollView.frame.height)
            
        self.addChildViewController(todayViewController)
        scrollView.addSubview(todayViewController.view)
        todayViewController.view.frame.origin = CGPoint(x: 0, y: 0)
        todayViewController.didMoveToParentViewController(self)
        
        self.addChildViewController(tomorrowViewController)
        scrollView.addSubview(tomorrowViewController.view)
        tomorrowViewController.view.frame.origin = CGPoint(x: 375, y: 0)
        tomorrowViewController.didMoveToParentViewController(self)

        // Do any additional setup after loading the view.
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
