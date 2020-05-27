#! /bin/bash


export WINDOW_WIDTH=1920
export WINDOW_HEIGHT=1080
export FRAME_COUNT=6 # number of frames


TOPIC=$1
# TOPIC=business
# TOPIC=education
# TOPIC=environment
# TOPIC=religion
# TOPIC=science
# TOPIC=technology
# TOPIC=world
# TOPIC=asia
# TOPIC=europe
# TOPIC=latin_america
# TOPIC=middle_east
# TOPIC=commentary
# TOPIC=art_reviews


export URL="http://digital-theater.kramweisshaar.com/${TOPIC}?noauto"

OUTPUT_VIDEO=dt.mkv
FRAMES_DIRECTORY="frames"
export FPS=60



if [ ! -d $FRAMES_DIRECTORY ];  then
	mkdir $FRAMES_DIRECTORY
fi

echo "Capture screenshots with dimensions: $WINDOW_WIDTHx$WINDOW_HEIGHT"

python ./capture.py

if [ $? = 0 ]; then
  yes | ffmpeg -f image2 -pattern_type glob -framerate $FPS -i 'frames/frame-*.jpg' -codec copy -s "$WINDOW_WIDTHx$WINDOW_HEIGHT" $OUTPUT_VIDEO
  if [ $? = 0 ]; then
    echo "Done!"
  fi
fi

