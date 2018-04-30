//
//  MealRecommend.swift
//  CalDining App
//
//  Created by Winston Jiang on 4/27/18.
//  Copyright © 2018 Jagpinder, Manan, Winston. All rights reserved.
//

import Foundation

class MealRecommend {
    
    //days of the week
    let days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    
    let daysNum = [1, 2, 3, 4, 5, 6, 7]
    private let notRecommended = 1
    private let recommended = 3
    var weights = [1, 3]
    
    var todaysDate = String()
    var myHall = String()
    
    //menu standard format
    let menu = "https://cal-eats-server.herokuapp.com/list_full"
    let todaysMenu = "https://cal-eats-server.herokuapp.com/-/"
    
    let crossroadsMF = ["Breakfast":["BEAR FIT","BEAR FUSION","HOT MORNING GRAINS","SMOOTHIES","THE BIG C"], "Lunch": ["BEAR FIT","BEAR FUSION","BEAR NECESSITIES","BEAR SWEETS","CAL-ZONE","GOLDEN GRILL","PASTAS","SPECIALTY SALADS","THE BIG C"], "Dinner": ["BEAR FIT","BEAR FUSION","BEAR NECESSITIES","BEAR SWEETS","CAL-ZONE","GOLDEN GRILL","PASTAS","SPECIALTY SALADS","THE BIG C"]]
    let crossroadsW = ["Brunch": ["BEAR SWEETS", "ITALIAN CORNER", "SMOOTHIES", "BEAR NECESSITIES", "BEAR FIT", "BREAKFAST PLATE", "PASTAS", "GOLDEN GRILL", "SPECIALTY SALADS", "BEAR FUSION"], "Dinner": ["BEAR NECESSITIES", "SPECIALTY SALADS", "THE BIG C", "GOLDEN GRILL", "CAL-ZONE", "PASTAS", "BEAR FUSION", "BEAR SWEETS", "BEAR FIT"]]
    let cafe3MF = ["Brunch":["CENTER OF THE PLATE","DESSERTS","HOT MORNING GRAINS","KOSHER","OMELETS AND EGGS","OSKI`S FAVORITES","PIZZA STATION","SOUPS","SPECIALTY SALADS"],"Dinner": ["ACTION BAR", "BLUE PLATE","ENTREES","OSKI`S FAVORITES","SOUPS","SPECIALTY SALADS","THE GRILL"]]
    let cafe3W = ["Brunch": ["HOT MORNING GRAINS", "SOUPS", "CENTER OF THE PLATE", "OMELETS AND EGGS", "OSKI`S FAVORITES", "PIZZA STATION", "SPECIALTY SALADS", "KOSHER", "DESSERTS"], "Dinner": ["SOUPS", "BLUE PLATE", "THE GRILL", "OSKI`S FAVORITES", "ACTION BAR", "ENTREES", "SPECIALTY SALADS"]]
    let ckMF = ["Breakfast": ["BEAR SWEETS","BREAKFAST PLATE","HOT MORNING GRAINS","SMOOTHIES"], "Dinner":["BEAR FUSION","BEAR SWEETS","BUILD YOUR OWN BAR","ENTREES","GRILLED","PASTAS","SLICES","SOUPS","SPECIALTY SALADS"]]
    let ckW = ["Brunch": ["HOT MORNING GRAINS", "SMOOTHIES", "SOUPS", "SPECIALTY SALADS", "BREAKFAST PLATE", "CARVING STATION", "BEAR SWEETS"], "Dinner": ["SOUPS", "SPECIALTY SALADS", "ENTREES", "BUILD YOUR OWN BAR", "GRILLED", "SLICES", "PASTAS", "BEAR FUSION", "BEAR SWEETS"]]
    let foothillMF = ["Breakfast": ["BEAR SWEETS","BREAKFAST PLATE","EGGS MADE TO ORDER","HOT MORNING GRAINS","SMOOTHIES"], "Lunch": ["MEAL COVERS"], "Dinner": ["BEAR SWEETS","DELI AND SALAD BAR","ENTREES","GRILLED","PASTAS","SLICES","SOUPS","WORLD FLAVORS"]]
    let foothillW = ["Brunch": ["HOT MORNING GRAINS", "SOUPS", "ENTREES", "GRILLED", "SPECIALTY SALADS", "PASTAS", "CARVING STATION", "SMOOTHIES", "BEAR SWEETS"], "Dinner": ["SOUPS", "DELI AND SALAD BAR", "ENTREES", "PASTAS", "GRILLED", "WORLD FLAVORS", "SLICES", "BEAR SWEETS"]]

