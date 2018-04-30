from bs4 import BeautifulSoup
import requests
from flask import Flask, url_for, jsonify, json

app = Flask(__name__)
soups_list = []
data_dict = {}
original_url = "https://caldining.berkeley.edu/menu.php"
response = requests.get(original_url)
data = response.text
soups_list.append(BeautifulSoup(data, 'lxml'))
previous_list_full = {
  "ACTION BAR": [
    "Cheese & Garlic Oil Flatbread"
  ],
  "BEAR FIT": [
    "Roasted Zuchhini Squash Medley",
    "Garlic Kale",
    "Vegan/Gluten Free Pasta",
    "Tarka Dal",
    "Vegetable Caribbean Blend",
    "Three Bean Chili"
  ],
  "BEAR FUSION": [
    "Burrito Bar",
    "Vegetarian Burrito Bar",
    "Stir Fry Vegetable Noodles",
    "Oven Roasted Turkey Breast",
    "Roasted Red Potatoes",
    "Chicken Vindaloo",
    "Chana Masala",
    "Roasted Red & Gold Beets",
    "Baked Ham",
    "Parslied Potatoes"
  ],
  "BEAR NECESSITIES": [],
  "BEAR SWEETS": [
    "Apple Cinnamon Muffin",
    "Cranberry Orange Scone",
    "Assorted Danish",
    "Chocolate Chunk Brownie",
    "Luscious Lemon Bar",
    "Pecan Pie",
    "Sugar Cookies",
    "Banana Muffin",
    "Toffee Caramel Scone",
    "Oatmeal Raisin Cookies",
    "German Chocolate Cake",
    "Blueberry Muffin"
  ],
  "BLUE PLATE": [
    "Steamed Bok Choy",
    "Zuchini and Mushrooms"
  ],
  "BREAKFAST PLATE": [
    "Breakfast Polenta",
    "Blueberry Blintz",
    "Spinach and Cheese Croissant",
    "Bear Muffin",
    "Bacon",
    "Potato Wedges",
    "Pancakes",
    "Breakfast Veggie Patty",
    "Cajun Potatoes",
    "Pork Patty",
    "Hashbrown Tri Patty"
  ],
  "BUILD YOUR OWN BAR": [
    "Nacho Bar",
    "Falafel Bar",
    "Korean Kimchi Fries"
  ],
  "CAL-ZONE": [
    "Pineapple Pepper Flatbread",
    "Artichoke Ham Pizza",
    "Pepperoni Pizza",
    "Mushroom & Olive Flatbread",
    "Meat Lovers Pizza"
  ],
  "CARVING STATION": [
    "Achiote Rubbed Beef",
    "Mushroom Gravy",
    "Roasted Pork Loin",
    "Citrus Glazed Pork Loin",
    "Roasted Ham",
    "Roasted Sweet Potato",
    "Rotisserie Chicken"
  ],
  "CENTER OF THE PLATE": [
    "Scrambled Eggs",
    "Soyrizo Scramble",
    "Pan-fried Potatoes and Peppers",
    "Chocolate Chip Pancakes",
    "Tofu Sausage Rumble",
    "Mexican Home Fries",
    "Spiced French Toast",
    "Savory Tofu, Spinach, Tomato Scramble",
    "Sweet Potato Tots",
    "Blueberry Pancakes"
  ],
  "DELI AND SALAD BAR": [
    "Deli Bar"
  ],
  "DESSERTS": [
    "Heath Toffee Crunch Blondie",
    "Apple Pie",
    "Chocolate Cake",
    "Raspberry Sammie",
    "Carrot Cake",
    "Pumpkin Pie"
  ],
  "EGGS MADE TO ORDER": [],
  "ENTREES": [
    "Pickles",
    "Grilled Tri Tip w/ Chimichurri Sauce",
    "Sole with Garlic Butter",
    "Vegan Celebration Roast",
    "Buttery Mashed Potatoes",
    "Sauteed Green Beans",
    "Vegetable Riviera Blend",
    "Beef Fajitas",
    "Roasted Corn",
    "Cod Veracruz",
    "Cilantro Lime Rice",
    "Flour Tortilla",
    "Corn Tortillas",
    "Chicken Fajitas",
    "Vegan Tofu Picante Fajitas",
    "Spanish Rice (Brown)",
    "Mexicali Corn",
    "Beef Stew",
    "Piccata",
    "Pork Schnitzel",
    "Tilapia w/ Meuniere Sauce",
    "Egg Noodles",
    "Roasted Broccoli w/Garlic",
    "Jamaican Jerk Chicken",
    "Blackened Tilapia with Lemon Pepper",
    "Roasted Zucchini & Tomatoes",
    "Peas",
    "Jeweled Rice",
    "Thai Marinated Rock Cod",
    "Korean Fried Tofu",
    "Kimchi",
    "Korean Fried Chicken",
    "Jasmine Rice",
    "Dry Fried Bean Greens",
    "Steamed Cauliflower"
  ],
  "GOLDEN GRILL": [
    "Bacon Cheddar Burger",
    "Sunflower Cutlet Sandwich",
    "Fish Sandwich",
    "Shoestring Fries"
  ],
  "GRILLED": [
    "Chicken Quesadilla",
    "Cheese Quesadilla",
    "Tortilla Chips with Salsa",
    "Pork Cubano Sandwich",
    "Vegetable Lavash Wrap with Cucumber and Feta",
    "French Fries",
    "BBQ Pork Sandwich",
    "Beef Burger",
    "Boca Burger",
    "Chili Con Carne"
  ],
  "HOT MORNING GRAINS": [
    "Rolled Oatmeal",
    "Waffles",
    "Waffle Bar Toppings"
  ],
  "ITALIAN CORNER": [],
  "KOSHER": [
    "Kosher Delicatessen",
    "Kosher Mediterranean Bar",
    "Tuna Sandwich",
    "Egg Salad Sandwich",
    "Potato Salad",
    "Sushi Bowl Bar"
  ],
  "MEAL COVERS": [
    "Garden Pasta Salad",
    "Salad Bar",
    "Chicken w/ Caper Sauce",
    "Herb Crusted Salmon",
    "Stir Fry Tofu with Vegetables",
    "Broccoli & Cauliflower",
    "Roasted Vegetable Root Blend",
    "Penne Pasta",
    "Oski Burger",
    "Malibu Burger",
    "Garlic Fries",
    "Taco w/ Soyrizo Flatbread",
    "Tomato Pesto Flatbread",
    "Obrera Pizza"
  ],
  "OMELETS AND EGGS": [
    "Omelet Bar"
  ],
  "OSKI`S FAVORITES": [
    "Vegetable Stir Fry",
    "Vegetable Eggroll",
    "Miso Glazed Tilapia",
    "Vegetarian Fried Rice",
    "Sauteed Zucchini",
    "Steamed Broccoli",
    "Steamed Rice",
    "Brown Rice",
    "Tostada Bar",
    "Vegan Meatloaf",
    "Herb Crusted Pollock",
    "Peas with Mint",
    "Roasted Brussels Sprouts",
    "Ice Cream Bar",
    "Mongolian Noodle",
    "Rosemary Roasted Beef",
    "Roasted Salmon w/ Olive Tapenade",
    "Quinoa Pilaf",
    "Pho Bar"
  ],
  "PASTAS": [
    "Pesto Alfredo Sauce",
    "Beef Meatballs",
    "Pesto Sauce",
    "Meat Sauce",
    "Beef Bolognese Sauce"
  ],
  "PIZZA STATION": [
    "Red Sauc Cheese Flatbread",
    "Cheese and Pesto Pizza",
    "Cheese Pizza",
    "Pasta",
    "Whole Wheat Pasta",
    "Creamy Alfredo Sauce",
    "Herbed Marinara Sauce",
    "Breadsticks",
    "Whole Wheat Dinner Rolls",
    "Vegetable Deluxe Flatbread",
    "Vegetable Deluxe Pizza",
    "Vegan Tomato Basil Flatbread",
    "Margherita Pizza",
    "Lentil Bolognese Sauce"
  ],
  "SLICES": [
    "Cheese Flatbread",
    "Hawaiian Pizza",
    "Pesto Sun Dried Tomato Flatbread",
    "Margherita Flatbread Pizza",
    "Sausage Pizza",
    "Cheese and Pesto Flatbread Pizza",
    "Onion and Arugula Flatbread Pizza",
    "Mushroom & Spinach Pizza"
  ],
  "SMOOTHIES": [
    "Chocolate Raspberry Smoothie",
    "Strawberry Kiwi Smoothie",
    "Peach Smoothie",
    "Triple Berry Smoothie",
    "Blueberry Smoothie",
    "Banana King Smoothie"
  ],
  "SOUPS": [
    "Minestrone Soup",
    "Sweet Potato Chipotle Soup",
    "New England Clam Chowder",
    "Organic Split Pea Kale Soup",
    "Lentil Soup",
    "Organic Spicy Tomato Garlic Soup",
    "Chicken Noodle Soup",
    "Garden Vegetable Soup with Tomato",
    "Chicken Dumpling Soup",
    "Italian Wedding Soup",
    "Homemade Tomato Soup"
  ],
  "SPECIALTY SALADS": [
    "Garbanzo & Roasted Pepper Salad",
    "Black Bean & Corn Salad",
    "Tomato Salad",
    "Broccoli & Tomato Salad",
    "Carrot Raisin Salad",
    "Edamame & Corn Salad",
    "Sumi Salad",
    "Macaroni Salad",
    "Zucchini Combo Salad"
  ],
  "THE BIG C": [
    "Tater Tots",
    "Orange Blintz",
    "Smoked Salmon Eggs Benedict",
    "Chicken Teriyaki",
    "Grilled Salmon w Lemon",
    "Potato & Garbanzo Stew",
    "Coconut Rice",
    "Garlic Ginger Bok Choy",
    "Penne Pasta w/ Shrimp & Chipotle Cream Sauce",
    "Rock Cod w/ Olive Tapenade",
    "White Beans w Oregano & Garlic",
    "Mashed Potatoes w/ Olive Oil",
    "Broccoli Cauliflower & Carrots",
    "Meat Lasagna",
    "Herb Roasted Chicken",
    "Vegetable Jambalaya",
    "Steak Fries",
    "Sauteed Zucchini and Onions",
    "Corn Cob",
    "Hawaiian BBQ Pork",
    "Teriyaki Tofu",
    "Suateed Cabbage",
    "Cinnamon Glazed Carrot"
  ],
  "THE GRILL": [
    "Hot Dog",
    "Housemade BBQ Potato Chips",
    "Vegetarian \"Meatball\" Sub",
    "Sweet Potato Fries",
    "BBQ Sandwich w/ Onion Rings & Coleslaw"
  ],
  "WORLD FLAVORS": []
}

