//
//  Cafe3.swift
//  CalDining App
//
//  Created by Winston Jiang on 5/4/18.
//  Copyright © 2018 Jagpinder, Manan, Winston. All rights reserved.
//

import Foundation
class Cafe3 {
    var todaysDate: String
    init(date: String) {
        todaysDate = date
    }
    
    let menu = "https://cal-eats-server.herokuapp.com/0/Cafe_3"
    
    //reads json data from link, returns menus for recommendation (todaysMenus) and menus for display (todaysMenusCategories)
    func getMenuFromJSON(date: String, completion: @escaping ([String: [String]], [String: [String: [String]]]) -> ()) {
        var todaysMenus = [String: [String]]()
        var todaysMenusCategories = [String: [String: [String]]]()
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
                todaysMenus.updateValue([], forKey: "Brunch")
                todaysMenus.updateValue([], forKey: "Dinner")
                todaysMenusCategories.updateValue([:], forKey: "Brunch")
                todaysMenusCategories.updateValue([:], forKey: "Dinner")
                
                let result = try JSONDecoder().decode(WeekendMenu.self, from: data)
                for item in result.brunch {
                    todaysMenus["Brunch"]?.append(contentsOf: item.dishes)
                    var inner: [String: [String]] = todaysMenusCategories["Brunch"]!
                    inner[item.name] = item.dishes
                    todaysMenusCategories["Brunch"] = inner
                }
                for item in result.dinner {
                    todaysMenus["Dinner"]?.append(contentsOf: item.dishes)
                    var inner: [String: [String]] = todaysMenusCategories["Dinner"]!
                    inner[item.name] = item.dishes
                    todaysMenusCategories["Dinner"] = inner
                }
                DispatchQueue.main.async {
                    completion(todaysMenus, todaysMenusCategories)
                }
            } catch let err {
                print("Err", err)
                completion(["Menus Unavailable Today": [""]], todaysMenusCategories)
            }
            }.resume()
    }
}
