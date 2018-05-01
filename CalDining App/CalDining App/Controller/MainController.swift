//
//  ViewController.swift
//  CalDining App
//
//  Created by Jagpinder Singh on 4/8/18.
//  Copyright © 2018 Jagpinder, Manan, Winston. All rights reserved.
//

import UIKit

class MainController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var pageController: UIPageControl!
    
    @IBOutlet weak var settingsButton: UIButton!
    
    @IBOutlet weak var mealRecommendTable: UITableView!
    
    //days of the week
    let days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    let daysNums = [0,1,2,3,4,5,6]
    var daysIndex = Int()
    let halls = ["Crossroads", "Cafe 3", "Foothill", "Clark Kerr"]
    let MFMeals = ["Crossroads Breakfast", "Crossroads Lunch", "Crossroads Dinner", "Cafe 3 Brunch", "Cafe 3 Dinner", "Foothill Breakfast", "Foothill Lunch", "Foothill Dinner", "Clark Kerr Breakfast", "Clark Kerr Dinner"]
    let WMeals = ["Crossroads Brunch", "Crossroads Dinner", "Cafe 3 Brunch", "Cafe 3 Dinner", "Foothill Brunch", "Foothill Dinner", "Clark Kerr Brunch", "Clark Kerr Dinner"]
    //passed from ViewController (the table view)
    var selectedCells: [String] = []
    var selectedCellsWeights: [Double] = []
    var selectedCellsDict = [String: Double]()
    var currentUser = User()
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mealRecommendTable.delegate = self
        mealRecommendTable.dataSource = self
        //currentUser = defaults.object(forKey: "currentUser") as? User ?? User()
        selectedCells = defaults.object(forKey: "selectedCells") as? [String] ?? [String]()
        selectedCellsWeights = defaults.object(forKey: "selectedCellsWeights") as? [Double] ?? [Double]()
        selectedCellsDict = defaults.object(forKey: "selectedCellsDict") as? [String : Double] ?? [String : Double]()

        print("Passed currentUser: ", currentUser)
        print("Passed currentUser Preferences: ", currentUser.myPreferences)
        print("Passed selectedCells: ", selectedCells)
        print("Passed selectedCellsWeights: ", selectedCellsWeights)
        print("Passed selectedCellsDict: ", selectedCellsDict)

        // Do any additional setup after loading the view, typically from a nib.
        settingsButton.layer.cornerRadius = 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if currentUser.todaysDate == "Saturday" || currentUser.todaysDate == "Sunday" {
            return WMeals.count
        } else {
            return MFMeals.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mealRecommendTable.dequeueReusableCell(withIdentifier: "cell")
        if currentUser.todaysDate == "Saturday" || currentUser.todaysDate == "Sunday" {
            cell?.textLabel?.text = WMeals[indexPath.row]
        } else {
            cell?.textLabel?.text = MFMeals[indexPath.row]
        }
        return cell!
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if days[daysIndex] == currentUser.todaysDate {
            return "Today's Forecast: " + currentUser.todaysDate
        } else {
            return days[daysIndex] + "'s Forecast"
        }
    }

    @IBAction func leftTouch() {
        if daysIndex == 0 {
            daysIndex = 7
        }
        daysIndex -= 1
    }
    
    @IBAction func rightTouch() {
        if daysIndex == 6 {
            daysIndex = -1
        }
        daysIndex += 1
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
