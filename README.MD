Script automates capturing screenshots using Chrome.


### Requirements

- python3 `brew install python3`

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

See `run-dt.sh` for DT settings

See `run-karaoke.sh` for Headline Karaoke settings


### Run

Random topic:

`run-dt.sh`


or pass topic as the first argument:

`run-dt.sh religion`

Headline Karaoke: `run-karaoke.sh`


### Topics

available topics:

```
business
education
environment
religion
science
technology
world
asia
europe
latin_america
middle_east
commentary
art_reviews
```

