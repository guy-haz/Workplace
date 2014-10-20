//
//  HomeViewController.swift
//  Workday
//
//  Created by siddiqui on 10/19/14.
//  Copyright (c) 2014 siddiqui. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollViewtop: UIScrollView!

    @IBOutlet weak var task1: UIImageView!
    @IBOutlet weak var calendarHeader: UIImageView!
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
        scrollView.contentSize = CGSizeMake(375, 1151)
        
        scrollViewtop.contentSize = CGSizeMake(375, 320)
        
         scrollViewtop.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        println("scrolling")
        
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            
            self.scrollView.frame.offset(dx: 0, dy: 70)
            self.calendarHeader.frame.offset(dx: 0, dy: 70)
            self.scrollViewtop.frame.size.height = 278
        })
    }
    
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            
            self.scrollView.frame.offset(dx: 0, dy: -70)
            self.calendarHeader.frame.offset(dx: 0, dy: -70)
            self.scrollViewtop.frame.size.height = 208
            
        })
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
