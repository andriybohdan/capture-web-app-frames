#! /bin/bash


export WINDOW_WIDTH=1920
export WINDOW_HEIGHT=1080
export FRAME_COUNT=600 # number of frames




export URL="http://headline-karaoke.kramweisshaar.com/?noauto"

OUTPUT_VIDEO=karaoke
export FRAMES_DIRECTORY="frames-karaoke"



if [ ! -d $FRAMES_DIRECTORY ];  then
	mkdir $FRAMES_DIRECTORY
fi

echo "Capture screenshots with dimensions: $WINDOW_WIDTHx$WINDOW_HEIGHT"

python ./capture.py

if [ $? = 0 ]; then
  yes | ffmpeg -f image2 -pattern_type glob -framerate 25 -i "$FRAMES_DIRECTORY/frame-*.jpg" -codec copy -s "$WINDOW_WIDTHx$WINDOW_HEIGHT" $OUTPUT_VIDEO.mkv


  if [ $? = 0 ]; then
    echo "Done!"
  fi
fi

