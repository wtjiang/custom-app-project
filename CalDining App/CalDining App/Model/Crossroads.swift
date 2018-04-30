//
//  Crossroads.swift
//  CalDining App
//
//  Created by Winston Jiang on 4/28/18.
//  Copyright © 2018 Jagpinder, Manan, Winston. All rights reserved.
//

import Foundation
class Crossroads {
    
    var todaysDate: String
    
    init(date: String) {
        todaysDate = date
    }
    let menu = "https://cal-eats-server.herokuapp.com/0/Crossroads"
    let crossroadsMF = ["Breakfast":["BEAR FIT","BEAR FUSION","HOT MORNING GRAINS","SMOOTHIES","THE BIG C"], "Lunch": ["BEAR FIT","BEAR FUSION","BEAR NECESSITIES","BEAR SWEETS","CAL-ZONE","GOLDEN GRILL","PASTAS","SPECIALTY SALADS","THE BIG C"], "Dinner": ["BEAR FIT","BEAR FUSION","BEAR NECESSITIES","BEAR SWEETS","CAL-ZONE","GOLDEN GRILL","PASTAS","SPECIALTY SALADS","THE BIG C"]]
    let crossroadsW = ["Brunch": ["BEAR SWEETS", "ITALIAN CORNER", "SMOOTHIES", "BEAR NECESSITIES", "BEAR FIT", "BREAKFAST PLATE", "PASTAS", "GOLDEN GRILL", "SPECIALTY SALADS", "BEAR FUSION"], "Dinner": ["BEAR NECESSITIES", "SPECIALTY SALADS", "THE BIG C", "GOLDEN GRILL", "CAL-ZONE", "PASTAS", "BEAR FUSION", "BEAR SWEETS", "BEAR FIT"]]
    struct MealType: Decodable {
        
    }
    //still writing this
    struct Meal : Decodable
//    func getMenuItemsFromJSONInProgress() {
//
//    }
    func getMenuItemsFromJSON()  {
        if todaysDate == "Saturday" || todaysDate == "Sunday" {
            struct Croads : Codable {
                let BEAR_FIT: [String]
                let BEAR_FUSION: [String]
                let HOT_MORNING_GRAINS: [String]
                let SMOOTHIES: [String]
                let THE_BIG_C: [String]
                private enum CodingKeys: String, CodingKey {
                    case BEAR_FIT  = "BEAR FIT"
                    case BEAR_FUSION  = "BEAR FUSION"
                    case HOT_MORNING_GRAINS  = "HOT MORNING GRAINS"
                    case SMOOTHIES  = "SMOOTHIES"
                    case THE_BIG_C  = "THE BIG C"
                }
            }
        } else {
            struct Croads : Codable {
                let BEAR_FIT: [String]
                let BEAR_FUSION: [String]
                let HOT_MORNING_GRAINS: [String]
                let SMOOTHIES: [String]
                let THE_BIG_C: [String]
                private enum CodingKeys: String, CodingKey {
                    case BEAR_FIT  = "BEAR FIT"
                    case BEAR_FUSION  = "BEAR FUSION"
                    case HOT_MORNING_GRAINS  = "HOT MORNING GRAINS"
                    case SMOOTHIES  = "SMOOTHIES"
                    case THE_BIG_C  = "THE BIG C"
                }
            }
        }
        
        guard let gitUrl = URL(string: menu) else { return }
        URLSession.shared.dataTask(with: gitUrl) { (data, response, error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let gitData = try decoder.decode(Croads.self, from: data)
                
                print(gitData)
                
            } catch let err {
                print("Err", err)
            }
            }.resume()
    }

}

