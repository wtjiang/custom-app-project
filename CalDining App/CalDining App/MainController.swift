//
//  ViewController.swift
//  CalDining App
//
//  Created by Jagpinder Singh on 4/8/18.
//  Copyright © 2018 Jagpinder, Manan, Winston. All rights reserved.
//

import UIKit

class MainController: UIViewController {
    
    @IBOutlet weak var forecastLabel: UILabel!
    
    @IBOutlet weak var pageController: UIPageControl!
    
    @IBOutlet weak var settingsButton: UIButton!
    
    @IBAction func leftTouch() {
        pageController.currentPage -= 1
        pageController.updateCurrentPageDisplay()
        
        if pageController.currentPage == 
        forecastLabel.text = days[pageController.currentPage] + "'s Forecast"
    }
    
    @IBAction func rightTouch() {
        pageController.currentPage += 1
        pageController.updateCurrentPageDisplay()
        forecastLabel.text = days[pageController.currentPage] + "'s Forecast"
    }
    
    //    @IBAction func RswipeHandler(_ gestureRecognizer : UISwipeGestureRecognizer) {
//        if gestureRecognizer.state == .ended {
//            // Perform action.
//            pageController.currentPage += 1
//        }
//    }
//    @IBAction func LswipeHandler(_ gestureRecognizer : UISwipeGestureRecognizer) {
//        if gestureRecognizer.state == .ended {
//            // Perform action.
//            pageController.currentPage -= 1
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        settingsButton.layer.cornerRadius = 4
        forecastLabel.text = days[pageController.currentPage] + "'s Forecast"
    }
    
        let days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
