Script automates capturing screenshots using Chrome.


### Requirements

- python

- install python libraries using 
  `pip install -r requirements.txt`

- install chromedriver 
  `brew cask install chromedriver` 
  (see https://sites.google.com/a/chromium.org/chromedriver/downloads)

- FFMPEG to make a video from image series
  `brew install ffmpeg`   


P.S. Optionally can also try to use other web browsers instead of Chrome, Safari or Firefox. 
For Firefox, would need to install firefox-geckodriver `brew install geckodriver` and edit browser name in `capture.py` code.
For Safari, would need to enable "Allow Remote Automation" in "Developer" menu and edit browser name in `capture.py` code.


### Settings

See `run.sh`:

```
export WINDOW_WIDTH=960 # on retina screenshots will be 2x
export WINDOW_HEIGHT=663 # 663 on retina gives 1080 image height due to a bar in header
export FRAME_COUNT=2000 # number of frames
export URL="http://digital-theater.kramweisshaar.com/?noauto"

OUTPUT_VIDEO=dt.mkv
FRAMES_DIRECTORY="frames"
```
### Run

`run.sh`