    func dayOfWeek() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        let todaysDate = dateFormatter.string(from: Date()).capitalized
        return todaysDate
        // or use capitalized(with: locale) if you want
    }

    init(preferredHall: String) {
        self.todaysDate = dayOfWeek()!
        
        //username?
        //today's date
        //user's preferred dining common?
    }

    
    func getMenuItemsFromJSON()  {
        struct MenuList : Codable {
            let ACTION_BAR: [String]
            let BEAR_FIT: [String]
            let BEAR_FUSION: [String]
            let BEAR_NECESSITIES: [String]
            let BEAR_SWEETS: [String]
            let BLUE_PLATE: [String]
            let BREAKFAST_PLATE: [String]
            let BUILD_YOUR_OWN_BAR: [String]
            let CAL_ZONE: [String]
            let CARVING_STATION: [String]
            let CENTER_OF_THE_PLATE: [String]
            let DELI_AND_SALAD_BAR: [String]
            let DESSERTS: [String]
            //let EGGS_MADE_TO_ORDER: [String] foothill - BREAKFAST
            let ENTREES: [String]
            let GOLDEN_GRILL: [String]
            let GRILLED: [String]
            let HOT_MORNING_GRAINS: [String]
            let ITALIAN_CORNER: [String]
            let KOSHER: [String]
            //let MEAL_COVERS: [String] foothill - LUNCH
            let OMELETS_AND_EGGS: [String]
            let OSKIS_FAVORITES: [String]
            let PASTAS: [String]
            let PIZZA_STATION: [String]
            let SLICES: [String]
            let SMOOTHIES: [String]
            let SOUPS: [String]
            let SPECIALTY_SALADS: [String]
            let THE_BIG_C: [String]
            let THE_GRILL: [String]
            let WORLD_FLAVORS: [String]
            private enum CodingKeys: String, CodingKey {
                case ACTION_BAR  = "ACTION BAR"
                case BEAR_FIT  = "BEAR FIT"
                case BEAR_FUSION  = "BEAR FUSION"
                case BEAR_NECESSITIES  = "BEAR NECESSITIES"
                case BEAR_SWEETS  = "BEAR SWEETS"
                case BLUE_PLATE  = "BLUE PLATE"
                case BREAKFAST_PLATE  = "BREAKFAST PLATE"
                case BUILD_YOUR_OWN_BAR  = "BUILD YOUR OWN BAR"
                case CAL_ZONE  = "CAL-ZONE"
                case CARVING_STATION  = "CARVING STATION"
                case CENTER_OF_THE_PLATE  = "CENTER OF THE PLATE"
                case DELI_AND_SALAD_BAR  = "DELI AND SALAD BAR"
                case DESSERTS  = "DESSERTS"
                //case EGGS_MADE_TO_ORDER  = "EGGS MADE TO ORDER" - foothill BREAKFAST
                case ENTREES  = "ENTREES"
                case GOLDEN_GRILL  = "GOLDEN GRILL"
                case GRILLED  = "GRILLED"
                case HOT_MORNING_GRAINS  = "HOT MORNING GRAINS"
                case ITALIAN_CORNER  = "ITALIAN CORNER"
                case KOSHER  = "KOSHER"
                //case MEAL_COVERS  = "MEAL COVERS" - foothill - LUNCH
                case OMELETS_AND_EGGS  = "OMELETS AND EGGS"
                case OSKIS_FAVORITES  = "OSKI`S FAVORITES"
                case PASTAS  = "PASTAS"
                case PIZZA_STATION  = "PIZZA STATION"
                case SLICES  = "SLICES"
                case SMOOTHIES  = "SMOOTHIES"
                case SOUPS  = "SOUPS"
                case SPECIALTY_SALADS  = "SPECIALTY SALADS"
                case THE_BIG_C  = "THE BIG C"
                case THE_GRILL  = "THE GRILL"
                case WORLD_FLAVORS  = "WORLD FLAVORS"
            }
        }
        
        guard let gitUrl = URL(string: menu) else { return }
        URLSession.shared.dataTask(with: gitUrl) { (data, response, error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let gitData = try decoder.decode(MenuList.self, from: data)
                
                print(gitData)
                
            } catch let err {
                print("Err", err)
            }
            }.resume()
    }
    
//    func showNames(){
//        //looing through all the elements of the array
//        for name in nameArray{
//            //appending the names to label
//            menuLabel.text = menuLabel.text! + name + "\n";
//        }
//    }

    
    
}