today_meals = {
  "Cafe_3": {
    "Brunch": {
      "CENTER OF THE PLATE": [
        "Scrambled Eggs",
        "Tofu Sausage Rumble",
        "Mexican Home Fries",
        "Spiced French Toast"
      ],
      "DESSERTS": [
        "Raspberry Sammie",
        "Pecan Pie",
        "Carrot Cake"
      ],
      "HOT MORNING GRAINS": [
        "Rolled Oatmeal"
      ],
      "KOSHER": [
        "Kosher Delicatessen",
        "Kosher Mediterranean Bar",
        "Sushi Bowl Bar"
      ],
      "OMELETS AND EGGS": [
        "Omelet Bar"
      ],
      "OSKI`S FAVORITES": [
        "Vegan Meatloaf",
        "Herb Crusted Pollock",
        "Mashed Potatoes w/ Olive Oil",
        "Peas with Mint",
        "Roasted Brussels Sprouts",
        "Steamed Rice",
        "Brown Rice"
      ],
      "PIZZA STATION": [
        "Vegetable Deluxe Flatbread",
        "Vegetable Deluxe Pizza",
        "Cheese Pizza",
        "Pasta",
        "Whole Wheat Pasta",
        "Pesto Alfredo Sauce",
        "Herbed Marinara Sauce",
        "Breadsticks",
        "Whole Wheat Dinner Rolls"
      ],
      "SOUPS": [
        "Organic Split Pea Kale Soup"
      ],
      "SPECIALTY SALADS": [
        "Broccoli & Tomato Salad"
      ]
    },
    "Dinner": {
      "ACTION BAR": [
        "Vegetable Deluxe Flatbread",
        "Vegetable Deluxe Pizza",
        "Cheese Pizza",
        "Pasta",
        "Whole Wheat Pasta",
        "Pesto Sauce",
        "Herbed Marinara Sauce",
        "Breadsticks",
        "Whole Wheat Dinner Rolls"
      ],
      "BLUE PLATE": [
        "Vegan Meatloaf",
        "Mashed Potatoes w/ Olive Oil",
        "Roasted Brussels Sprouts",
        "Steamed Rice",
        "Brown Rice",
        "Peas with Mint"
      ],
      "ENTREES": [
        "Sushi Bowl Bar"
      ],
      "OSKI`S FAVORITES": [
        "Ice Cream Bar"
      ],
      "SOUPS": [
        "Organic Split Pea Kale Soup",
        "Lentil Soup"
      ],
      "SPECIALTY SALADS": [
        "Broccoli & Tomato Salad"
      ],
      "THE GRILL": [
        "Vegetarian \"Meatball\" Sub",
        "Sweet Potato Fries"
      ]
    }
  },
  "Clark_Kerr_Campus": {
    "Brunch": {
      "BEAR SWEETS": [
        "Banana Muffin",
        "Toffee Caramel Scone",
        "Assorted Danish"
      ],
      "BREAKFAST PLATE": [
        "Bacon",
        "Soyrizo Scramble",
        "Potato Wedges",
        "Pancakes",
        "Breakfast Veggie Patty"
      ],
      "CARVING STATION": [
        "Achiote Rubbed Beef",
        "Vegan Celebration Roast",
        "Mushroom Gravy",
        "Roasted Pork Loin",
        "Buttery Mashed Potatoes",
        "Sauteed Green Beans",
        "Steamed Rice",
        "Brown Rice"
      ],
      "HOT MORNING GRAINS": [
        "Rolled Oatmeal",
        "Steamed Rice",
        "Brown Rice",
        "Waffle Bar Toppings"
      ],
      "SMOOTHIES": [
        "Triple Berry Smoothie"
      ],
      "SOUPS": [
        "Organic Spicy Tomato Garlic Soup"
      ],
      "SPECIALTY SALADS": [
        "Carrot Raisin Salad"
      ]
    },
    "Dinner": {
      "BEAR FUSION": [
        "Stir Fry Vegetable Noodles",
        "Brown Rice",
        "Steamed Rice"
      ],
      "BEAR SWEETS": [
        "Oatmeal Raisin Cookies",
        "Apple Pie",
        "German Chocolate Cake"
      ],
      "BUILD YOUR OWN BAR": [
        "Falafel Bar"
      ],
      "ENTREES": [
        "Chicken Fajitas",
        "Cod Veracruz",
        "Vegan Tofu Picante Fajitas",
        "Spanish Rice (Brown)",
        "Flour Tortilla",
        "Mexicali Corn"
      ],
      "GRILLED": [
        "Pork Cubano Sandwich",
        "Vegetable Lavash Wrap with Cucumber and Feta",
        "French Fries"
      ],
      "PASTAS": [
        "Pasta",
        "Whole Wheat Pasta",
        "Herbed Marinara Sauce",
        "Breadsticks"
      ],
      "SLICES": [
        "Margherita Flatbread Pizza",
        "Sausage Pizza"
      ],
      "SOUPS": [
        "Lentil Soup",
        "Chicken Noodle Soup"
      ],
      "SPECIALTY SALADS": [
        "Carrot Raisin Salad"
      ]
    }
  },
  "Crossroads": {
    "Brunch": {
      "BEAR FIT": [
        "Soyrizo Scramble"
      ],
      "BEAR FUSION": [
        "Oven Roasted Turkey Breast",
        "Roasted Pork Loin",
        "Roasted Red Potatoes",
        "Mushroom Gravy",
        "Vegetable Riviera Blend",
        "Vegan Celebration Roast",
        "Steamed Rice",
        "Brown Rice"
      ],
      "BEAR NECESSITIES": [
        "Rolled Oatmeal",
        "Chicken Noodle Soup"
      ],
      "BEAR SWEETS": [
        "Banana Muffin",
        "Toffee Caramel Scone",
        "Assorted Danish"
      ],
      "BREAKFAST PLATE": [
        "Bacon",
        "Cajun Potatoes",
        "Pancakes",
        "Breakfast Veggie Patty"
      ],
      "GOLDEN GRILL": [
        "Waffle Bar Toppings"
      ],
      "ITALIAN CORNER": [
        "Omelet Bar"
      ],
      "PASTAS": [
        "Breadsticks",
        "Pasta",
        "Whole Wheat Pasta",
        "Herbed Marinara Sauce",
        "Meat Sauce"
      ],
      "SMOOTHIES": [
        "Blueberry Smoothie"
      ],
      "SPECIALTY SALADS": [
        "Broccoli & Tomato Salad"
      ]
    },
    "Dinner": {
      "BEAR FIT": [
        "Vegetable Riviera Blend",
        "Tarka Dal",
        "Brown Rice"
      ],
      "BEAR FUSION": [
        "Stir Fry Vegetable Noodles",
        "Brown Rice",
        "Steamed Rice"
      ],
      "BEAR NECESSITIES": [
        "Lentil Soup",
        "Chicken Noodle Soup"
      ],
      "BEAR SWEETS": [
        "Oatmeal Raisin Cookies",
        "Apple Pie",
        "German Chocolate Cake"
      ],
      "CAL-ZONE": [
        "Cheese Flatbread",
        "Cheese Pizza",
        "Pepperoni Pizza"
      ],
      "GOLDEN GRILL": [
        "Bacon Cheddar Burger",
        "Sunflower Cutlet Sandwich",
        "Sweet Potato Fries"
      ],
      "PASTAS": [
        "Breadsticks",
        "Pasta",
        "Whole Wheat Pasta",
        "Herbed Marinara Sauce",
        "Meat Sauce"
      ],
      "SPECIALTY SALADS": [
        "Broccoli & Tomato Salad"
      ],
      "THE BIG C": [
        "Meat Lasagna",
        "Herb Roasted Chicken",
        "Vegetable Jambalaya",
        "Steak Fries",
        "Sauteed Zucchini and Onions",
        "Corn Cob"
      ]
    }
  },
  "Foothill": {
    "Brunch": {
      "BEAR SWEETS": [
        "Banana Muffin",
        "Toffee Caramel Scone",
        "Assorted Danish"
      ],
      "CARVING STATION": [
        "Oven Roasted Turkey Breast",
        "Citrus Glazed Pork Loin",
        "Mushroom Gravy",
        "Vegan Celebration Roast",
        "Buttery Mashed Potatoes",
        "Sauteed Green Beans",
        "Steamed Rice",
        "Brown Rice"
      ],
      "ENTREES": [
        "Bacon",
        "Soyrizo Scramble",
        "Mexican Home Fries",
        "Pancakes",
        "Breakfast Veggie Patty"
      ],
      "GRILLED": [
        "Waffle Bar Toppings"
      ],
      "HOT MORNING GRAINS": [
        "Rolled Oatmeal",
        "Steamed Rice",
        "Brown Rice"
      ],
      "PASTAS": [
        "Pasta",
        "Whole Wheat Pasta",
        "Herbed Marinara Sauce"
      ],
      "SMOOTHIES": [
        "Triple Berry Smoothie"
      ],
      "SOUPS": [
        "Chicken Noodle Soup"
      ],
      "SPECIALTY SALADS": [
        "Broccoli & Tomato Salad"
      ]
    },
    "Dinner": {
      "BEAR SWEETS": [
        "Oatmeal Raisin Cookies",
        "Apple Pie",
        "German Chocolate Cake"
      ],
      "DELI AND SALAD BAR": [
        "Broccoli & Tomato Salad",
        "Salad Bar",
        "Deli Bar"
      ],
      "ENTREES": [
        "Beef Stew",
        "Piccata",
        "Pork Schnitzel",
        "Tilapia w/ Meuniere Sauce",
        "Egg Noodles",
        "Roasted Broccoli w/Garlic"
      ],
      "GRILLED": [
        "BBQ Pork Sandwich",
        "Sweet Potato Fries"
      ],
      "PASTAS": [
        "Pasta",
        "Whole Wheat Pasta",
        "Breadsticks",
        "Herbed Marinara Sauce"
      ],
      "SLICES": [
        "Cheese and Pesto Flatbread Pizza",
        "Pepperoni Pizza",
        "Cheese Pizza"
      ],
      "SOUPS": [
        "Lentil Soup",
        "Chicken Noodle Soup"
      ],
      "WORLD FLAVORS": [
        "Stir Fry Vegetable Noodles",
        "Steamed Rice",
        "Brown Rice"
      ]
    }
  }
}

