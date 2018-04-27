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

base_url = "https://caldining.berkeley.edu/menu_day"
for i in range(2, 8):
	new_url = base_url + str(i) + ".php"
	response = requests.get(new_url)
	data = response.text
	soups_list.append(BeautifulSoup(data, 'lxml'))

all_foods_list = []
all_foods_dict = {}

for num in range(len(soups_list) + 1):
	time_food_list = {}
	soup = soups_list[num - 1]
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
if __name__ == '__main__':
    app.run(host='0.0.0.0')
