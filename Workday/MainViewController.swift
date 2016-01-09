//
//  MainViewController.swift
//  Workday
//
//  Created by Henry Freel on 10/19/14.
//  Copyright (c) 2014 siddiqui. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UIScrollViewDelegate {
   
    // NSUserDefaults --------------------------------------------------------------------
    var defaults = NSUserDefaults.standardUserDefaults()

    @IBOutlet weak var scrollView: UIScrollView!
    
    var todayViewController : TodayViewController!
    var tomorrowViewController : TomorrowViewController!
    
    //define transition assets
    @IBOutlet weak var todayDot: UIView!
    @IBOutlet weak var tomorrowDot: UIView!
    @IBOutlet weak var todayLabel: UILabel!
    @IBOutlet weak var tomorrowLabel: UILabel!

    var leftEdgeGesture: UIScreenEdgePanGestureRecognizer!
    var rightEdgeGesture: UIScreenEdgePanGestureRecognizer!
    
    @IBOutlet weak var goToToday: UIButton!
    @IBOutlet weak var goToTomorrow: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // NSUserDefaults --------------------------------------------------------------------
        defaults.setInteger(0, forKey: "task-moved")
        defaults.synchronize()
        
        defaults.setInteger(0, forKey: "task-read")
        defaults.synchronize()
        
        //set up transition assests
        todayDot.layer.cornerRadius = 2.5
        tomorrowDot.layer.cornerRadius = 2.5
        tomorrowDot.frame.origin.y = 65
        tomorrowDot.backgroundColor = UIColor(red: 0.27, green: 0.44, blue: 0.63, alpha: 1)
        todayDot.backgroundColor = UIColor(red: 0.27, green: 0.44, blue: 0.63, alpha: 1)

        todayLabel.textColor = UIColor(red: 0.27, green: 0.44, blue: 0.63, alpha: 1)
        tomorrowLabel.textColor = UIColor(red: 0.80, green: 0.81, blue: 0.85, alpha: 1)
        
        
        
//        leftEdgeGesture = UIScreenEdgePanGestureRecognizer(target: self, action: "onLeftEdgePan:")
//        leftEdgeGesture.edges = UIRectEdge.Left
//        view.addGestureRecognizer(leftEdgeGesture)
//        
//        
//        rightEdgeGesture = UIScreenEdgePanGestureRecognizer(target: self, action: "onRightEdgePan:")
//        rightEdgeGesture.edges = UIRectEdge.Right
//        view.addGestureRecognizer(rightEdgeGesture)
//        
//
//        leftEdgeGesture.enabled = false


        
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        scrollView.delegate = self
            
        todayViewController = storyboard.instantiateViewControllerWithIdentifier("TodayViewController") as! TodayViewController
        tomorrowViewController = storyboard.instantiateViewControllerWithIdentifier("TomorrowViewController") as! TomorrowViewController
        
        todayViewController.parentScrollview = scrollView
        
        
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
    
    /*--------------------- Today - Tomorrow Buttons --------------------------*/
    
    @IBAction func didPressOnTodayButton(sender: UIButton) {
        
        print("today was pushed")
    
        UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            
            self.scrollView.contentOffset.x = 0
            self.todayDot.frame.origin.y = 52
            self.tomorrowDot.frame.origin.y = 65
            self.todayLabel.textColor = UIColor(red: 0.27, green: 0.44, blue: 0.63, alpha: 1)
            self.tomorrowLabel.textColor = UIColor(red: 0.80, green: 0.81, blue: 0.85, alpha: 1)
            
            }, completion: { (finished: Bool) -> Void in
                
                //completion
                
        })
        
    }
    
    
    @IBAction func didPressTomorrowButton(sender: UIButton) {
        
        print("tomorrow was pushed")
        
        UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            
            self.scrollView.contentOffset.x = 375
            self.todayDot.frame.origin.y = 65
            self.tomorrowDot.frame.origin.y = 52
            self.tomorrowLabel.textColor = UIColor(red: 0.27, green: 0.44, blue: 0.63, alpha: 1)
            self.todayLabel.textColor = UIColor(red: 0.80, green: 0.81, blue: 0.85, alpha: 1)
            
            }, completion: { (finished: Bool) -> Void in
                
                //completion
                
        })
   
        
    }
    
    
    
    /*--------------------- Edge Pan Gesture --------------------------*/
    
    func onRightEdgePan(gestureRecognizer: UIScreenEdgePanGestureRecognizer) {
//        scrollView.scrollEnabled = true
    
        
        var translation = gestureRecognizer.translationInView(view)
        scrollView.contentOffset.x = 375
        

        print("edgeRight")
        
        if scrollView.contentOffset.x >= 375 {
            leftEdgeGesture.enabled = true

        }
        
    }
    
    
    func onLeftEdgePan(gestureRecognizer: UIScreenEdgePanGestureRecognizer) {
//        scrollView.scrollEnabled = true
        print("edgeLeft")
        scrollView.contentOffset.x = 0

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // on scrolling
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        let offset = scrollView.contentOffset.x
        print("offset is \(offset)")
        
        let todaydotScroll = convertValue(offset, r1Min: 0, r1Max: 375, r2Min: 52, r2Max: 65)
        let tomorrowdotScroll = convertValue(offset, r1Min: 0, r1Max: 375, r2Min: 65, r2Max: 52)
        
        print("new offset is \(todaydotScroll)")
        
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
        let ratio = (r2Max - r2Min) / (r1Max - r1Min)
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
