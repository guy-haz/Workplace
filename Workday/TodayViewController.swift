//
//  TodayViewController.swift
//  Workday
//
//  Created by siddiqui on 10/19/14.
//  Copyright (c) 2014 siddiqui. All rights reserved.
//

import UIKit

class TodayViewController: UIViewController, UIScrollViewDelegate, UIGestureRecognizerDelegate, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
    var isPresenting: Bool = true
    
    @IBOutlet weak var calendarScrollView: UIScrollView!
    @IBOutlet weak var taskScrollView: UIScrollView!
    
    @IBOutlet weak var calendarImage: UIImageView!

    @IBOutlet weak var calendarHeader: UIImageView!
   
    // Task list
    @IBOutlet weak var taskTrelloBilling: UIImageView!
    @IBOutlet weak var taskPivotalError: UIImageView!
    @IBOutlet weak var taskPivotalHomePage: UIImageView!
    @IBOutlet weak var taskPivotalRoadmap: UIImageView!
    @IBOutlet weak var taskTrelloDashboard: UIImageView!
    
    
    var task1Copy: UIImageView!
    var taskOriginal: UIImageView!
    var panGesture: UIPanGestureRecognizer!
    var originalPressDownLocation : CGPoint!
    var originalImageCenter : CGPoint!
    var taskFrame : CGRect!
    
    
    
    @IBOutlet var billingInfoPanGesture: UIPanGestureRecognizer!
    @IBOutlet var errorPanGesture: UIPanGestureRecognizer!
    @IBOutlet var homepagePanGesture: UIPanGestureRecognizer!
    @IBOutlet var q4PanGesture: UIPanGestureRecognizer!
    @IBOutlet var dashboardPanGesture: UIPanGestureRecognizer!
    
    
    
    var taskLocation : CGPoint!
    var taskScrollViewIsScrolling = false
    var tasktoSegue : UIImageView!
    var taskTapped : UIImageView!
    var taskCenter: CGPoint!
    var imageView: UIImageView!
    
    @IBOutlet weak var checkmark: UIImageView!
    @IBOutlet weak var clock: UIImageView!
    
    var segueIsModal: Bool!
    var segueIsDetail: Bool!
    var taskIsPanning: Bool!
    
    var parentScrollview: UIScrollView!
    
    // View from the storyboard
