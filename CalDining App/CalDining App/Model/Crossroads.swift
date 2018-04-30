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
    let testMenu = "https://cal-eats-server.herokuapp.com/current_crossroads"
    let menu = "https://cal-eats-server.herokuapp.com/0/Crossroads"
    let crossroadsMF = ["Breakfast":["BEAR FIT","BEAR FUSION","HOT MORNING GRAINS","SMOOTHIES","THE BIG C"], "Lunch": ["BEAR FIT","BEAR FUSION","BEAR NECESSITIES","BEAR SWEETS","CAL-ZONE","GOLDEN GRILL","PASTAS","SPECIALTY SALADS","THE BIG C"], "Dinner": ["BEAR FIT","BEAR FUSION","BEAR NECESSITIES","BEAR SWEETS","CAL-ZONE","GOLDEN GRILL","PASTAS","SPECIALTY SALADS","THE BIG C"]]
    let crossroadsW = ["Brunch": ["BEAR FIT", "BEAR FUSION", "BEAR NECESSITIES", "BEAR SWEETS", "BREAKFAST PLATE", "GOLDEN GRILL", "ITALIAN CORNER", "PASTAS", "SMOOTHIES", "SPECIALTY SALADS"], "Dinner": ["BEAR FIT", "BEAR FUSION", "BEAR NECESSITIES", "BEAR SWEETS", "CAL-ZONE", "GOLDEN GRILL", "PASTAS", "SPECIALTY SALADS", "THE BIG C"]]

    
//    //new idea, WORKS!
//    func getMenuFromJSON() {
//        struct WeekendMenu: Decodable {
//            private enum CodingKeys : String, CodingKey { case brunch = "Brunch", dinner = "Dinner" }
//            let brunch: [String:[String]]
//
//            let dinner: [String:[String]]
//        }
//        //let result = try JSONDecoder().decode(WeekendMenu.self, from: data)
//        guard let menuURL = URL(string: testMenu) else { return }
//        URLSession.shared.dataTask(with: menuURL) { (data, response
//            , error) in
//            guard let data = data else { return }
//            do {
//                let result = try JSONDecoder().decode(WeekendMenu.self, from: data)
//                for key in result.brunch.keys.sorted() {
//                    print(key, result.brunch[key]!)
//                }
//                for key in result.dinner.keys.sorted() {
//                    print(key, result.dinner[key]!)
//                }
//            } catch let err {
//                print("Err", err)
//            }
//            }.resume()
//    }
//}
    //new idea #2, testing right now
    func getMenuFromJSON() {

        struct WeekendMenu: Decodable {
            private enum CodingKeys : String, CodingKey { case brunch = "Brunch", dinner = "Dinner" }
            
            let brunch: [Category]
            let dinner: [Category]
            
            init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                let brunch = try container.decode([String:[String]].self, forKey: .brunch)
                let brunchKeys = brunch.keys.sorted()
                self.brunch = brunchKeys.map { Category(name: $0, dishes: brunch[$0]!) }
                let dinner = try container.decode([String:[String]].self, forKey: .dinner)
                let dinnerKeys = dinner.keys.sorted()
                self.dinner = dinnerKeys.map { Category(name: $0, dishes: dinner[$0]!) }
            }
        }
        
        struct Category {
            let name : String
            let dishes : [String]
        }
    }
    //still writing this
//    struct WeekendMenu: Decodable {
//        struct Brunch: Decodable {
//            var BEAR_FIT: [String]
//            var BEAR_FUSION: [String]
//            var BEAR_NECESSITIES: [String]
//            var BEAR_SWEETS: [String]
//            var BREAKFAST_PLATE: [String]
//            var GOLDEN_GRILL: [String]
//            var ITALIAN_CORNER: [String]
//            var PASTAS: [String]
//            var SMOOTHIES: [String]
//            var SPECIALTY_SALADS: [String]
//            private enum CodingKeys: String, CodingKey {
//                case BEAR_FIT  = "BEAR FIT"
//                case BEAR_FUSION  = "BEAR FUSION"
//                case BEAR_NECESSITIES  = "BEAR NECESSITIES"
//                case BEAR_SWEETS  = "BEAR SWEETS"
//                case BREAKFAST_PLATE  = "BREAKFAST PLATE"
//                case GOLDEN_GRILL  = "GOLDEN GRILL"
//                case ITALIAN_CORNER  = "ITALIAN CORNER"
//                case PASTAS  = "PASTAS"
//                case SMOOTHIES  = "SMOOTHIES"
//                case SPECIALTY_SALADS  = "SPECIALTY SALADS"
//            }
//        }
//        struct Dinner: Decodable {
//            //TODO
//        }
//        var brunch: String
//        var dinner: String
//        private enum CodingKeys: String, CodingKey {
//            case brunch = "Brunch"
//            case dinner = "Dinner"
//        }
//    }
//    struct GetWMenu: Decodable {
//
//    }
    
//    func getMenuItemsFromJSONInProgress() {
//
//    }
    //old method
//    func getMenuItemsFromJSON()  {
//        if todaysDate == "Saturday" || todaysDate == "Sunday" {
//            struct Croads : Codable {
//                let BEAR_FIT: [String]
//                let BEAR_FUSION: [String]
//                let HOT_MORNING_GRAINS: [String]
//                let SMOOTHIES: [String]
//                let THE_BIG_C: [String]
//                private enum CodingKeys: String, CodingKey {
//                    case BEAR_FIT  = "BEAR FIT"
//                    case BEAR_FUSION  = "BEAR FUSION"
//                    case HOT_MORNING_GRAINS  = "HOT MORNING GRAINS"
//                    case SMOOTHIES  = "SMOOTHIES"
//                    case THE_BIG_C  = "THE BIG C"
//                }
//            }
//        } else {
//            struct Croads : Codable {
//                let BEAR_FIT: [String]
//                let BEAR_FUSION: [String]
//                let HOT_MORNING_GRAINS: [String]
//                let SMOOTHIES: [String]
//                let THE_BIG_C: [String]
//                private enum CodingKeys: String, CodingKey {
//                    case BEAR_FIT  = "BEAR FIT"
//                    case BEAR_FUSION  = "BEAR FUSION"
//                    case HOT_MORNING_GRAINS  = "HOT MORNING GRAINS"
//                    case SMOOTHIES  = "SMOOTHIES"
//                    case THE_BIG_C  = "THE BIG C"
//                }
//            }
//        }
//
//        guard let gitUrl = URL(string: menu) else { return }
//        URLSession.shared.dataTask(with: gitUrl) { (data, response, error) in
//            guard let data = data else { return }
//            do {
//                let decoder = JSONDecoder()
//                let gitData = try decoder.decode(Croads.self, from: data)
//
//                print(gitData)
//
//            } catch let err {
//                print("Err", err)
//            }
//            }.resume()
//    }

//}

