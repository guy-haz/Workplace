//
//  HomeViewController.swift
//  Workday
//
//  Created by siddiqui on 10/19/14.
//  Copyright (c) 2014 siddiqui. All rights reserved.
//

import UIKit

class TodayViewController: UIViewController, UIScrollViewDelegate, UIGestureRecognizerDelegate {
    @IBOutlet weak var calendarScrollView: UIScrollView!
    @IBOutlet weak var taskScrollView: UIScrollView!
    
    @IBOutlet weak var calendarImage: UIImageView!

    @IBOutlet weak var calendarHeader: UIImageView!
    @IBOutlet weak var task1: UIImageView!
    @IBOutlet weak var task2: UIImageView!
    @IBOutlet weak var task3: UIImageView!
    
    var task1Copy: UIImageView!
    var panGesture: UIPanGestureRecognizer!
    var originalPressDownLocation : CGPoint!

    
    @IBOutlet var task1Gesture: UIPanGestureRecognizer!
    @IBOutlet var task2Gesture: UIPanGestureRecognizer!
    @IBOutlet var task3Gesture: UIPanGestureRecognizer!
    
    var taskScrollViewIsScrolling = false
    
    var tasktoSegue : UIImageView!
    
    var taskCenter: CGPoint!
    
    var imageView: UIImageView!
    
    @IBAction func onLongPress1(sender: UILongPressGestureRecognizer) {
        
        var location = sender.locationInView(view)
        
        if sender.state == UIGestureRecognizerState.Began {
            
            println("longpress began at \(location)")
            originalPressDownLocation = location
            
            //Create Copy of Task 1
            task1Copy = UIImageView(frame: task1.frame)
            task1Copy.image = task1.image
            //transform it
            task1Copy.transform = CGAffineTransformMakeScale(1.1, 1.1)
            view.addSubview(task1Copy)
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            
            println("Changed long press at \(location)")
            let translation = CGPoint(x:originalPressDownLocation.x - location.x, y:originalPressDownLocation.y - location.y)
            
            task1Copy.center.x = originalPressDownLocation.x - translation.x
            task1Copy.center.y = originalPressDownLocation.y - translation.y
            
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            
            
            
        }

    
    }
    
//    func panGesture(sender: UIPanGestureRecognizer) {
//        
//        var location = panGesture.locationInView(view)
//        var translation = panGesture.translationInView(view)
//        var velocity = panGesture.velocityInView(view)
//        
//        if sender.state == UIGestureRecognizerState.Began {
//            
//            taskCenter = task1Copy.center
//            taskScrollView.scrollEnabled = false
//            
//        } else if sender.state == UIGestureRecognizerState.Changed {
//            
//            task1Copy.center.x = translation.x + taskCenter.x
//            task1Copy.center.y = translation.y + taskCenter.y
//            var position = task1Copy.frame.origin
//            println("The position of the copy is \(position)")
//            
//            
//        } else if sender.state == UIGestureRecognizerState.Ended {
//            
//            taskScrollView.scrollEnabled = true
//            
//        }
//        
//        
//    }
    
    


  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendarScrollView.contentSize = calendarImage.image!.size
        
        var task1Height = task1.image!.size.height
        var task2Height = task2.image!.size.height
        var task3Height = task3.image!.size.height
        
        var scrollHeight = task1Height + task2Height + task3Height
        
        println("One is \(task1Height)")
        println("Two is \(task2Height)")
        println("Three is \(task3Height)")

        println("total is \(scrollHeight)")
        
        task1Gesture.delegate = self
        task2Gesture.delegate = self
        task3Gesture.delegate = self
        
        taskScrollView.contentSize = CGSize(width: 375, height: scrollHeight)
        
        taskScrollView.delegate = self
        calendarScrollView.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
//    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
//        println("scrolling")
//        
//        UIView.animateWithDuration(0.3, animations: { () -> Void in
//            
//            self.calendarScrollView.frame.offset(dx: 0, dy: 70)
//            self.calendarHeader.frame.offset(dx: 0, dy: 70)
//            self.taskScrollView.frame.size.height = 278
//        })
//    }
    
    
//    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//        UIView.animateWithDuration(0.3, animations: { () -> Void in
//            
//            self.calendarScrollView.frame.offset(dx: 0, dy: -70)
//            self.calendarHeader.frame.offset(dx: 0, dy: -70)
//            self.taskScrollView.frame.size.height = 208
//            
//        })
//    }
    
    /*-------------Turning on this shit------------------------------*/
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer!, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer!) -> Bool {
        return true
    }
    
    /*-------------TASK IS SCROLLING ON------------------------------*/

    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        taskScrollViewIsScrolling = true
        println("\(taskScrollViewIsScrolling)")
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        taskScrollViewIsScrolling = false
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        taskScrollViewIsScrolling = false

    }
    
    
    /*-------------TASK PANNING------------------------------*/
    
    @IBAction func didPanTask(sender: UIPanGestureRecognizer) {
        
        tasktoSegue = sender.view as UIImageView
        
        var location = sender.locationInView(view)
        var translation = sender.translationInView(view)
        var velocity = sender.velocityInView(view)
        
        if taskScrollViewIsScrolling == false {
            
            if sender.state == UIGestureRecognizerState.Began {
                
                taskCenter = tasktoSegue.center
                taskScrollView.scrollEnabled = false
                
            } else if sender.state == UIGestureRecognizerState.Changed {
                
                tasktoSegue.center.x = translation.x + taskCenter.x
                var position = tasktoSegue.frame.origin.x
                println("The position is \(position)")
                
                
            } else if sender.state == UIGestureRecognizerState.Ended {
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    
                    self.tasktoSegue.frame.origin.x = 0
                })
                
                taskScrollView.scrollEnabled = true

                
            }
            
            
        }
        
       
        
        
    }
    
//last one
}




















