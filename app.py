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

all_foods_dict = []

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
			elif i.name == "p" and not i.has_attr("class") and i.contents[0].strip() != 'N/A':
				time_food_list[current_place][current_time][current_cat].append(i.contents[0].strip())
				if i.contents[0].strip() not in all_foods_dict:
					all_foods_dict.append(i.contents[0].strip())
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
	return jsonify(sorted(all_foods_dict))

if __name__ == '__main__':
    app.run(host='0.0.0.0')
