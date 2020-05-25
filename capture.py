#! /usr/bin/python

import time
from PIL import Image
import io
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
import threading
import os

URL=os.environ.get('URL', "http://localhost:3000/?noauto")
WINDOW_WIDTH=int(os.environ.get('WINDOW_WIDTH', 1280))
WINDOW_HEIGHT=int(os.environ.get('WINDOW_HEIGHT', 720))
FRAME_COUNT=int(os.environ.get('FRAME_COUNT', 500))
FRAMES_DIRECTORY=os.environ.get('FRAMES_DIRECTORY', 'frames')

try:
    os.stat(FRAMES_DIRECTORY)
except:
    os.mkdir(FRAMES_DIRECTORY)


print("Capturing %d frames from: '%s' with dimensions %dx%d " % (FRAME_COUNT, URL,  WINDOW_WIDTH, WINDOW_HEIGHT))

def save_jpg(data, fnum):
	image = Image.open(io.BytesIO(data))
	image = image.convert('RGB')
	image.save("frames/frame-%0.5d.jpg" % n)


chrome_options = Options()
chrome_options.add_argument("--window-size=1920,1080")
chrome_options.add_argument("--start-maximized")
chrome_options.add_argument("--enable-automation")
chrome_options.add_argument("--no-sandbox")
chrome_options.add_argument("--disable-infobars")
# chrome_options.add_argument("--disable-dev-shm-usage")
# chrome_options.add_argument("--disable-browser-side-navigation")

driver = webdriver.Chrome(chrome_options=chrome_options)

driver.set_window_size(WINDOW_WIDTH, WINDOW_HEIGHT);

driver.get(URL)
time.sleep(5)



for n in range(0, FRAME_COUNT):
	driver.execute_script("app.tick()")
	time.sleep(0.0001)

	# driver.save_screenshot("frame-%0.5d.png" % n)

	threading.Thread(target=save_jpg, args=(driver.get_screenshot_as_png(), n)).start()
	print("%d of %d saved" % (n, FRAME_COUNT))

driver.close()
