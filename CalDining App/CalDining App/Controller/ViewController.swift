//
//  ViewController.swift
//  CalDining App
//
//  Created by Jagpinder Singh on 4/8/18.
//  Copyright © 2018 Jagpinder, Manan, Winston. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var clearAll: UIButton!
    @IBOutlet weak var saveSelected: UIButton!
    @IBOutlet weak var menuTable: UITableView!
    
    let halls = ["Crossroads", "Cafe 3", "Foothill", "Clark Kerr"]

    var selectedCells: [String] = []
    var selectedCellsWeights: [Double] = []
    var selectedCellsDict = [String: Double]()
    var checked = [Bool]()
    var checkedRows = [IndexPath]()
    var todaysDate: String = ""
    
    let currentUser = User()
    let mainController = MainController()
    let defaults = UserDefaults.standard
    let menuList = ["Achiote Rubbed Beef", "Amaranth Mushroom Risotto", "Apple Cinnamon Muffin", "Apple Pie", "Aromatic Organic Chickpea Soup", "Arrabiata Sauce", "Artichoke Ham Pizza", "Assorted Danish", "Assorted Pastries", "BBQ Beef Brisket", "BBQ Beef Brisket KOSHER", "BBQ Chicken", "BBQ Chicken Pizza", "BBQ Pork Sandwich", "BBQ Pork Spareribs", "BBQ Sandwich w/ Onion Rings & Coleslaw", "Bacon", "Bacon Cheddar Burger", "Baked Ham", "Baked Potato Bar", "Balsamic Glazed Brussels Sprouts", "Banana King Smoothie", "Banana Muffin", "Beans and Kale", "Bear Muffin", "Beef Bolognese Sauce", "Beef Burger", "Beef Burgundy", "Beef Fajitas", "Beef Hot Dog", "Beef Meatballs", "Beef Steamship Round", "Beef Stew", "Beef Tacos", "Bianca Flatbread", "Bibimbap Bar", "Biscuits & Sausage Gravy", "Black Bean & Corn Salad", "Black Bean Burger", "Black Beans", "Black Eyed Pea Stew", "Blackberry Pie", "Blackened Pollock", "Blackened Tilapia with Lemon Pepper", "Blackeyed Peas", "Blueberry Banana Smoothie", "Blueberry Blintz", "Blueberry Muffin", "Blueberry Pancakes", "Blueberry Scone", "Blueberry Smoothie", "Boca Burger", "Braised Chard", "Braised Garbanzo Beans", "Braised Spinach and Tomato", "Breadsticks", "Breakfast Bar", "Breakfast Burrito", "Breakfast Polenta", "Breakfast Sausage Pizzeta", "Breakfast Veggie Patty", "Broccoli & Cauliflower", "Broccoli & Tomato Salad", "Broccoli Cauliflower & Carrots", "Broccoli Cheddar Soup", "Brown Rice", "Buffalo Chicken Pizza", "Bulgogi Veggie Stir Fry", "Burrito Bar", "Buttery Mashed Potatoes", "Cabbage Pineapple Coconut Blend", "Caesar Salad", "Cajun Jambalaya with Andouille Chicken", "Cajun Potatoes", "Cajun Salmon", "Canadian Bacon Eggs Benedict", "Capirotada", "Carmelized Onion with Marinated Tempeh Flatbread", "Carrot Cake", "Carrot Raisin Salad", "Cauliflower Fried Rice", "Chana Masala", "Cheese & Garlic Oil Flatbread", "Cheese Flatbread", "Cheese Pizza", "Cheese Quesadilla", "Cheese and Pesto Flatbread Pizza", "Cheese and Pesto Pizza", "Cherry Pie", "Chicken Dumpling Soup", "Chicken Fajitas", "Chicken Noodle Soup", "Chicken Nugget", "Chicken Quesadilla", "Chicken Teriyaki", "Chicken Tikka Masala", "Chicken Vindaloo", "Chicken w/ Caper Sauce", "Chicken with Garlic Butter Sauce", "Chickenless Fajitas", "Chickenless Piccata", "Chickenless Tenders", "Chilaquiles", "Chili", "Chili Con Carne", "Chipotle Crusted Turkey", "Chipotle Lime Pollock", "Chocolate Banana Smoothie", "Chocolate Cake", "Chocolate Chip Cookies", "Chocolate Chip Muffin", "Chocolate Chip Pancakes", "Chocolate Chunk Brownie", "Chocolate Raspberry Smoothie", "Chocolate Strawberry Smoothie", "Cilantro Lime Rice", "Cinnamon Glazed Carrot", "Cinnamon Roasted Butternut Squash", "Cinnamon Roll Pancakes", "Citrus Glazed Pork Loin", "Cobb Salad", "Coconut Creamed Spinach", "Coconut Curry Chicken", "Coconut Pineapple Smoothie", "Coconut Rice", "Coconut Tofu", "Cod Veracruz", "Cod w/ Olive Tapanade", "Cod with Sun Dried Tomato Pistou", "Corn Cob", "Corn Succotash", "Corn Tortillas", "Cornbread", "Couscous Salad", "Cranberry Orange Scone", "Cranberry Sauce", "Creamy Alfredo Sauce", "Creamy Mango Banana Smoothie", "Crispy Chicken Tenders", "Cucumber Tomato & Corn Salad", "Curried Cauliflower", "Deli Bar", "Dijon Herbed Salmon", "Dirty Rice", "Dolmas", "Dry Fried Bean Greens", "Edamame & Corn Salad", "Egg & Cheese Strata", "Egg Noodles", "Egg Salad Sandwich", "Egg Spinach & Cheese Croissant", "Eggplant Parmesan", "Fajita Blend", "Falafel Bar", "Fish Cacciatore", "Fish Sandwich", "Fish Vindaloo", "Flour Tortilla", "Flourless Chocolate Torte", "Fragrant Basmati Rice", "French Fries", "Fried Catfish Remoulade", "Fried Catfish with Tartar Sauce", "Fried Chicken", "Fried Okra", "Fried Plantains", "Fried Plantains w/ Granola & Berries", "Garbanzo & Roasted Pepper Salad", "Garbanzo Bean and Cherry Tomato Salad", "Garbanzo Bean with Fava Beans & Edamame", "Garden Burger", "Garden Pasta Salad", "Garden Vegetable Soup with Tomato", "Garlic Fries", "Garlic Ginger Bok Choy", "Garlic Green Beans", "Garlic Kale", "Garlic Noodles", "German Chocolate Cake", "Glazed Carrots", "Godfather Pizza", "Greek Chicken Pizza", "Greek Salad", "Green Bean Sautee", "Grilled Cheese Sandwich", "Grilled Ham & Cheese Sandwich", "Grilled Salmon w Lemon", "Grilled Tri Tip w/ Chimichurri Sauce", "Ground Beef Stuffed Peppers", "Guava Smoothie", "Ham Egg & Cheese Biscuit", "Ham and Cheddar Croissant", "Harissa Chicken", "Hashbrown Patty", "Hashbrown Tri Patty", "Hashbrowns", "Hawaiian BBQ Pork", "Hawaiian Pizza", "Heath Toffee Crunch Blondie", "Herb Crusted Pollock", "Herb Crusted Salmon", "Herb Roasted Chicken", "Herbed Marinara Sauce", "Herbed Polenta", "Homemade Tomato Soup", "Honey Lemon Pork Loin", "Hot Dog", "Housemade BBQ Potato Chips", "Housemade Lemon Pepper Potato Chips", "Huli Huli Chicken", "Ice Cream Bar", "Imm Jaddara Rice & Lentils", "Italian Wedding Soup", "Jamaican Jerk Chicken", "Jasmine Rice", "Jeweled Rice", "Kamut Pilaf", "Kimchi", "Kimchi Fried Rice", "Kimchi Fries Bar", "Korean Fried Chicken", "Korean Fried Tofu", "Korean Kimchi Fries", "Kosher Delicatessen", "Kosher Mediterranean Bar", "Lamb & Apricot Stew", "Lemon Baked Tilapia", "Lentil Bolognese Sauce", "Lentil Soup", "Loaded Potato Soup", "Local Salad Bar", "Luscious Lemon Bar", "Macaroni & Cheese", "Macaroni Salad", "Make Your Own Sundae", "Malibu Burger", "Margherita Flatbread Pizza", "Margherita Pizza", "Marinara Meatball Sauce", "Marinated Bulgogi Beef  Bowl", "Marinated Vegetable Salad", "Mashed Potato Bowl", "Mashed Potatoes w/ Gravy", "Mashed Potatoes w/ Olive Oil", "Meat Lasagna", "Meat Lovers Pizza", "Meat Sauce", "Meatball & Pepperoni Sub Sandwich", "Meatless \"Beef\" & Broccoli Teriyaki", "Meatloaf w/ Tomato Glaze", "Mexicali Corn", "Mexican Home Fries", "Millet Casserole", "Minestrone Soup", "Miso Glazed Tilapia", "Mojo Chicken", "Mongolian Noodle", "Mongolian Noodles with Beef", "Mongolian Stir Fry", "Moroccan Blend Vegetables", "Moroccan Freekeh w/ Chickpeas", "Mung Bean Congee", "Mushroom & Olive Flatbread", "Mushroom & Spinach Pizza", "Mushroom Barley Risotto", "Mushroom Flatbread", "Mushroom Gravy", "Mushroom Palooza Pizza", "Naan Bread", "Nacho Bar", "New England Clam Chowder", "Oatmeal Raisin Cookies", "Obrera Pizza", "Omelet Bar", "Onion & Pepper Flatbread", "Onion & Pepper Pizza", "Onion Arugula and Asiago Flatbread", "Onion and Arugula Flatbread Pizza", "Orange Blintz", "Orange Chicken", "Orange Tofu", "Organic Spicy Tomato Garlic Soup", "Organic Split Pea Kale Soup", "Orzo Salad with Carrots", "Oski Burger", "Oven Roasted Turkey Breast", "Pan-fried Potatoes and Peppers", "Pancakes", "Parmesan Cheese Sub Sandwich", "Parslied Baby Carrots", "Parslied Potatoes", "Pasta", "Peach Pie", "Peach Smoothie", "Peas", "Peas & Carrots", "Peas & Pearl Onion", "Peas with Mint", "Pecan Pie", "Penne Pasta", "Penne Pasta w/ Shrimp & Chipotle Cream Sauce", "Pepper Rubbed Kalua Pork", "Pepperoni Pizza", "Pesto Alfredo Sauce", "Pesto Sauce", "Pesto Sun Dried Tomato Flatbread", "Philly Cheesesteak Sandwich", "Pho Bar", "Pho Bar w/ Meat", "Piccata", "Pickles", "Pineapple Pepper Flatbread", "Pollock with Ginger, Garlic, Cilantro", "Pork Chile Verde", "Pork Cubano Sandwich", "Pork Patty", "Pork Schnitzel", "Potato & Garbanzo Stew", "Potato Salad", "Potato Wedges", "Pumpkin Pie", "Puttanesca Flatbread", "Puttanesca Sauce", "Quinoa Pilaf", "Quinoa Stew", "Rajma", "Ramen Bar", "Raspberry Orange Smoothie", "Raspberry Sammie", "Red Sauc Cheese Flatbread", "Reuben Sandwich", "Rice Pilaf", "Roasted Broccoli w/Garlic", "Roasted Brussels Sprouts", "Roasted Carrots", "Roasted Cauliflower with Garlic and Asiago", "Roasted Corn", "Roasted Eggplant", "Roasted Ham", "Roasted Linguica", "Roasted Mexican Vegetables", "Roasted Pork Loin", "Roasted Potatoes", "Roasted Red & Gold Beets", "Roasted Red Potatoes", "Roasted Red Potatoes w/ Garlic", "Roasted Salmon", "Roasted Salmon w/ Olive Tapenade", "Roasted Squash with Edamame", "Roasted Sweet Potato", "Roasted Sweet Potato with Brown Sugar", "Roasted Tomato w/ Garlic", "Roasted Vegetable Root Blend", "Roasted Vegetables", "Roasted Yams", "Roasted Zucchini & Tomatoes", "Roasted Zuchhini Squash Medley", "Rock Cod w/ Olive Tapenade", "Rockfish Yucateco", "Rolled Oatmeal", "Ropa Vieja", "Rosemary Roasted Beef", "Rotisserie Chicken", "Saffron Scented Couscous", "Salad Bar", "Salmon Pineapple Salsa", "Salmon with Mango Salsa", "Sausage & Onion Pizza", "Sausage Garlic Onion Pizza", "Sausage Peppers & Onion Flatbread", "Sausage Pizza", "Sauteed Chard", "Sauteed Green Beans", "Sauteed Kale w/Onion and Mushroom", "Sauteed Zucchini", "Sauteed Zucchini and Onions", "Savory Tofu, Spinach, Tomato Scramble", "Scrambled Eggs", "Scrambled Eggs with Spinach & Tomato", "Seasoned Collard Greens", "Sesame Brown Rice with Green Onion", "Sesame Spiced Green Beans", "Shoestring Fries", "Shrimp Fried Rice", "Shrimp Sausage Gumbo", "Shrimp Scallop Pasta Teresa", "Smoked Salmon Eggs Benedict", "Sole with Garlic Butter", "Sopes Bar", "Soyrizo Scramble", "Soyrizo Taco Flatbread Pizza", "Spanish Rice (Brown)", "Spiced French Toast", "Spicy Chicken Sandwich", "Spicy Eggplant", "Spicy Szechuan Chicken", "Spicy Thai Noodles", "Spicy Tofu & Spelt Salad", "Spicy Waffle Fries", "Spinach & Feta Salad", "Spinach & Mushroom Flatbread", "Spinach Feta Olive Flatbread Pizza", "Spinach and Cheese Croissant", "Spinach, Mushroom, Sundried Tomato Flatbread", "Steak Fries", "Steamed Bok Choy", "Steamed Broccoli", "Steamed Carrots", "Steamed Cauliflower", "Steamed Corn", "Steamed Edamame", "Steamed Rice", "Steamed Tilapia with Cilantro Pesto", "Stir Fry Tofu with Vegetables", "Stir Fry Vegetable Noodles", "Strawberry Kiwi Smoothie", "Suateed Cabbage", "Sugar Cookies", "Sumi Salad", "Sunflower Cutlet Sandwich", "Sushi Bowl Bar", "Sweet Potato Chipotle Soup", "Sweet Potato Fries", "Sweet Potato Tots", "Taco w/ Soyrizo Flatbread", "Tandoori Roasted Vegetables", "Taquitos", "Tarka Dal", "Tater Tots", "Teriyaki Tofu", "Thai Marinated Rock Cod", "Thai Sandwich", "Three Bean Chili", "Tilapia w/ Meuniere Sauce", "Tilapia with Garlic Butter", "Tilapia with Green Harissa", "Tilapia with Thai Sweet Chili Butter Sauce", "Toffee Caramel Scone", "Tofu Broccoli & Tomato Stir Fry", "Tofu Sausage Rumble", "Tofu Szechuan", "Tomato Cous Cous Salad", "Tomato Pesto Flatbread", "Tomato Salad", "Tomato Spinach & Cheese Scramble", "Tortilla Chips with Salsa", "Tostada Bar", "Triple Berry Smoothie", "Tuna Sandwich", "Tunisian Stew", "Tunisian Vegetable Stew", "Turkey Corn Dog", "Turkey Links", "Turkey Patty Egg & Cheese Muffin", "Turkey Sausage Patty", "Tutti Frutti Smoothie", "Vegan Celebration Roast", "Vegan Meatloaf", "Vegan New Orleans Stew", "Vegan Tofu Picante Fajitas", "Vegan Tomato Basil Flatbread", "Vegan/Gluten Free Pasta", "Vegetable Caribbean Blend", "Vegetable Chow Mein", "Vegetable Deluxe Flatbread", "Vegetable Deluxe Pizza", "Vegetable Eggroll", "Vegetable Jambalaya", "Vegetable Lavash Wrap", "Vegetable Lavash Wrap with Cucumber and Feta", "Vegetable Pakoras", "Vegetable Potsticker", "Vegetable Riviera Blend", "Vegetable Samosa", "Vegetable Stir Fry", "Vegetarian \"Meatball\" Sub", "Vegetarian Bibimbap Bowl", "Vegetarian Burrito Bar", "Vegetarian Fried Rice", "Vegetarian Meatlovers Pizza", "Vegetarian Sausage Peppers Onion Pizza", "Waffle Bar Toppings", "Waffles", "Warm Potato Salad", "Wellness Stew", "White Beans w Oregano & Garlic", "White Beans w/ Polenta", "Whole Wheat Dinner Rolls", "Whole Wheat Pasta", "Wild Rice", "Wild Rice Pilaf", "World`s Best Smoothie", "Zucchini Combo Salad", "Zuchini and Mushrooms"]
    
    let menuListWeights = [1.5, 1.5, 0.5, 0.5, 1, 1, 1, 0.5, 0.5, 1.5, 1.5, 1.5, 1, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1, 1, 0.75, 0.5, 1.5, 1.5, 1, 1.5, 1.5, 1.5, 1.5, 1, 1.5, 1.5, 1.5, 1, 1.5, 1.5, 1, 1.5, 1.5, 1.5, 0.5, 1, 1.5, 1.5, 0.75, 1.5, 0.5, 1.5, 0.5, 0.75, 1.5, 1.5, 1, 1.5, 1, 1.5, 1.5, 1.5, 1.5, 1.5, 1, 1, 1.5, 1, 1, 1, 1.5, 1.5, 1, 1.5, 1, 1.5, 1.5, 1.5, 1.5, 1.5, 1, 0.5, 1, 1.5, 1.5, 1, 1, 1, 1.5, 1, 1, 0.5, 1, 1, 1, 1.5, 1.5, 1.5, 1.5, 1.5, 1, 1, 1.5, 1.5, 1.5, 1.5, 1, 1.5, 1.5, 1, 0.75, 0.5, 0.5, 0.5, 1.5, 0.5, 0.75, 0.75, 1.5, 1.5, 1.5, 1.5, 1.5, 1, 1.5, 1.5, 0.75, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1, 0.5, 1, 1, 0.75, 1.5, 1, 1, 1, 1.5, 1.5, 1.5, 1.5, 1, 1.5, 1.5, 1.5, 1.5, 1, 1.5, 1.5, 1.5, 1.5, 1, 1, 0.5, 1.5, 1.5, 1, 1.5, 1.5, 1, 1.5, 1.5, 1, 1, 1.5, 1.5, 1, 1, 1, 1.5, 1, 1.5, 1.5, 0.5, 1.5, 1, 1, 1, 1.5, 1.5, 1.5, 1.5, 1, 1, 0.75, 1.5, 1.5, 1, 1.5, 1.5, 1.5, 1.5, 1, 0.5, 1, 1, 1.5, 1, 1.5, 1, 1.5, 1.5, 1.5, 1.5, 1.5, 1, 1.5, 1, 1.5, 1.5, 1.5, 1.5, 1.5, 1, 1, 1, 1.5, 1.5, 1.5, 1.5, 1.5, 1, 1, 1, 1, 1.5, 0.5, 1, 1, 1.5, 1, 1, 1, 1, 1.5, 1, 1.5, 1.5, 1.5, 1, 1, 1, 1.5, 1, 1.5, 1, 1.5, 1.5, 1, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1, 1.5, 1, 1, 1.5, 1, 1.5, 1, 1, 1.5, 1, 0.5, 1, 1, 1, 1, 1, 1, 1.5, 1.5, 1, 1, 1, 1, 1, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1, 0.5, 0.75, 1.5, 1.5, 1.5, 1, 0.5, 1, 1.5, 1.5, 1, 1, 1, 1, 1.5, 1.5, 1.5, 1.5, 1.5, 1, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 0.5, 1, 1, 1, 1.5, 1, 1, 0.75, 0.5, 1, 1.5, 1, 1.5, 1.5, 1, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1, 1.5, 1, 1.5, 1.5, 1.5, 1.5, 1, 1, 1.5, 1.5, 1.5, 1.5, 1.5, 0.5, 1.5, 1, 1.5, 1.5, 1, 1.5, 1.5, 1, 1, 1, 1, 1, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1, 1.5, 1.5, 1.5, 1.5, 1.5, 1, 1, 1.5, 1.5, 1, 1.5, 1, 1, 1.5, 1, 1, 1, 1.5, 1, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1, 1.5, 1, 1.5, 0.75, 1.5, 0.5, 1, 1.5, 1.5, 1, 1.5, 1.5, 1, 1, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 0.5, 1.5, 1.5, 1.5, 1, 1, 1, 1.5, 1.5, 1, 0.75, 1.5, 1.5, 1, 1.5, 1.5, 1.5, 1.5, 0.75, 1, 1, 1.5, 1, 1, 1.5, 1.5, 1.5, 1, 1, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1, 1.5, 1.5, 1.5, 1, 1, 1, 0.5, 0.5, 1, 1.5, 1.5, 1.5, 1, 1, 1.5, 1.5, 0.75, 1, 1.5]
    var isCleared = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if defaults.object(forKey: "isCleared") != nil {
            isCleared = defaults.object(forKey: "isCleared") as? Bool ?? Bool()
        }
        menuTable.delegate = self
        menuTable.dataSource = self
        menuTable.allowsMultipleSelection = true
        selectedCells = defaults.object(forKey: "selectedCells") as? [String] ?? [String]()
        
        if isCleared == false && selectedCells.isEmpty == false {
            checked = defaults.object(forKey: "checked") as? [Bool] ?? [Bool]()
            selectedCells = defaults.object(forKey: "selectedCells") as? [String] ?? [String]()
            selectedCellsWeights = defaults.object(forKey: "selectedCellsWeights") as? [Double] ?? [Double]()
            selectedCellsDict = defaults.object(forKey: "selectedCellsDict") as? [String : Double] ?? [String : Double]()

            let selected = defaults.object(forKey: "selectedRows") as! Data
            checkedRows = NSKeyedUnarchiver.unarchiveObject(with: selected) as! [IndexPath]

            for indexPath in checkedRows {
                menuTable.selectRow(at: (indexPath as NSIndexPath) as IndexPath, animated: true, scrollPosition: UITableViewScrollPosition.none)
                menuTable.cellForRow(at: indexPath)?.accessoryType = .checkmark
            }
        } else {
            checked = [Bool](repeating: false, count:menuList.count)
            checkedRows = [IndexPath]()
        }
        nextButton.layer.cornerRadius = 4
        saveSelected.layer.cornerRadius = 4
        clearAll.layer.cornerRadius = 4
    }
    
    func makeSavedAlert() {
        let savedAlert = UIAlertController(title: "Success!", message: "Your preferences have been updated", preferredStyle: .alert)
        
        let savedAction = UIAlertAction(title: "Right on", style: .default) { (action:UIAlertAction) in
        }
        savedAlert.addAction(savedAction)
        present(savedAlert, animated: true, completion: nil)
    }
    
    func makeClearAlert() {
        let clearAlert = UIAlertController(title: "Success!", message: "Your preferences have been deleted", preferredStyle: .alert)
        
        let clearAction = UIAlertAction(title: "Right on", style: .default) { (action:UIAlertAction) in
        }
        clearAlert.addAction(clearAction)
        present(clearAlert, animated: true, completion: nil)
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = menuTable.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = menuList[indexPath.row]
        cell?.textLabel?.highlightedTextColor = UIColor(red:0.00, green:0.44, blue:0.73, alpha:1.0)
        if !checked[indexPath.row] {
            cell?.accessoryType = .none
        } else if checked[indexPath.row] {
            cell?.accessoryType = .checkmark
        }
        return cell!
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if let cell = tableView.cellForRow(at: indexPath) {
            if cell.accessoryType == .checkmark {
                cell.accessoryType = .none
                checked[indexPath.row] = false
            } else {
                cell.accessoryType = .checkmark
                checked[indexPath.row] = true
            }
        }
        
        //currentUser.myPreferences.append(menuList[indexPath.row])
        selectedCells.append(menuList[indexPath.row])
        selectedCellsWeights.append(menuListWeights[indexPath.row])
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {

        if let cell = tableView.cellForRow(at: indexPath) {
            if cell.accessoryType == .checkmark {
                cell.accessoryType = .none
                checked[indexPath.row] = false
            } else {
                cell.accessoryType = .checkmark
                checked[indexPath.row] = true
            }
            let tempIndex = selectedCells.index(of: menuList[indexPath.row])!
            
            //currentUser.myPreferences.remove(at: tempIndex)
            selectedCells.remove(at: tempIndex)
            selectedCellsWeights.remove(at: tempIndex)
        }
    }
        
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Pick the dishes you like below!"
    }

    @IBAction func saveSelectedItems(_ sender: Any) {
        if selectedCells.isEmpty {
            selectedCellsDict.removeAll()
        } else {
            for (key, value) in zip(selectedCells, selectedCellsWeights) {
                selectedCellsDict[key] = value
            }
        }
        defaults.set(selectedCells, forKey: "selectedCells")
        defaults.set(selectedCellsWeights, forKey: "selectedCellsWeights")
        defaults.set(selectedCellsDict, forKey: "selectedCellsDict")
        defaults.set(checked, forKey: "checked")
        if let selectedRows = menuTable.indexPathsForSelectedRows {
            let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: selectedRows)
            defaults.set(encodedData, forKey: "selectedRows")
        }
        defaults.synchronize()
        //mainController.currentUser = currentUser
        isCleared = false
        defaults.set(isCleared, forKey: "isCleared")
        makeSavedAlert()
    }

    @IBAction func clearSelectedItems(_ sender: Any) {
        let domain = Bundle.main.bundleIdentifier!
        defaults.removePersistentDomain(forName: domain)
        defaults.synchronize()
        checked.removeAll(keepingCapacity: true)
        checked = [Bool](repeating: false, count:menuList.count)
        //clear selected rows and checkmarks
        if let selectedRows = menuTable.indexPathsForSelectedRows {
            for indexPath in selectedRows {
                menuTable.deselectRow(at: (indexPath as NSIndexPath) as IndexPath, animated: true)
                menuTable.cellForRow(at: indexPath)?.accessoryType = .none
            }
        }
        isCleared = true
        defaults.set(isCleared, forKey: "isCleared")
        makeClearAlert()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "nextToForecast") {
            let vc = segue.destination as! MainController
            let days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
            vc.daysIndex = days.index(of: currentUser.todaysDate)!
        }
    }
    
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

