//
//  AllTasksViewController.swift
//  Workday
//
//  Created by Henry Freel on 10/19/14.
//  Copyright (c) 2014 siddiqui. All rights reserved.
//

import UIKit

class AllTasksViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var allTasksImage: UIImageView!
    @IBOutlet weak var allTasksSearchBar: UIImageView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //searchBar.backgroundColor = UIColor.blackColor()
        
        scrollView.delegate = self
        
        var scrollHeight = allTasksImage.image!.size.height + allTasksSearchBar.image!.size.height
        
        scrollView.contentSize = CGSizeMake(375, scrollHeight)
        scrollView.contentOffset.y = 44

        // Do any additional setup after loading the view.
    }

    @IBAction func didPressBack(sender: UIButton) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }

    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if scrollView.contentOffset.y < 44 && scrollView.contentOffset.y > 0 {
            
            UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                self.scrollView.contentOffset.y = 44
            }, completion: nil)

        }
    }
  
    @IBAction func didPressSearch(sender: UIButton) {
        
        UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.scrollView.contentOffset.y = 0
            }, completion: nil)
        
    }

    @IBAction func onTapView(sender: UITapGestureRecognizer) {
        
        view.endEditing(true)

    }
}
