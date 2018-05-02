//
//  User.swift
//  CalDining App
//
//  Created by Winston Jiang on 5/1/18.
//  Copyright © 2018 Jagpinder, Manan, Winston. All rights reserved.
//

import Foundation

class User {
    
    var myPreferences: [String] = []
//    let myEmail: String
//    let myPassword: String
    
//    init(email: String, password: String) {
//        myEmail = email
//        myPassword = password
//    }
    var todaysDate: String = ""

    init() {
        
        todaysDate = dayOfWeek()!
        let crossroads = Crossroads(date: todaysDate)
        //crossroads.getMenuFromJSON(date: todaysDate)
        

    }
    
    func myRecommend() {
        
    }
    func dayOfWeek() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        let todaysDate = dateFormatter.string(from: Date()).capitalized
        return todaysDate
    }
    
    
}