base_url = "https://caldining.berkeley.edu/menu_day"
for i in range(2, 8):
	new_url = base_url + str(i) + ".php"
	response = requests.get(new_url)
	data = response.text
	soups_list.append(BeautifulSoup(data, 'lxml'))

all_foods_list = []
all_foods_dict = {}

for num in range(len(soups_list)):
	time_food_list = {}
	soup = soups_list[num]
	for j in soup.find_all(class_ = "desc_wrap_ck3"):
		for i in j.children:
			if i.name == "h3" and i.get("class")[0] == "location2":
				if i.string.strip() not in time_food_list:
					time_food_list[i.string.strip()] = {}
				current_place = i.string.strip()
			elif i.name == "h3" and i.get("class")[0] == "location_period":
				if i.string.strip() not in time_food_list[current_place]:
					time_food_list[current_place][i.string.strip()] = {}
				current_time = i.string.strip()
			elif i.name == "p" and i.has_attr("class") and i.get("class")[0] == "station_wrap":
				time_food_list[current_place][current_time][i.string.strip()] = []
				current_cat = i.string.strip()
				if current_cat not in all_foods_dict.keys():
					all_foods_dict[current_cat] = []
			elif i.name == "p" and not i.has_attr("class") and i.contents[0].strip() != 'N/A':
				time_food_list[current_place][current_time][current_cat].append(i.contents[0].strip())
				current_food = i.contents[0].strip()
				if current_food not in all_foods_list and current_food not in all_foods_dict[current_cat]:
					all_foods_list.append(current_food)
					all_foods_dict[current_cat].append(current_food)
	data_dict[str(num)] = time_food_list