//    var todayViewController: UIViewController!
//    var trelloArchiveViewController: UIViewController!
//    var trelloLaterViewController: UIViewController!
    


    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendarScrollView.contentSize = calendarImage.image!.size
        
        //make sure that the scrollview starts at 1PM (current time is 12.18 PM)
        calendarScrollView.contentOffset.y = 550
        
        // Adding the Storyboard and views
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
//        todayViewController = storyboard.instantiateViewControllerWithIdentifier("TodayViewController") as UIViewController
//        trelloArchiveViewController = storyboard.instantiateViewControllerWithIdentifier("TrelloArchiveViewController") as UIViewController
//        trelloLaterViewController = storyboard.instantiateViewControllerWithIdentifier("TrelloLaterViewController") as UIViewController



        checkmark.alpha = 0
        clock.alpha = 0
        
        taskIsPanning = false
        
        var taskTrelloBillingHeight = taskTrelloBilling.image!.size.height
        var taskTrelloDashboardHeight = taskTrelloDashboard.image!.size.height
        var taskPivotalErrorHeight = taskPivotalError.image!.size.height
        var taskPivotalHomePageHeight = taskPivotalHomePage.image!.size.height
        var taskPivotalRoadmapHeight = taskPivotalRoadmap.image!.size.height
        
        var scrollHeight = taskTrelloBillingHeight + taskTrelloDashboardHeight + taskPivotalErrorHeight + taskPivotalHomePageHeight + taskPivotalRoadmapHeight


        println("total is \(scrollHeight)")
        
        billingInfoPanGesture.delegate = self
        errorPanGesture.delegate = self
        homepagePanGesture.delegate = self
        q4PanGesture.delegate = self
        dashboardPanGesture.delegate = self
        
        taskScrollView.contentSize = CGSize(width: 375, height: scrollHeight)
        
        taskScrollView.delegate = self
        calendarScrollView.delegate = self
        
        // Do any additional setup after loading the view.
    }

    
    
    /*---------Turning on simultaneous gestures--------------------------*/
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer!, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer!) -> Bool {
        return true
    }
    

    
    @IBAction func onQ4Tap(sender: UITapGestureRecognizer) {
        
        tasktoSegue = sender.view as UIImageView
        performSegueWithIdentifier("dashboardSegue", sender: self)

    }

    @IBAction func onDashboardTap(sender: UITapGestureRecognizer) {
        
        tasktoSegue = sender.view as UIImageView
        performSegueWithIdentifier("dashboardSegue", sender: self)
        
    }
    
    
    @IBAction func onLongPress1(sender: UILongPressGestureRecognizer) {
        
        taskOriginal = sender.view as UIImageView!
        
        taskLocation = sender.locationInView(view)
        
        
        if sender.state == UIGestureRecognizerState.Began {
            
            billingInfoPanGesture.enabled = false
            errorPanGesture.enabled = false
            homepagePanGesture.enabled = false
            q4PanGesture.enabled = false
            dashboardPanGesture.enabled = false
            
            taskOriginal.alpha = 0.5
            
            originalPressDownLocation = taskLocation
            var originalImageCenter = taskOriginal.center
            
            //Create Copy of Task 1
            taskFrame = view.convertRect(taskOriginal.frame, fromView: taskScrollView)
            task1Copy = UIImageView(frame: taskFrame)
            task1Copy.image = taskOriginal.image
            
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
            
            billingInfoPanGesture.enabled = true
            errorPanGesture.enabled = true
            homepagePanGesture.enabled = true
            q4PanGesture.enabled = true
            dashboardPanGesture.enabled = true
            
            taskOriginal.alpha = 1.0
            
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
        

        if taskScrollViewIsScrolling == false {
            
            if sender.state == UIGestureRecognizerState.Began {
                
                parentScrollview.scrollEnabled = false
                println("parent scroll is off")
                
                taskCenter = tasktoSegue.center
                
            } else if sender.state == UIGestureRecognizerState.Changed {
                checkmark.alpha = 0
                clock.alpha = 0
                
                tasktoSegue.center.x = translation.x + taskCenter.x
                var position = tasktoSegue.frame.origin.x
                taskScrollView.scrollEnabled = false
                
                
                if translation.x < 0 {
                    clock.alpha = 1
                    clock.center.x = translation.x + 410
                    clock.center.y = tasktoSegue.center.y

                } else if translation.x > 0 {
                    checkmark.alpha = 1
                    checkmark.center.x = translation.x - 30
                    checkmark.center.y = tasktoSegue.center.y
                }
                
                
            } else if sender.state == UIGestureRecognizerState.Ended {
                // Swipe left to do later
                if translation.x < -60 {
                        
                        performSegueWithIdentifier("ModalSegue", sender: self)

                }
                
                // Swipe right to archive
                if translation.x > 60 {
                        
                        performSegueWithIdentifier("ModalSegue", sender: self)

                }
                
                
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.tasktoSegue.frame.origin.x = 0
                })
                
                
                parentScrollview.scrollEnabled = true
                println("parent scroll is on!")
                taskScrollView.scrollEnabled = true
                //println("horse is \(taskScrollView.scrollEnabled)")
                
            }
            
        }

        
    }
    
    
    /*-------------CUSTOM TRANSITIONS------------------------------*/
    
    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = false
        return self
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        if segue.identifier == "ModalSegue" {
            
            segueIsModal = true
            segueIsDetail = false

            var modalViewController = segue.destinationViewController as TrelloArchiveViewController
            modalViewController.taskPanned = self.tasktoSegue.image
            
            println("Modal")
            var destinationVC = segue.destinationViewController as UIViewController
            destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
            destinationVC.transitioningDelegate = self
            
        } else if segue.identifier == "dashboardSegue" {
            
            segueIsDetail = true
            segueIsModal = false
            
            var detailViewController = segue.destinationViewController as TrelloTaskViewController
            detailViewController.taskTapped = self.tasktoSegue.image
            
            println("Detail")
            var destinationVC = segue.destinationViewController as UIViewController
            destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
            destinationVC.transitioningDelegate = self
            
        }
        
        
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        // The value here should be the duration of the animations scheduled in the animationTransition method
        return 0.4
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        
        
        // Modal is Presenting
        if (isPresenting) && segueIsModal == true {
            
            println("animating Modal TO transition")
            
            let vc = toViewController as TrelloArchiveViewController
            
            vc.imageModal.transform = CGAffineTransformMakeTranslation(0, 600)
            vc.closeButton.alpha = 0
            
            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                
                toViewController.view.alpha = 1
                
                }) { (finished: Bool) -> Void in
                    
                    UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: nil, animations: { () -> Void in
                        
                        vc.imageModal.transform = CGAffineTransformMakeTranslation(0, 0)
                        
                    }, completion: nil)
                    
                    
                    UIView.animateWithDuration(0.5, delay: 0.2, options: nil, animations: { () -> Void in
                        
                        vc.closeButton.alpha = 1
                        
                    }, completion: nil)
                            
                    
                    
                    transitionContext.completeTransition(true)
            }
            
        
        // Detail is Presenting
        } else if (isPresenting) && segueIsDetail == true {
            
            println("animating Detail TO transition")
            
            let vc = toViewController as TrelloTaskViewController
            
            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                toViewController.view.alpha = 1
                }) { (finished: Bool) -> Void in
                    
                    transitionContext.completeTransition(true)
            }
            
        // Modal is returning
        } else if segueIsModal == true {
            
            let vc = fromViewController as TrelloArchiveViewController
            
            println("animating Modal FROM transition")
            
            UIView.animateWithDuration(0.4, delay: 0, options: nil, animations: { () -> Void in
                
                vc.closeButton.alpha = 0
                
                }, completion: nil)
            
            UIView.animateWithDuration(0.7, delay: 0.2, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.3, options: nil, animations: { () -> Void in
                
                vc.imageModal.transform = CGAffineTransformMakeTranslation(0, 600)
                
                }, completion: nil)
            
            UIView.animateWithDuration(0.4, delay: 0.5, options: nil, animations: { () -> Void in
                
                fromViewController.view.alpha = 0

                }, completion: { (finished: Bool) -> Void in
                    
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()
                    
            })
            
        // Detail is returning
        } else if segueIsDetail == true {
            
            println("animating Detail FROM transition")
            
            let vc = fromViewController as TrelloTaskViewController
            
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                
                fromViewController.view.alpha = 0
                }) { (finished: Bool) -> Void in
                    
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()
            }

            
        }
        
        
        
        
    // end of custom transition
    }


    
    
    
//last one
}



















