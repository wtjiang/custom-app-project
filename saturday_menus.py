from bs4 import BeautifulSoup
import requests

soups_list = []
data_dict = {}
current_url = "https://caldining.berkeley.edu/menu_day2.php"
response = requests.get(original_url)
data = response.text
soups_list.append(BeautifulSoup(data, 'lxml'))
