function youtube-mp3
  cd ~/Desktop/
  youtube-dl $argv[1] --extract-audio --audio-format mp3 
  cd -
end
