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
    //new idea #2, also works, might be preferred

    func getMenuFromJSON(date: String) {
        if date == "Saturday" || date == "Sunday" {
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

            guard let menuURL = URL(string: menu) else { return }
            URLSession.shared.dataTask(with: menuURL) { (data, response
                , error) in
                guard let data = data else { return }
                do {
                    let result = try JSONDecoder().decode(WeekendMenu.self, from: data)
                    for item in result.brunch {
                        print(item.name)
                        print(item.dishes)
                    }
                } catch let err {
                    print("Err", err)
                }
                }.resume()
        } else {
            struct WeekdayMenu: Decodable {
                private enum CodingKeys : String, CodingKey { case breakfast = "Breakfast", lunch = "Lunch", dinner = "Dinner" }
                
                let breakfast: [Category]
                let lunch: [Category]
                let dinner: [Category]
                
                init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    
                    let breakfast = try container.decode([String:[String]].self, forKey: .breakfast)
                    let breakfastKeys = breakfast.keys.sorted()
                    self.breakfast = breakfastKeys.map { Category(name: $0, dishes: breakfast[$0]!) }
                    
                    let lunch = try container.decode([String:[String]].self, forKey: .lunch)
                    let lunchKeys = lunch.keys.sorted()
                    self.lunch = lunchKeys.map { Category(name: $0, dishes: lunch[$0]!) }

                    let dinner = try container.decode([String:[String]].self, forKey: .dinner)
                    let dinnerKeys = dinner.keys.sorted()
                    self.dinner = dinnerKeys.map { Category(name: $0, dishes: dinner[$0]!) }
                }
            }
            struct Category {
                let name : String
                let dishes : [String]
            }
            guard let menuURL = URL(string: menu) else { return }
            URLSession.shared.dataTask(with: menuURL) { (data, response
                , error) in
                guard let data = data else { return }
                do {
                    let result = try JSONDecoder().decode(WeekdayMenu.self, from: data)
                    print("Breakfast Menu: \n")
                    
                    for item in result.breakfast {
                        print(item.name)
                        print(item.dishes)
                    }
                    
                    print("Lunch Menu: \n")
                    for item in result.lunch {
                        print(item.name)
                        print(item.dishes)
                    }
                    
                    print("Dinner Menu: \n")
                    for item in result.dinner {
                        print(item.name)
                        print(item.dishes)
                    }


                } catch let err {
                    print("Err", err)
                }
                }.resume()

        }
        }
    }
