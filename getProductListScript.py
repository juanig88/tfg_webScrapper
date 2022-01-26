import requests
import urllib.request
from bs4 import BeautifulSoup
import unittest
import csv
import re
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import time
import json


class getProductListScript(unittest.TestCase):

    try:
        def search_script(self):
            self.driver = webdriver.Chrome(
                executable_path=r"C:\dchrome\chromedriver.exe")
            driver = self.driver
            driver.get("https://www.dinoonline.com.ar/super/categoria/")
            time.sleep(3)

            total = int(driver.find_element_by_xpath(
                "/html/body/div[4]/div/div[2]/div[2]/div[3]/p/strong[3]").text)
            regXPagina = int(driver.find_element_by_xpath(
                "/html/body/div[4]/div/div[2]/div[2]/div[3]/p/strong[2]").text)

            resto = (total % regXPagina)
            qHojas = int(total / regXPagina)

            lst = []

            csvfile = "E:\\Documents\\Proyectos\\TFG\\tfg_webScrapper\\exports\\productListScript.csv"

            if resto > 0:
                qHojas = qHojas + 1

            try:
                for x in range(qHojas):

                    url = driver.current_url
                    r = requests.get(url, verify=False)
                    time.sleep(1)
                    html_content = r.text
                    soup = BeautifulSoup(html_content, "html.parser")
                    time.sleep(1)

                    all_scripts = soup.find_all('script')

                    data = all_scripts[8].get_text()
                    data = re.sub('\n?', '', data)
                    data = re.sub(
                        'gtag\(\'event\', \'view_item_list\', \{"items":', '', data)
                    data = re.sub('\}\);', '', data)

                    dataJson = json.loads(data)

                    lst.append(dataJson)

                    if x == 0:
                        driver.find_element_by_xpath(
                            "/html/body/div[4]/div/div[2]/div[2]/div[4]/ul/li[6]/a").click()
                        time.sleep(1)
                    elif x == 1:
                        driver.find_element_by_xpath(
                            "/html/body/div[4]/div/div[2]/div[2]/div[4]/ul/li[8]/a").click()
                        time.sleep(1)
                    elif x == 2:
                        driver.find_element_by_xpath(
                            "/html/body/div[4]/div/div[2]/div[2]/div[4]/ul/li[9]/a").click()
                        time.sleep(1)
                    else:
                        driver.find_element_by_xpath(
                            "/html/body/div[4]/div/div[2]/div[2]/div[4]/ul/li[11]/a").click()
                        time.sleep(1)

            except Exception as e:
                print(e)

            try:
                with open(csvfile, "w") as outfile:
                    fieldnames1 = ['id', 'name',
                                   'brand', 'category', 'quantity', 'list_position', 'price']
                    writer = csv.DictWriter(
                        outfile, delimiter='\t', fieldnames=fieldnames1, lineterminator='\n')
                    writer.writeheader()
                    for entries in lst:
                        for entrie in entries:
                            writer.writerow(entrie)
            except Exception as e:
                print(e)

    except Exception as e:
        print(e)


if __name__ == '__main__':
    getProductListScript().search_script()
