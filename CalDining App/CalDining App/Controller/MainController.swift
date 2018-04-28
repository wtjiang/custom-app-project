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
    
    //days of the week
    let days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    
    @IBAction func leftTouch() {
        let formatter : DateFormatter = DateFormatter();
        formatter.dateFormat = "EEEE";
        let date = formatter.string(from: Date())
        
        pageController.currentPage -= 1
        pageController.updateCurrentPageDisplay()
        
        if days[pageController.currentPage] == date {
            forecastLabel.text = "Today's Forecast"
        } else {
            forecastLabel.text = days[pageController.currentPage] + "'s Forecast"
        }
    }
    
    @IBAction func rightTouch() {
        let formatter : DateFormatter = DateFormatter();
        formatter.dateFormat = "EEEE";
        let date = formatter.string(from: Date())
        
        pageController.currentPage += 1
        pageController.updateCurrentPageDisplay()
        if days[pageController.currentPage] == date {
            forecastLabel.text = "Today's Forecast"
        } else {
            forecastLabel.text = days[pageController.currentPage] + "'s Forecast"
        }
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
        let formatter : DateFormatter = DateFormatter();
        formatter.dateFormat = "EEEE";
        let date = formatter.string(from: Date())
        print(date)
        
        // Do any additional setup after loading the view, typically from a nib.
        settingsButton.layer.cornerRadius = 4
        
        if days[pageController.currentPage] == date {
            forecastLabel.text = "Today's Forecast"
        } else {
            forecastLabel.text = days[pageController.currentPage] + "'s Forecast"
        }

    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
