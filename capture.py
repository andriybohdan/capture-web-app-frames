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
FPS=int(os.environ.get('FPS', 60))

try:
    os.stat(FRAMES_DIRECTORY)
except:
    os.mkdir(FRAMES_DIRECTORY)


print("Capturing %d frames from: '%s' with dimensions %dx%d " % (FRAME_COUNT, URL,  WINDOW_WIDTH, WINDOW_HEIGHT))

def save_jpg(data, fnum, tick_time):
	image = Image.open(io.BytesIO(data))
	image = image.convert('RGB')
	image.save("frames/frame-%0.5d.jpg" % n)
	print("%d @ %s of %d saved" % (fnum, time.ctime(tick_time), FRAME_COUNT))


options = Options()
options.add_argument('start-maximized')
options.add_argument('disable-infobars')

options.add_experimental_option("excludeSwitches", ["enable-automation"])


mobile_emulation = {
	"deviceMetrics": {
		"width": WINDOW_WIDTH,
		"height": WINDOW_HEIGHT, 
		"pixelRatio": 1,
	}
}

options.add_experimental_option("mobileEmulation", mobile_emulation)



driver = webdriver.Chrome(options=options)

driver.set_window_size(WINDOW_WIDTH + 200, WINDOW_HEIGHT + 200);

driver.get(URL)
time.sleep(5)


t = time.time()
for n in range(FRAME_COUNT):
	tick_time = int(t)
	driver.execute_script("app.tick(%d)" % tick_time)
	# time.sleep(0.0001)
	save_jpg(driver.get_screenshot_as_png(), n, tick_time)
	t += 1.0/FPS
	
driver.close()
