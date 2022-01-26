import unittest
import requests
import urllib.request
from bs4 import BeautifulSoup
import csv
import re
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.action_chains import ActionChains
import time
import json


class sorteoInstagram(unittest.TestCase):

    def ejecutaSorteo(self):
        self.driver = webdriver.Chrome(
            executable_path=r"C:\dchrome\chromedriver.exe")
        driver = self.driver
        driver.get("https://www.instagram.com/p/CCozOAMAK39/")
        time.sleep(5)

        try:
            driver.find_element_by_xpath(
                "/html/body/div[1]/section/nav/div[2]/div/div/div[3]/div/div/div/button").click()
        except Exception as e:
            print(e)

        element = driver.find_element_by_xpath(
            "/html/body/div[1]/section/main/div/div/article/div[3]/div[1]/ul/ul[1]/div/li/div/div/div[2]/h3/div/a")

        actions = ActionChains(driver)
        actions.move_to_element(element).perform()
        time.sleep(3)

        button = driver.find_element_by_xpath(
            "/html/body/div[1]/section/main/div/div/article/div[3]/div[1]/ul/li/div/button")

        actions.move_to_element(button).perform()
        time.sleep(3)

        lst = []

        csvfile = "C:\\Users\\Juan Ignacio Garcia\\sorteo.csv"

        j = 0
        try:
            while True:
                try:
                    driver.find_element_by_xpath(
                        "/html/body/div[1]/section/main/div/div[1]/article/div[3]/div[1]/ul/li/div/button").click()
                except Exception as e:
                    driver.find_element_by_xpath(
                        "/html/body/div[1]/section/main/div/div/article/div[3]/div[1]/ul/li/div/button").click()
                time.sleep(1)

                j = j + 1

        except Exception as e:
            print(e)

        i = 0

        try:
            while True:
                try:
                    participante = driver.find_element_by_xpath(
                        "/html/body/div[1]/section/main/div/div[1]/article/div[3]/div[1]/ul/ul[" + str(i + 1) + "]/div/li/div/div[1]/div[2]/h3/div/span/a").text.replace('\n.', '')
                except Exception as e:
                    try:
                        participante = driver.find_element_by_xpath(
                            "/html/body/div[1]/section/main/div/div/article/div[3]/div[1]/ul/ul[" + str(i + 1) + "]/div/li/div/div/div[2]/h3/div/a").text.replace('\n.', '')
                    except Exception as e:
                        raise ValueError('A very specific bad thing happened.')

                participante = re.sub('\n?', '', participante)

                try:
                    etiqueta = driver.find_element_by_xpath(
                        "/html/body/div[1]/section/main/div/div[1]/article/div[3]/div[1]/ul/ul[" + str(i + 1) + "]/div/li/div/div[1]/div[2]/span/a").text.replace('\n.', '')
                except:
                    try:
                        etiqueta = driver.find_element_by_xpath(
                            "/html/body/div[1]/section/main/div/div/article/div[3]/div[1]/ul/ul[" + str(i + 1) + "]/div/li/div/div/div[2]/span/a").text.replace('\n.', '')
                    except:
                        etiqueta = ""

                etiqueta = re.sub('\n?', '', etiqueta)

                lst.append({'orden': str(i + 1),
                            'participante': participante,
                            'etiqueta': etiqueta})

                i = i + 1
                print(i)

        except Exception as e:
            print(e)

        try:
            with open(csvfile, "w") as outfile:
                fieldnames1 = ['orden', 'participante', 'etiqueta']
                writer = csv.DictWriter(
                    outfile, delimiter='\t', fieldnames=fieldnames1, lineterminator='\n')
                writer.writeheader()
                for entries in lst:
                    writer.writerow(entries)
        except Exception as e:
            print(e)


if __name__ == '__main__':
    sorteoInstagram().ejecutaSorteo()
