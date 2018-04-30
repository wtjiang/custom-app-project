//
//  ViewController.swift
//  CalDining App
//
//  Created by Jagpinder Singh on 4/8/18.
//  Copyright © 2018 Jagpinder, Manan, Winston. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var menuLabel: UILabel!
    
    var todaysDate: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        pickerView.delegate = self
        pickerView.dataSource = self
        nextButton.layer.cornerRadius = 4
        //getMenuItemsFromJSON()
        //getJsonFromUrl();
        todaysDate = dayOfWeek()!
        let crossroads = Crossroads(date: todaysDate)
        crossroads.getMenuFromJSON()
    }
    
    func dayOfWeek() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        let todaysDate = dateFormatter.string(from: Date()).capitalized
        return todaysDate
        // or use capitalized(with: locale) if you want
    }

    let halls = ["Crossroads", "Cafe 3", "Foothill", "Clark Kerr"]

    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return halls.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return halls[row]
    }

}

