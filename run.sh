#! /bin/bash


export WINDOW_WIDTH=1920
export WINDOW_HEIGHT=1080
export FRAME_COUNT=5 # number of frames


export URL="http://digital-theater.kramweisshaar.com/?noauto"

OUTPUT_VIDEO=dt.mkv
FRAMES_DIRECTORY="frames"



if [ ! -d $FRAMES_DIRECTORY ];  then
	mkdir $FRAMES_DIRECTORY
fi

python ./capture.py

echo "Capture screenshots with dimensions: $WINDOW_WIDTHx$WINDOW_HEIGHT"

yes | ffmpeg -f image2 -pattern_type glob -framerate 60 -i 'frames/frame-*.jpg' -codec copy -s "$WINDOW_WIDTHx$WINDOW_HEIGHT" $OUTPUT_VIDEO

if [ $? = 0 ]; then
	echo "Done!"
fi