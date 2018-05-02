//
//  ViewController.swift
//  CalDining App
//
//  Created by Jagpinder Singh on 4/8/18.
//  Copyright © 2018 Jagpinder, Manan, Winston. All rights reserved.
//

import UIKit

class MainController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var pageController: UIPageControl!
    
    @IBOutlet weak var settingsButton: UIButton!
    
    @IBOutlet weak var mealRecommendTable: UITableView!
    
    //days of the week
    let days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    let daysNums = [0,1,2,3,4,5,6]
    var daysIndex = Int()
    
//    let MFMeals = ["Crossroads Breakfast", "Crossroads Lunch", "Crossroads Dinner", "Cafe 3 Brunch", "Cafe 3 Dinner", "Foothill Breakfast", "Foothill Lunch", "Foothill Dinner", "Clark Kerr Breakfast", "Clark Kerr Dinner"]
//    let WMeals = ["Crossroads Brunch", "Crossroads Dinner", "Cafe 3 Brunch", "Cafe 3 Dinner", "Foothill Brunch", "Foothill Dinner", "Clark Kerr Brunch", "Clark Kerr Dinner"]
    
    //
    var todaysMeals = [String: Double]()
    
    //RECOMMENDATION WEIGHTS
    let lowerBound = 0.0
    let middleBound = 1.5
    let upperBound = 4.0
    
    //passed from ViewController (the table view)
    var selectedCells: [String] = [] //from user
    var selectedCellsWeights: [Double] = [] //from user
    var selectedCellsDict = [String: Double]() //from user

    var currentUser = User()
    let defaults = UserDefaults.standard
    
    var todaysDate: String = ""
    var menuWithWeightsCrossroads = [String: [String: Double]]() //today's menus with menu weights
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mealRecommendTable.delegate = self
        mealRecommendTable.dataSource = self
        //currentUser = defaults.object(forKey: "currentUser") as? User ?? User()
        selectedCells = defaults.object(forKey: "selectedCells") as? [String] ?? [String]()
        selectedCellsWeights = defaults.object(forKey: "selectedCellsWeights") as? [Double] ?? [Double]()
        selectedCellsDict = defaults.object(forKey: "selectedCellsDict") as? [String : Double] ?? [String : Double]()
        todaysDate = dayOfWeek()!
        recommendCrossroads()

//        print("Passed selectedCells: ", selectedCells)
//        print("Passed selectedCellsWeights: ", selectedCellsWeights)
//        print("Passed selectedCellsDict: ", selectedCellsDict)

        // Do any additional setup after loading the view, typically from a nib.
        settingsButton.layer.cornerRadius = 4
    }
        

    func dayOfWeek() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        let todaysDate = dateFormatter.string(from: Date()).capitalized
        return todaysDate
    }
    
    func recommendCrossroads() {
        let crossroads = Crossroads(date: todaysDate)
        crossroads.getMenuFromJSON(date: todaysDate) { (result) -> () in
            self.menuWithWeightsCrossroads = result
            for (meal, dish) in self.menuWithWeightsCrossroads {
                var mealSum = 0.0
                for (item, _) in dish {
                    if let val = self.selectedCellsDict[item] {
                        mealSum += val
                    }
                }
                self.todaysMeals.updateValue(mealSum, forKey: "Crossroads \(meal)")
            }
            DispatchQueue.main.async {
                self.mealRecommendTable.reloadData()
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        self.mealRecommendTable.reloadData()
    }
    override func viewDidAppear(_ animated: Bool) {
        self.mealRecommendTable.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if currentUser.todaysDate == "Saturday" || currentUser.todaysDate == "Sunday" {
//            return WMeals.count
//        } else {
//            return MFMeals.count
//        }
        return todaysMeals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mealRecommendTable.dequeueReusableCell(withIdentifier: "cell")
        let values = Array(todaysMeals.values)[indexPath.row]
        cell?.textLabel?.text = Array(todaysMeals.keys)[indexPath.row]
//        if currentUser.todaysDate == "Saturday" || currentUser.todaysDate == "Sunday" {
//            cell?.textLabel?.text = WMeals[indexPath.row]
//        } else {
//            cell?.textLabel?.text = MFMeals[indexPath.row]
//        }
        if values >= lowerBound && values < middleBound {
            cell?.detailTextLabel?.text = "Not Recommended"
            cell?.detailTextLabel?.textColor = UIColor(red:1.00, green:0.48, blue:0.48, alpha:1.0)
        } else if values >= middleBound && values < upperBound {
            cell?.detailTextLabel?.text = "Recommended"
            cell?.detailTextLabel?.tintColor = UIColor(red:0.06, green:0.70, blue:0.16, alpha:1.0)
        } else if values >= upperBound {
            cell?.detailTextLabel?.text = "Highly Recommended"
            cell?.detailTextLabel?.tintColor = UIColor(red:0.88, green:0.82, blue:0.18, alpha:1.0)
        } else {
            cell?.detailTextLabel?.text = "No Recommendation Available"

            

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
