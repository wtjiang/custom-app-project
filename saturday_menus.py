from bs4 import BeautifulSoup
import requests

soups_list = []
data_dict = {}
original_url = "https://caldining.berkeley.edu/menu.php"
response = requests.get(original_url)
data = response.text
soup = BeautifulSoup(data, 'lxml')
time_food_list = {}

for j in soup.find_all(class_ = "desc_wrap_ck3"):
    for i in j.children:
        if i.name == "h3" and i.get("class")[0] == "location2":
            if i.string.strip() not in time_food_list:
                time_food_list[i.string.strip()] = {}
            current_place = i.string.strip()
        elif i.name == "h3" and i.get("class")[0] == "location_period":
            if i.string.strip() not in time_food_list[current_place]:
                time_food_list[current_place][i.string.strip()] = []
            current_time = i.string.strip()
        elif i.name == "p" and i.has_attr("class") and i.get("class")[0] == "station_wrap":
            time_food_list[current_place][current_time].append(i.string.strip())

print(time_food_list)
