//
//  Crossroads.swift
//  CalDining App
//
//  Created by Winston Jiang on 4/28/18.
//  Copyright © 2018 Jagpinder, Manan, Winston. All rights reserved.
//

import Foundation
class Crossroads {
    let menu = "https://cal-eats-server.herokuapp.com/0/Crossroads"
    let crossroadsMF = ["Breakfast":["BEAR FIT","BEAR FUSION","HOT MORNING GRAINS","SMOOTHIES","THE BIG C"], "Lunch": ["BEAR FIT","BEAR FUSION","BEAR NECESSITIES","BEAR SWEETS","CAL-ZONE","GOLDEN GRILL","PASTAS","SPECIALTY SALADS","THE BIG C"], "Dinner": ["BEAR FIT","BEAR FUSION","BEAR NECESSITIES","BEAR SWEETS","CAL-ZONE","GOLDEN GRILL","PASTAS","SPECIALTY SALADS","THE BIG C"]]
    let crossroadsW = [String]()
    
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

}

