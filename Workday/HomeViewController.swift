//
//  HomeViewController.swift
//  Workday
//
//  Created by siddiqui on 10/19/14.
//  Copyright (c) 2014 siddiqui. All rights reserved.
//

import UIKit

class TodayViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var calendarScrollView: UIScrollView!
    @IBOutlet weak var taskScrollView: UIScrollView!
    
    @IBOutlet weak var calendarImage: UIImageView!

    @IBOutlet weak var calendarHeader: UIImageView!
    @IBOutlet weak var task1: UIButton!
    @IBOutlet weak var task2: UIButton!
    @IBOutlet weak var task3: UIButton!
    
    var tasktoSegue : UIButton!
    
    var taskCenter: CGPoint!
    
    var imageView: UIImageView!
//    
//    @IBAction func onLongPress1(sender: UILongPressGestureRecognizer) {
//        
//        println("Im longpressing 1")
//          var window = UIApplication.sharedApplication().keyWindow
//        UIView.animateWithDuration(0.3, animations: { () -> Void in
//            
//            
//        })
//        var task1Copy = UIImageView(frame: CGRect(x: task1.frame.origin.x, y: task1.frame.origin.y + 102, width: task1.frame.size.width, height: task1.frame.size.height))
//        task1Copy.image = task1.image
//        
//        window.addSubview(task1Copy)
//        
//        task1Copy.transform = CGAffineTransformMakeScale(1.05, 1.05)
//     
//        
//        
//        
//    }
    
    

  
      
    override func viewDidLoad() {
        super.viewDidLoad()
        calendarScrollView.contentSize = calendarImage.image!.size
        
        var task1Height = task1.imageView!.image!.size.height
        var task2Height = task2.imageView!.image!.size.height
        var task3Height = task3.imageView!.image!.size.height
        
        var scrollHeight = task1Height + task2Height + task3Height
        
        println("One is \(task1Height)")
        println("Two is \(task2Height)")
        println("Three is \(task3Height)")

        println("total is \(scrollHeight)")
        
        taskScrollView.contentSize = CGSize(width: 375, height: scrollHeight)
        
         taskScrollView.delegate = self
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
    
    @IBAction func didPanTask(sender: UIPanGestureRecognizer) {
        
        tasktoSegue = sender.view as UIButton
        
        var location = sender.locationInView(view)
        var translation = sender.translationInView(view)
        var velocity = sender.velocityInView(view)
        
        if sender.state == UIGestureRecognizerState.Began {
            
            taskCenter = tasktoSegue.center
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            
            tasktoSegue.center.x = translation.x + taskCenter.x
            var position = tasktoSegue.frame.origin.x
            println("The position is \(position)")

            
        } else if sender.state == UIGestureRecognizerState.Ended {
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                
                self.tasktoSegue.frame.origin.x = 0

            })
            
        }
        
        
    }
    
//last one
}




















