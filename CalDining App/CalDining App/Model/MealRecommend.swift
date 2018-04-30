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
    let weightsDict = ["Achiote Rubbed Beef": 1.5, "Amaranth Mushroom Risotto": 1.5, "Apple Cinnamon Muffin": 0.5, "Apple Pie": 0.5, "Aromatic Organic Chickpea Soup": 1, "Arrabiata Sauce": 1, "Artichoke Ham Pizza": 1, "Assorted Danish": 0.5, "Assorted Pastries": 0.5, "BBQ Beef Brisket": 1, "BBQ Beef Brisket KOSHER": 1.5, "BBQ Chicken": 1.5, "BBQ Chicken Pizza": 1, "BBQ Pork Sandwich": 1.5, "BBQ Pork Spareribs": 1.5, "BBQ Sandwich w/ Onion Rings & Coleslaw": 1.5, "Bacon": 1.5, "Bacon Cheddar Burger": 1.5, "Baked Ham": 1.5, "Baked Potato Bar": 1, "Balsamic Glazed Brussels Sprouts": 1, "Banana King Smoothie": 0.75, "Banana Muffin": 0.5, "Beans and Kale": 1.5, "Bear Muffin": 1.5, "Beef Bolognese Sauce": 1, "Beef Burger": 1.5, "Beef Burgundy": 1.5, "Beef Fajitas": 1.5, "Beef Hot Dog": 1.5, "Beef Meatballs": 1, "Beef Steamship Round": 1.5, "Beef Stew": 1.5, "Beef Tacos": 1.5, "Bianca Flatbread": 1, "Bibimbap Bar": 1.5, "Biscuits & Sausage Gravy": 1.5, "Black Bean & Corn Salad": 1, "Black Bean Burger": 1.5, "Black Beans": 1.5, "Black Eyed Pea Stew": 1.5, "Blackberry Pie": 0.5, "Blackened Pollock": 1, "Blackened Tilapia with Lemon Pepper": 1.5, "Blackeyed Peas": 1.5, "Blueberry Banana Smoothie": 0.75, "Blueberry Blintz": 1.5, "Blueberry Muffin": 0.5, "Blueberry Pancakes": 1.5, "Blueberry Scone": 0.5, "Blueberry Smoothie": 0.75, "Boca Burger": 1.5, "Braised Chard": 1.5, "Braised Garbanzo Beans": 1, "Braised Spinach and Tomato": 1.5, "Breadsticks": 1, "Breakfast Bar": 1.5, "Breakfast Burrito": 1.5, "Breakfast Polenta": 1.5, "Breakfast Sausage Pizzeta": 1.5, "Breakfast Veggie Patty": 1.5, "Broccoli & Cauliflower": 1, "Broccoli & Tomato Salad": 1, "Broccoli Cauliflower & Carrots": 1.5, "Broccoli Cheddar Soup": 1, "Brown Rice": 1, "Buffalo Chicken Pizza": 1, "Bulgogi Veggie Stir Fry": 1.5, "Burrito Bar": 1.5, "Buttery Mashed Potatoes": 1, "Cabbage Pineapple Coconut Blend": 1.5, "Caesar Salad": 1, "Cajun Jambalaya with Andouille Chicken": 1.5, "Cajun Potatoes": 1.5, "Cajun Salmon": 1.5, "Canadian Bacon Eggs Benedict": 1.5, "Capirotada": 1.5, "Carmelized Onion with Marinated Tempeh Flatbread": 1, "Carrot Cake": 0.5, "Carrot Raisin Salad": 1, "Cauliflower Fried Rice": 1.5, "Chana Masala": 1.5, "Cheese & Garlic Oil Flatbread": 1, "Cheese Flatbread": 1, "Cheese Pizza": 1, "Cheese Quesadilla": 1.5, "Cheese and Pesto Flatbread Pizza": 1, "Cheese and Pesto Pizza": 1, "Cherry Pie": 0.5, "Chicken Dumpling Soup": 1, "Chicken Fajitas": 1, "Chicken Noodle Soup": 1, "Chicken Nugget": 1.5, "Chicken Quesadilla": 1.5, "Chicken Teriyaki": 1.5, "Chicken Tikka Masala": 1.5, "Chicken Vindaloo": 1.5, "Chicken w/ Caper Sauce": 1, "Chicken with Garlic Butter Sauce": 1, "Chickenless Fajitas": 1.5, "Chickenless Piccata": 1.5, "Chickenless Tenders": 1.5, "Chilaquiles": 1.5, "Chili": 1, "Chili Con Carne": 1.5, "Chipotle Crusted Turkey": 1.5, "Chipotle Lime Pollock": 1, "Chocolate Banana Smoothie": 0.75, "Chocolate Cake": 0.5, "Chocolate Chip Cookies": 0.5, "Chocolate Chip Muffin": 0.5, "Chocolate Chip Pancakes": 1.5, "Chocolate Chunk Brownie": 0.5, "Chocolate Raspberry Smoothie": 0.75, "Chocolate Strawberry Smoothie": 0.75, "Cilantro Lime Rice": 1.5, "Cinnamon Glazed Carrot": 1.5, "Cinnamon Roasted Butternut Squash": 1.5, "Cinnamon Roll Pancakes": 1.5, "Citrus Glazed Pork Loin": 1.5, "Cobb Salad": 1, "Coconut Creamed Spinach": 1.5, "Coconut Curry Chicken": 1.5, "Coconut Pineapple Smoothie": 0.75, "Coconut Rice": 1.5, "Coconut Tofu": 1.5, "Cod Veracruz": 1.5, "Cod w/ Olive Tapanade": 1.5, "Cod with Sun Dried Tomato Pistou": 1.5, "Corn Cob": 1.5, "Corn Succotash": 1.5, "Corn Tortillas": 1.5, "Cornbread": 1.5, "Couscous Salad": 1, "Cranberry Orange Scone": 0.5, "Cranberry Sauce": 1, "Creamy Alfredo Sauce": 1, "Creamy Mango Banana Smoothie": 0.75, "Crispy Chicken Tenders": 1.5, "Cucumber Tomato & Corn Salad": 1, "Curried Cauliflower": 1, "Deli Bar": 1, "Dijon Herbed Salmon": 1.5, "Dirty Rice": 1.5, "Dolmas": 1.5, "Dry Fried Bean Greens": 1.5, "Edamame & Corn Salad": 1, "Egg & Cheese Strata": 1.5, "Egg Noodles": 1.5, "Egg Salad Sandwich": 1.5, "Egg Spinach & Cheese Croissant": 1.5, "Eggplant Parmesan": 1, "Fajita Blend": 1.5, "Falafel Bar": 1.5, "Fish Cacciatore": 1.5, "Fish Sandwich": 1.5, "Fish Vindaloo": 1, "Flour Tortilla": 1, "Flourless Chocolate Torte": 0.5, "Fragrant Basmati Rice": 1.5, "French Fries": 1.5, "Fried Catfish Remoulade": 1, "Fried Catfish with Tartar Sauce": 1.5, "Fried Chicken": 1.5, "Fried Okra": 1, "Fried Plantains": 1.5, "Fried Plantains w/ Granola & Berries": 1.5, "Garbanzo & Roasted Pepper Salad": 1, "Garbanzo Bean and Cherry Tomato Salad": 1, "Garbanzo Bean with Fava Beans & Edamame": 1.5, "Garden Burger": 1.5, "Garden Pasta Salad": 1, "Garden Vegetable Soup with Tomato": 1, "Garlic Fries": 1, "Garlic Ginger Bok Choy": 1.5, "Garlic Green Beans": 1, "Garlic Kale": 1.5, "Garlic Noodles": 1.5, "German Chocolate Cake": 0.5, "Glazed Carrots": 1.5, "Godfather Pizza": 1, "Greek Chicken Pizza": 1, "Greek Salad": 1, "Green Bean Sautee": 1.5, "Grilled Cheese Sandwich": 1.5, "Grilled Ham & Cheese Sandwich": 1.5, "Grilled Salmon w Lemon": 1.5, "Grilled Tri Tip w/ Chimichurri Sauce": 1, "Ground Beef Stuffed Peppers": 1, "Guava Smoothie": 0.75, "Ham Egg & Cheese Biscuit": 1.5, "Ham and Cheddar Croissant": 1.5, "Harissa Chicken": 1, "Hashbrown Patty": 1.5, "Hashbrown Tri Patty": 1.5, "Hashbrowns": 1.5, "Hawaiian BBQ Pork": 1.5, "Hawaiian Pizza": 1, "Heath Toffee Crunch Blondie": 0.5, "Herb Crusted Pollock": 1, "Herb Crusted Salmon": 1, "Herb Roasted Chicken": 1.5, "Herbed Marinara Sauce": 1, "Herbed Polenta": 1.5, "Homemade Tomato Soup": 1, "Honey Lemon Pork Loin": 1.5, "Hot Dog": 1.5, "Housemade BBQ Potato Chips": 1.5, "Housemade Lemon Pepper Potato Chips": 1.5, "Huli Huli Chicken": 1.5, "Ice Cream Bar": 1, "Imm Jaddara Rice & Lentils": 1.5, "Italian Wedding Soup": 1, "Jamaican Jerk Chicken": 1.5, "Jasmine Rice": 1.5, "Jeweled Rice": 1.5, "Kamut Pilaf": 1.5, "Kimchi": 1.5, "Kimchi Fried Rice": 1, "Kimchi Fries Bar": 1, "Korean Fried Chicken": 1, "Korean Fried Tofu": 1.5, "Korean Kimchi Fries": 1.5, "Kosher Delicatessen": 1.5, "Kosher Mediterranean Bar": 1.5, "Lamb & Apricot Stew": 1.5, "Lemon Baked Tilapia": 1, "Lentil Bolognese Sauce": 1, "Lentil Soup": 1, "Loaded Potato Soup": 1, "Local Salad Bar": 1.5, "Luscious Lemon Bar": 0.5, "Macaroni & Cheese": 1, "Macaroni Salad": 1, "Make Your Own Sundae": 1.5, "Malibu Burger": 1, "Margherita Flatbread Pizza": 1, "Margherita Pizza": 1, "Marinara Meatball Sauce": 1, "Marinated Bulgogi Beef  Bowl": 1.5, "Marinated Vegetable Salad": 1, "Mashed Potato Bowl": 1.5, "Mashed Potatoes w/ Gravy": 1.5, "Mashed Potatoes w/ Olive Oil": 1.5, "Meat Lasagna": 1, "Meat Lovers Pizza": 1, "Meat Sauce": 1, "Meatball & Pepperoni Sub Sandwich": 1.5, "Meatless \"Beef\" & Broccoli Teriyaki": 1, "Meatloaf w/ Tomato Glaze": 1.5, "Mexicali Corn": 1, "Mexican Home Fries": 1.5, "Millet Casserole": 1.5, "Minestrone Soup": 1, "Miso Glazed Tilapia": 1.5, "Mojo Chicken": 1.5, "Mongolian Noodle": 1.5, "Mongolian Noodles with Beef": 1.5, "Mongolian Stir Fry": 1.5, "Moroccan Blend Vegetables": 1.5, "Moroccan Freekeh w/ Chickpeas": 1, "Mung Bean Congee": 1.5, "Mushroom & Olive Flatbread": 1, "Mushroom & Spinach Pizza": 1, "Mushroom Barley Risotto": 1.5, "Mushroom Flatbread": 1, "Mushroom Gravy": 1.5, "Mushroom Palooza Pizza": 1, "Naan Bread": 1, "Nacho Bar": 1.5, "New England Clam Chowder": 1, "Oatmeal Raisin Cookies": 0.5, "Obrera Pizza": 1, "Omelet Bar": 1, "Onion & Pepper Flatbread": 1, "Onion & Pepper Pizza": 1, "Onion Arugula and Asiago Flatbread": 1, "Onion and Arugula Flatbread Pizza": 1, "Orange Blintz": 1.5, "Orange Chicken": 1.5, "Orange Tofu": 1, "Organic Spicy Tomato Garlic Soup": 1, "Organic Split Pea Kale Soup": 1, "Orzo Salad with Carrots": 1, "Oski Burger": 1, "Oven Roasted Turkey Breast": 1.5, "Pan-fried Potatoes and Peppers": 1.5, "Pancakes": 1.5, "Parmesan Cheese Sub Sandwich": 1.5, "Parslied Baby Carrots": 1.5, "Parslied Potatoes": 1.5, "Pasta": 1, "Peach Pie": 0.5, "Peach Smoothie": 0.75, "Peas": 1.5, "Peas & Carrots": 1.5, "Peas & Pearl Onion": 1.5, "Peas with Mint": 1, "Pecan Pie": 0.5, "Penne Pasta": 1, "Penne Pasta w/ Shrimp & Chipotle Cream Sauce": 1.5, "Pepper Rubbed Kalua Pork": 1.5, "Pepperoni Pizza": 1, "Pesto Alfredo Sauce": 1, "Pesto Sauce": 1, "Pesto Sun Dried Tomato Flatbread": 1, "Philly Cheesesteak Sandwich": 1.5, "Pho Bar": 1.5, "Pho Bar w/ Meat": 1.5, "Piccata": 1.5, "Pickles": 1.5, "Pineapple Pepper Flatbread": 1, "Pollock with Ginger, Garlic, Cilantro": 1.5, "Pork Chile Verde": 1.5, "Pork Cubano Sandwich": 1.5, "Pork Patty": 1.5, "Pork Schnitzel": 1.5, "Potato & Garbanzo Stew": 1.5, "Potato Salad": 1.5, "Potato Wedges": 1.5, "Pumpkin Pie": 0.5, "Puttanesca Flatbread": 1, "Puttanesca Sauce": 1, "Quinoa Pilaf": 1, "Quinoa Stew": 1.5, "Rajma": 1, "Ramen Bar": 1, "Raspberry Orange Smoothie": 0.75, "Raspberry Sammie": 0.5, "Red Sauc Cheese Flatbread": 1, "Reuben Sandwich": 1.5, "Rice Pilaf": 1, "Roasted Broccoli w/Garlic": 1.5, "Roasted Brussels Sprouts": 1.5, "Roasted Carrots": 1, "Roasted Cauliflower with Garlic and Asiago": 1.5, "Roasted Corn": 1.5, "Roasted Eggplant": 1.5, "Roasted Ham": 1.5, "Roasted Linguica": 1.5, "Roasted Mexican Vegetables": 1.5, "Roasted Pork Loin": 1.5, "Roasted Potatoes": 1.5, "Roasted Red & Gold Beets": 1.5, "Roasted Red Potatoes": 1.5, "Roasted Red Potatoes w/ Garlic": 1, "Roasted Salmon": 1.5, "Roasted Salmon w/ Olive Tapenade": 1, "Roasted Squash with Edamame": 1.5, "Roasted Sweet Potato": 1.5, "Roasted Sweet Potato with Brown Sugar": 1.5, "Roasted Tomato w/ Garlic": 1.5, "Roasted Vegetable Root Blend": 1, "Roasted Vegetables": 1, "Roasted Yams": 1.5, "Roasted Zucchini & Tomatoes": 1.5, "Roasted Zuchhini Squash Medley": 1.5, "Rock Cod w/ Olive Tapenade": 1.5, "Rockfish Yucateco": 1.5, "Rolled Oatmeal": 0.5, "Ropa Vieja": 1.5, "Rosemary Roasted Beef": 1, "Rotisserie Chicken": 1.5, "Saffron Scented Couscous": 1.5, "Salad Bar": 1, "Salmon Pineapple Salsa": 1.5, "Salmon with Mango Salsa": 1.5, "Sausage & Onion Pizza": 1, "Sausage Garlic Onion Pizza": 1, "Sausage Peppers & Onion Flatbread": 1, "Sausage Pizza": 1, "Sauteed Chard": 1, "Sauteed Green Beans": 1.5, "Sauteed Kale w/Onion and Mushroom": 1.5, "Sauteed Zucchini": 1.5, "Sauteed Zucchini and Onions": 1.5, "Savory Tofu, Spinach, Tomato Scramble": 1.5, "Scrambled Eggs": 1.5, "Scrambled Eggs with Spinach & Tomato": 1.5, "Seasoned Collard Greens": 1.5, "Sesame Brown Rice with Green Onion": 1.5, "Sesame Spiced Green Beans": 1.5, "Shoestring Fries": 1.5, "Shrimp Fried Rice": 1.5, "Shrimp Sausage Gumbo": 1, "Shrimp Scallop Pasta Teresa": 1.5, "Smoked Salmon Eggs Benedict": 1.5, "Sole with Garlic Butter": 1.5, "Sopes Bar": 1.5, "Soyrizo Scramble": 1.5, "Soyrizo Taco Flatbread Pizza": 1, "Spanish Rice (Brown)": 1, "Spiced French Toast": 1.5, "Spicy Chicken Sandwich": 1.5, "Spicy Eggplant": 1, "Spicy Szechuan Chicken": 1.5, "Spicy Thai Noodles": 1, "Spicy Tofu & Spelt Salad": 1, "Spicy Waffle Fries": 1.5, "Spinach & Feta Salad": 1, "Spinach & Mushroom Flatbread": 1, "Spinach Feta Olive Flatbread Pizza": 1, "Spinach and Cheese Croissant": 1.5, "Spinach, Mushroom, Sundried Tomato Flatbread": 1, "Steak Fries": 1.5, "Steamed Bok Choy": 1.5, "Steamed Broccoli": 1.5, "Steamed Carrots": 1.5, "Steamed Cauliflower": 1.5, "Steamed Corn": 1.5, "Steamed Edamame": 1.5, "Steamed Rice": 1, "Steamed Tilapia with Cilantro Pesto": 1.5, "Stir Fry Tofu with Vegetables": 1, "Stir Fry Vegetable Noodles": 1.5, "Strawberry Kiwi Smoothie": 0.75, "Suateed Cabbage": 1.5, "Sugar Cookies": 0.5, "Sumi Salad": 1, "Sunflower Cutlet Sandwich": 1.5, "Sushi Bowl Bar": 1.5, "Sweet Potato Chipotle Soup": 1, "Sweet Potato Fries": 1.5, "Sweet Potato Tots": 1.5, "Taco w/ Soyrizo Flatbread": 1, "Tandoori Roasted Vegetables": 1, "Taquitos": 1.5, "Tarka Dal": 1.5, "Tater Tots": 1.5, "Teriyaki Tofu": 1.5, "Thai Marinated Rock Cod": 1.5, "Thai Sandwich": 1.5, "Three Bean Chili": 1.5, "Tilapia w/ Meuniere Sauce": 1.5, "Tilapia with Garlic Butter": 1.5, "Tilapia with Green Harissa": 1.5, "Tilapia with Thai Sweet Chili Butter Sauce": 1.5, "Toffee Caramel Scone": 0.5, "Tofu Broccoli & Tomato Stir Fry": 1.5, "Tofu Sausage Rumble": 1.5, "Tofu Szechuan": 1.5, "Tomato Cous Cous Salad": 1, "Tomato Pesto Flatbread": 1, "Tomato Salad": 1, "Tomato Spinach & Cheese Scramble": 1.5, "Tortilla Chips with Salsa": 1.5, "Tostada Bar": 1, "Triple Berry Smoothie": 0.75, "Tuna Sandwich": 1.5, "Tunisian Stew": 1.5, "Tunisian Vegetable Stew": 1, "Turkey Corn Dog": 1.5, "Turkey Links": 1.5, "Turkey Patty Egg & Cheese Muffin": 1.5, "Turkey Sausage Patty": 1.5, "Tutti Frutti Smoothie": 0.75, "Vegan Celebration Roast": 1, "Vegan Meatloaf": 1, "Vegan New Orleans Stew": 1.5, "Vegan Tofu Picante Fajitas": 1, "Vegan Tomato Basil Flatbread": 1, "Vegan/Gluten Free Pasta": 1.5, "Vegetable Caribbean Blend": 1.5, "Vegetable Chow Mein": 1.5, "Vegetable Deluxe Flatbread": 1, "Vegetable Deluxe Pizza": 1, "Vegetable Eggroll": 1.5, "Vegetable Jambalaya": 1.5, "Vegetable Lavash Wrap": 1.5, "Vegetable Lavash Wrap with Cucumber and Feta": 1.5, "Vegetable Pakoras": 1.5, "Vegetable Potsticker": 1.5, "Vegetable Riviera Blend": 1.5, "Vegetable Samosa": 1.5, "Vegetable Stir Fry": 1, "Vegetarian \"Meatball\" Sub": 1.5, "Vegetarian Bibimbap Bowl": 1.5, "Vegetarian Burrito Bar": 1.5, "Vegetarian Fried Rice": 1, "Vegetarian Meatlovers Pizza": 1, "Vegetarian Sausage Peppers Onion Pizza": 1, "Waffle Bar Toppings": 0.5, "Waffles": 0.5, "Warm Potato Salad": 1, "Wellness Stew": 1.5, "White Beans w Oregano & Garlic": 1.5, "White Beans w/ Polenta": 1.5, "Whole Wheat Dinner Rolls": 1, "Whole Wheat Pasta": 1, "Wild Rice": 1.5, "Wild Rice Pilaf": 1.5, "World`s Best Smoothie": 0.75, "Zucchini Combo Salad": 1, "Zuchini and Mushrooms": 1.5]
    let crossroadsMF = ["Breakfast":["BEAR FIT","BEAR FUSION","HOT MORNING GRAINS","SMOOTHIES","THE BIG C"], "Lunch": ["BEAR FIT","BEAR FUSION","BEAR NECESSITIES","BEAR SWEETS","CAL-ZONE","GOLDEN GRILL","PASTAS","SPECIALTY SALADS","THE BIG C"], "Dinner": ["BEAR FIT","BEAR FUSION","BEAR NECESSITIES","BEAR SWEETS","CAL-ZONE","GOLDEN GRILL","PASTAS","SPECIALTY SALADS","THE BIG C"]]
    let crossroadsW = ["Brunch": ["BEAR FIT", "BEAR FUSION", "BEAR NECESSITIES", "BEAR SWEETS", "BREAKFAST PLATE", "GOLDEN GRILL", "ITALIAN CORNER", "PASTAS", "SMOOTHIES", "SPECIALTY SALADS"], "Dinner": ["BEAR FIT", "BEAR FUSION", "BEAR NECESSITIES", "BEAR SWEETS", "CAL-ZONE", "GOLDEN GRILL", "PASTAS", "SPECIALTY SALADS", "THE BIG C"]]
    let cafe3MF = ["Brunch":["CENTER OF THE PLATE","DESSERTS","HOT MORNING GRAINS","KOSHER","OMELETS AND EGGS","OSKI`S FAVORITES","PIZZA STATION","SOUPS","SPECIALTY SALADS"],"Dinner": ["ACTION BAR", "BLUE PLATE","ENTREES","OSKI`S FAVORITES","SOUPS","SPECIALTY SALADS","THE GRILL"]]
    let cafe3W = ["Brunch": ["CENTER OF THE PLATE", "DESSERTS", "HOT MORNING GRAINS", "KOSHER", "OMES AND EGGS", "OSKI`S FAVORITES", "PIZZA STATION", "SOUPS", "SPECIALTY SALADS"], "Dinner": ["ACTION BAR", "BLUE PLATE", "ENTREES", "OSKI`S FAVORITES", "SOUPS", "SPECIALTY SALADS", "THE GRILL"]]
    let ckMF = ["Breakfast": ["BEAR SWEETS","BREAKFAST PLATE","HOT MORNING GRAINS","SMOOTHIES"], "Dinner":["BEAR FUSION","BEAR SWEETS","BUILD YOUR OWN BAR","ENTREES","GRILLED","PASTAS","SLICES","SOUPS","SPECIALTY SALADS"]]
    let ckW = ["Brunch": ["BEAR SWEETS", "BREAKFAST PLATE", "CARVING STATION", "HOT MORNING GRAINS", "SMOOTHIES", "SOUPS", "SPECIALTY SALADS"], "Dinner": ["BEAR FUSION", "BEAR SWEETS", "BUILD YOUR OWN BAR", "ENTREES", "GRILLED", "PASTAS", "SLICES", "SOUPS", "SPECIALTY SALADS"]]
    let foothillMF = ["Breakfast": ["BEAR SWEETS","BREAKFAST PLATE","EGGS MADE TO ORDER","HOT MORNING GRAINS","SMOOTHIES"], "Lunch": ["MEAL COVERS"], "Dinner": ["BEAR SWEETS","DELI AND SALAD BAR","ENTREES","GRILLED","PASTAS","SLICES","SOUPS","WORLD FLAVORS"]]
    let foothillW = ["Brunch": ["BEAR SWEETS", "CARVING STATION", "ENTREES", "GRILLED", "HOT MORNING GRAINS", "PASTAS", "SMOOTHIES", "SOUPS", "SPECIALTY SALADS"], "Dinner": ["BEAR SWEETS", "DELI AND SALAD BAR", "ENTREES", "GRILLED", "PASTAS", "SLICES", "SOUPS", "WORLD FLAVORS"]]

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
