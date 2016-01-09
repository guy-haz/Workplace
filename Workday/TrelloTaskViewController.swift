//
//  TrelloTaskViewController.swift
//  Workday
//
//  Created by Bjørn Eivind Rostad on 10/26/14.
//  Copyright (c) 2014 siddiqui. All rights reserved.
//

import UIKit

class TrelloTaskViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
    var isPresenting: Bool = true

    var taskTapped : UIImage!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var taskImage: UIImageView!
    @IBOutlet weak var navImageView: UIImageView!
    @IBOutlet weak var actionBar: UIImageView!
    @IBOutlet weak var smallClock: UIImageView!
    
    var defaults = NSUserDefaults.standardUserDefaults()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if taskTapped == UIImage(named: "trello - dashboard") {
            
            print("dashboard wireframes")
            taskImage.image = UIImage(named: "trello-card-task")
            navImageView.image = UIImage(named: "trello-card-nav")
            actionBar.image = UIImage(named: "trello-action")
            taskImage.sizeToFit()
            smallClock.hidden = true
            let initalVal = defaults.integerForKey("task-moved")
            
            if initalVal == 1 {
                
                print("now show clock again")
                smallClock.hidden = false
            }
            
            defaults.setInteger(1, forKey: "task-read")
            defaults.synchronize()
            print("Read One NSUserDefaults------------------ is \(initalVal)")
            
        } else if taskTapped == UIImage(named: "pivotal - q4 roadmap") {
            
            print("Q4 road map")
            taskImage.image = UIImage(named: "pivotal-card-task")
            navImageView.image = UIImage(named: "pivotal-nav-bar")
            actionBar.image = UIImage(named: "pivotal-action")
            taskImage.sizeToFit()
            
            defaults.setInteger(2, forKey: "task-read")
            defaults.synchronize()
            let initalVal = defaults.integerForKey("task-read")
            print("Read Two NSUserDefaults------------------ is \(initalVal)")
            
        }
        
        scrollView.contentSize = taskImage.image!.size
    }
    
 
    @IBAction func didTapBack(sender: UIButton) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = false
        return self
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        let destinationVC = segue.destinationViewController as UIViewController
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationVC.transitioningDelegate = self
        
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        // The value here should be the duration of the animations scheduled in the animationTransition method
        return 0.4
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        print("animating transition")
        let containerView = transitionContext.containerView()
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        if (isPresenting) {
            
           
            print("animating Modal TO transition")
            
            let vc = toViewController as! ModalFromDetailViewController
            
            vc.imageModal.transform = CGAffineTransformMakeTranslation(0, 600)
            vc.closeButton.alpha = 0
            
            containerView!.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                
                toViewController.view.alpha = 1
                
                }) { (finished: Bool) -> Void in
                    
                    UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: [], animations: { () -> Void in
                        
                        vc.imageModal.transform = CGAffineTransformMakeTranslation(0, 0)
                        
                        }, completion: nil)
                    
                    
                    UIView.animateWithDuration(0.5, delay: 0.2, options: [], animations: { () -> Void in
                        
                        vc.closeButton.alpha = 1
                        
                        }, completion: nil)
                    
                    
                    
                    transitionContext.completeTransition(true)
                    
            }
            
        } else {
            
            let vc = fromViewController as! ModalFromDetailViewController
            
            print("animating Modal FROM transition")
            
            UIView.animateWithDuration(0.4, delay: 0, options: [], animations: { () -> Void in
                
                vc.closeButton.alpha = 0
                
                }, completion: nil)
            
            UIView.animateWithDuration(0.7, delay: 0.2, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.3, options: [], animations: { () -> Void in
                
                vc.imageModal.transform = CGAffineTransformMakeTranslation(0, 600)
                
                }, completion: nil)
            
            UIView.animateWithDuration(0.4, delay: 0.5, options: [], animations: { () -> Void in
                
                fromViewController.view.alpha = 0
                //                self.tasktoSegue.alpha = 0
                
                }, completion: { (finished: Bool) -> Void in
                    
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()
            
                    let initalVal = self.defaults.integerForKey("task-moved")
            
                    if initalVal == 1 {
                        
                        UIView.animateWithDuration(0.3, delay: 0, options: [], animations: { () -> Void in
                            
                            self.smallClock.hidden = false
                            self.smallClock.transform = CGAffineTransformMakeScale(1.3, 1.3)
                            
                        }) { (finished: Bool) -> Void in
                            
                            UIView.animateWithDuration(0.3, animations: { () -> Void in
                                
                                self.smallClock.transform = CGAffineTransformMakeScale(1, 1)

                            })
                            
                        }
                        
                        
                    }
                    
            })
            
        
        }
        
    }

    
    
// last one
}
