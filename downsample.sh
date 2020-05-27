#! /bin/bash

NEW_FPS=25

ffmpeg -i dt.mkv -filter:v fps=fps=$NEW_FPS dt-downsampled.mp4
