#! /bin/bash


export WINDOW_WIDTH=1920
export WINDOW_HEIGHT=1080
export FRAME_COUNT=600 # number of frames


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

OUTPUT_VIDEO=dt
export FRAMES_DIRECTORY="frames-dt"
export FPS=25



if [ ! -d $FRAMES_DIRECTORY ];  then
	mkdir $FRAMES_DIRECTORY
fi

echo "Capture screenshots with dimensions: $WINDOW_WIDTHx$WINDOW_HEIGHT"

python ./capture.py

if [ $? = 0 ]; then
  yes | ffmpeg -f image2 -pattern_type glob -framerate 60 -i "$FRAMES_DIRECTORY/frame-*.jpg" -codec copy -s "$WINDOW_WIDTHx$WINDOW_HEIGHT" $OUTPUT_VIDEO.mkv

  if [ "$FPS" -ne "60" ];then
    yes | ffmpeg -i $OUTPUT_VIDEO.mkv -filter:v fps=fps=$FPS $OUTPUT_VIDEO.mp4
  fi


  if [ $? = 0 ]; then
    echo "Done!"
  fi
fi

