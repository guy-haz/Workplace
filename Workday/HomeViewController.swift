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
    @IBOutlet weak var placedTask: UIView!

    @IBOutlet weak var calendarHeader: UIImageView!
    @IBOutlet weak var task1: UIImageView!
    @IBOutlet weak var task2: UIImageView!
    @IBOutlet weak var task3: UIImageView!
    
    var task1Copy: UIImageView!
    var panGesture: UIPanGestureRecognizer!
    var originalPressDownLocation : CGPoint!
    var originalImageCenter : CGPoint!
    var taskFrame : CGRect!
    
    @IBOutlet var task1Gesture: UIPanGestureRecognizer!
    @IBOutlet var task2Gesture: UIPanGestureRecognizer!
    @IBOutlet var task3Gesture: UIPanGestureRecognizer!
    
    var taskLocation : CGPoint!
    
    var taskScrollViewIsScrolling = false
    
    var tasktoSegue : UIImageView!
    
    var taskCenter: CGPoint!
    
    var imageView: UIImageView!
    
<<<<<<< HEAD
    @IBAction func onLongPress1(sender: UILongPressGestureRecognizer) {
        
        var location = sender.locationInView(view)
        
        
        if sender.state == UIGestureRecognizerState.Began {
            
            println("longpress began at \(location)")
            originalPressDownLocation = location
            
            //Create Copy of Task 1
            task1Copy = UIImageView(frame: task1.frame)
            task1Copy.image = task1.image
            //transform it
            UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: nil, animations:{ () -> Void in
                self.task1Copy.transform = CGAffineTransformMakeScale(1.05, 1.05)
            }, completion: nil)
            
            view.addSubview(task1Copy)
            
            
            //Adding a shadow on the copy
            task1Copy.layer.shadowColor = UIColor.darkGrayColor().CGColor
            task1Copy.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
            task1Copy.layer.shadowOpacity = 0.7
            task1Copy.layer.shadowRadius = 2
            task1Copy.layer.masksToBounds = true
            task1Copy.clipsToBounds = false
            
            //we need to make sure the duplicate is placed in the right place at beginning, before it was only placed in the correct location on change
            task1Copy.center.x = originalPressDownLocation.x
            task1Copy.center.y = originalPressDownLocation.y
            
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            
            println("Changed long press at \(location)")
            let translation = CGPoint(x:originalPressDownLocation.x - location.x, y:originalPressDownLocation.y - location.y)
            
            task1Copy.center.x = originalPressDownLocation.x - translation.x
            task1Copy.center.y = originalPressDownLocation.y - translation.y
            
            //this will make the calendar scroll when the task is dragged to the bottom of the screen, and the velocity is taking into account the direction (downward in this case)
            if task1Copy.center.y > 602 {
                println("welcome to the bottom")
                calendarScrollView.contentOffset.y  = calendarScrollView.contentOffset.y + 10
            }
            
            else if task1Copy.center.y > 370 && task1Copy.center.y < 385{
                println("welcome to the bottom")
                calendarScrollView.contentOffset.y  = calendarScrollView.contentOffset.y - 10
            }
            
            //if the user is moving the object up, the calendar should scroll up, the reason it is between 396 and 602, is in case the user goes back to the task scrollview, the bottom scrollview will stop scrolling
            
            
            
            
         
            
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            
            //fade out the original copy when it is placed
            UIView.animateWithDuration(0.2, animations: { () -> Void in
                  self.task1Copy.alpha = 0
                
                //
            })
          
            
            
        }

    
    }
    
