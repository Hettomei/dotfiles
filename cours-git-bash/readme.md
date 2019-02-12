It use patat : https://github.com/jaspervdj/patat

```
sudo apt install patat
patat -w slides.md
```


Record on windows :
Press windows + G
click records

Then open the capture file, and to compress the video :

ffmpeg -i input.mp4 -vcodec libx264 -crf 24 output.mp4