for key in previous_list_full.keys():
    if key not in all_foods_dict.keys():
        all_foods_dict[key] = []
    for food in previous_list_full[key]:
        if food not in all_foods_dict[key]:
            all_foods_dict[key].append(food)

@app.route('/<day_num>')
def get_day_dict(day_num):
	return jsonify(data_dict[day_num])

@app.route('/<day_num>/<dining_hall>')
def get_dining_hall_info(day_num, dining_hall):
	return jsonify(data_dict[day_num][dining_hall])

@app.route('/<day_num>/<dining_hall>/<time_of_day>')
def get_time_of_day_info(day_num, dining_hall, time_of_day):
	return jsonify(data_dict[day_num][dining_hall][time_of_day])

@app.route('/<day_num>/<dining_hall>/<time_of_day>/<type_of_meal>')
def get_specific_meal_info(day_num, dining_hall, time_of_day, type_of_meal):
	return jsonify(data_dict[day_num][dining_hall][time_of_day][type_of_meal])

@app.route('/list')
def get_meal_list():
	return jsonify(sorted(all_foods_list))

@app.route('/list_full')
def get_full_meal_list():

	return jsonify(all_foods_dict)

@app.route('/weights')
def get_weights():
	weights = {}
	for key in all_foods_dict:
		for food in all_foods_dict[key]:
			if key == "BLUE PLATE" or key == "OSKI'S FAVORITES" or key == "WORLD FLAVORS" or key == "ENTREES" or key == "CENTER OF THE PLATE" or key == "BREAKFAST PLATE" or key == "BUILD YOUR OWN BAR" or key == "BEAR FUSION" or key == "THE BIG C" or key == "CARVING STATION" or key == "BEAR FIT" or key == "KOSHER" or key == "THE GRILL" or key == "GRILLED" or key == "GOLDEN GRILL":
				weights[food] = 1.5
			elif key == "HOT MORNING GRAINS" or key == "DESSERTS" or key == "BEAR SWEETS":
				weights[food] = 0.5
			elif key == "SMOOTHIES":
				weights[food] = 0.75
			elif key == "SOUPS" or key == "BEAR NECESSITIES":
				weights[food] = 1
			elif key == "ACTION BAR" or key == "PIZZA STATION" or key == "SLICES" or key == "PASTAS" or key == "CAL-ZONE":
				weights[food] = 1
			elif key == "EGGS MADE TO ORDER" or key == "OMELETS AND EGGS" or key == "ITALIAN CORNER":
				weights[food] = 1
			else:
				weights[food] = 1

	return jsonify(weights)

@app.route('/current_crossroads')
def get_current_crossroads():
	return jsonify(today_meals["Crossroads"])

@app.route('/current_foothill')
def get_current_foothill():
	return jsonify(today_meals["Foothill"])

@app.route('/current_cafe_3')
def get_current_cafe_3():
	return jsonify(today_meals["Cafe_3"])

@app.route('/current_clark_kerr')
def get_current_clark_kerr():
	return jsonify(today_meals["Clark_Kerr_Campus"])



if __name__ == '__main__':
    app.run(host='0.0.0.0')
