import unittest
import csv
import re
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import time

class getProductList(unittest.TestCase):

    def search_xpath(self):
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

        csvfile = "E:\\Documents\\Proyectos\\TFG\\webScraper\\exports\\productList.csv"

        if resto > 0:
            qHojas = qHojas + 1

        qHojas = 2

        try:
            for x in range(qHojas):

                for y in range(regXPagina):
                    try:
                        precio = driver.find_element_by_xpath(
                            "/html/body/div[4]/div/div[2]/div[4]/div[" + str(y + 1) + "]/div/div[3]").text.replace('\n.', '')
                    except:
                        precio = "0"

                    precio = re.sub('\n?', '', precio)

                    try:
                        descripcion = driver.find_element_by_xpath(
                            "/html/body/div[4]/div/div[2]/div[4]/div[" + str(y + 1) + "]/div/div[4]").text.replace('\n.', '')
                    except:
                        descripcion = ""

                    descripcion = re.sub('\n?', '', descripcion)

                    try:
                        imgUrl = driver.find_element_by_xpath(
                            "/html/body/div[4]/div/div[2]/div[4]/div[" + str(y + 1) + "]/div/div[1]/a/img").get_attribute("src")
                    except:
                        imgUrl = ""

                    imgUrl = re.sub('\n?', '', imgUrl)

                    try:
                        precioPeso = driver.find_element_by_xpath(
                            "/html/body/div[4]/div/div[2]/div[4]/div[" + str(y + 1) + "]/div/div[5]").text.replace('\n.', '')
                    except:
                        precioPeso = ""

                    precioPeso = re.sub('\n?', '', precioPeso)

                    try:
                        oferta = driver.find_element_by_xpath(
                            "/html/body/div[4]/div/div[2]/div[4]/div[" + str(y + 1) + "]/div/div[2]").text.replace('\n.', '')
                    except:
                        oferta = ""

                    oferta = re.sub('\n?', '', oferta)

                    try:
                        tipoOferta = driver.find_element_by_xpath(
                            "/html/body/div[4]/div/div[2]/div[4]/div[" + str(y + 1) + "]/div/div[1]/div/p").get_attribute("class")
                    except:
                        try:
                            tipoOferta = driver.find_element_by_xpath(
                                "/html/body/div[4]/div/div[2]/div[4]/div[" + str(y + 1) + "]/div/div[1]/div").get_attribute("class")
                        except:
                            tipoOferta = ""

                    tipoOferta = re.sub('\n?', '', tipoOferta)

                    # if "PAPAS" in descripcion:
                    #    continue

                    lst.append({'precio': precio,
                                'descripcion': descripcion,
                                'imgUrl': imgUrl,
                                'precioPeso': precioPeso,
                                'oferta': oferta,
                                'tipoOferta': tipoOferta})
                if x == 7:
                    continue

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
                fieldnames1 = ['descripcion', 'imgUrl',
                               'precio', 'precioPeso', 'oferta', 'tipoOferta']
                writer = csv.DictWriter(
                    outfile, delimiter='\t', fieldnames=fieldnames1, lineterminator='\n')
                writer.writeheader()
                for entries in lst:
                    writer.writerow(entries)
        except Exception as e:
            print(e)


if __name__ == '__main__':
    getProductList().search_xpath()