=======
>>>>>>> Henry-Oct-24
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
        
        //make sure that the scrollview starts at 1PM (current time is 12.18 PM)
        calendarScrollView.contentOffset.y = 550
        
       
        
        
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
    
    /*---------Turning on simultaneous gestures--------------------------*/
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer!, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer!) -> Bool {
        return true
    }
    
    @IBAction func onLongPress1(sender: UILongPressGestureRecognizer) {
        
        taskLocation = sender.locationInView(view)
        
        
        if sender.state == UIGestureRecognizerState.Began {
            
            task1Gesture.enabled = false
            
            task1.alpha = 0.5
            
            originalPressDownLocation = taskLocation
            var originalImageCenter = task1.center
            
            //Create Copy of Task 1
            taskFrame = view.convertRect(task1.frame, fromView: taskScrollView)
            task1Copy = UIImageView(frame: taskFrame)
            task1Copy.image = task1.image
            
            //transform it
            UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: nil, animations:{ () -> Void in
                self.task1Copy.transform = CGAffineTransformMakeScale(1.05, 1.05)
                }, completion: nil)
            println("copied at \(taskLocation)")
            
            view.addSubview(task1Copy)
            
            //Adding a shadow on the copy
            task1Copy.layer.shadowColor = UIColor.darkGrayColor().CGColor
            task1Copy.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
            task1Copy.layer.shadowOpacity = 0.7
            task1Copy.layer.shadowRadius = 2
            task1Copy.layer.masksToBounds = true
            task1Copy.clipsToBounds = false
            
            //we need to make sure the duplicate is placed in the right place at beginning, before it was only placed in the correct location on change
            //            task1Copy.center.x = originalPressDownLocation.x
            //            task1Copy.center.y = originalPressDownLocation.y
            //            task1Copy.frame.origin.x = location.x - originalImageCenter.x
            //            task1Copy.frame.origin.y = location.y - originalImageCenter.y
            //            task1Copy.center.x = originalImageCenter.x
            //            task1Copy.center.y = originalImageCenter.y
            
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            
            println("Changed long press at \(taskLocation)")
            let translation = CGPoint(x:originalPressDownLocation.x - taskLocation.x, y:originalPressDownLocation.y - taskLocation.y)
            
            //            task1Copy.center.x = originalPressDownLocation.x - translation.x
            //            task1Copy.center.y = originalPressDownLocation.y - translation.y
            task1Copy.frame.origin.x = taskFrame.origin.x - translation.x
            task1Copy.frame.origin.y = taskFrame.origin.y - translation.y
            
            //this will make the calendar scroll when the task is dragged to the bottom of the screen, and the velocity is taking into account the direction (downward in this case)
            if task1Copy.center.y > 602 && calendarScrollView.contentOffset.y < 1471{
                println("welcome to the bottom")
                calendarScrollView.contentOffset.y  = calendarScrollView.contentOffset.y + 10
                println("\(calendarScrollView.contentOffset.y)")
            }
                
            else if task1Copy.center.y > 370 && task1Copy.center.y < 400 && calendarScrollView.contentOffset.y > 0 {
                println("welcome to the top")
                calendarScrollView.contentOffset.y  = calendarScrollView.contentOffset.y - 10
                println("\(calendarScrollView.contentOffset.y)")
            }
            
            //if the user is moving the object up, the calendar should scroll up, the reason it is between 396 and 602, is in case the user goes back to the task scrollview, the bottom scrollview will stop scrolling
            
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            
            //fade out the original copy when it is placed
            UIView.animateWithDuration(0.2, animations: { () -> Void in
                self.task1Copy.alpha = 0
            })
            
            task1Gesture.enabled = true
            task1.alpha = 1.0
            
        }
        
        
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
        
        if translation.x > 0 || translation.x < 0 {
            
        }
        
        if taskScrollViewIsScrolling == false {
            
            if sender.state == UIGestureRecognizerState.Began {
                
                taskCenter = tasktoSegue.center
                
            } else if sender.state == UIGestureRecognizerState.Changed {
                
                tasktoSegue.center.x = translation.x + taskCenter.x
                var position = tasktoSegue.frame.origin.x
                println("The position is \(position)")
                taskScrollView.scrollEnabled = false
                
                
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




















