Record on windows :
Press windows + alt + r

Then open the capture file, and compress the video :

ffmpeg -i input.mp4 -vcodec libx264 -crf 24 output.mp4
