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
    
    //define transition assets
    @IBOutlet weak var todayDot: UIView!
    @IBOutlet weak var tomorrowDot: UIView!
    @IBOutlet weak var todayLabel: UILabel!
    @IBOutlet weak var tomorrowLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set up transition assests
        todayDot.layer.cornerRadius = 2.5
        tomorrowDot.layer.cornerRadius = 2.5
        tomorrowDot.frame.origin.y = 65
        tomorrowDot.backgroundColor = UIColor(red: 0.27, green: 0.44, blue: 0.63, alpha: 1)
        todayDot.backgroundColor = UIColor(red: 0.27, green: 0.44, blue: 0.63, alpha: 1)

        todayLabel.textColor = UIColor(red: 0.27, green: 0.44, blue: 0.63, alpha: 1)
        tomorrowLabel.textColor = UIColor(red: 0.80, green: 0.81, blue: 0.85, alpha: 1)
        
        
        
        
        

            
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
    
    // on scrolling
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        var offset = scrollView.contentOffset.x
        println("offset is \(offset)")
        
        var todaydotScroll = convertValue(offset, r1Min: 0, r1Max: 375, r2Min: 52, r2Max: 65)
        var tomorrowdotScroll = convertValue(offset, r1Min: 0, r1Max: 375, r2Min: 65, r2Max: 52)
        
        println("new offset is \(todaydotScroll)")
        
        if offset > 0 && offset < 375 {
            
            todayDot.frame.origin.y = todaydotScroll
            tomorrowDot.frame.origin.y = tomorrowdotScroll
            
            if offset > 187.5 {
                
                tomorrowLabel.textColor = UIColor(red: 0.27, green: 0.44, blue: 0.63, alpha: 1)
                todayLabel.textColor = UIColor(red: 0.80, green: 0.81, blue: 0.85, alpha: 1)
                
            } else {
                
                todayLabel.textColor = UIColor(red: 0.27, green: 0.44, blue: 0.63, alpha: 1)
                tomorrowLabel.textColor = UIColor(red: 0.80, green: 0.81, blue: 0.85, alpha: 1)
                
            }
        }
        
    }
    
    func convertValue(value: CGFloat, r1Min: CGFloat, r1Max: CGFloat, r2Min: CGFloat, r2Max: CGFloat) -> CGFloat {
        var ratio = (r2Max - r2Min) / (r1Max - r1Min)
        return value * ratio + r2Min - r1Min * ratio
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
