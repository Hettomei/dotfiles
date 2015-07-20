function youtube-mp3
  echo "Bonjour ma chérie"
  echo "Colle l'url youtube et fait 'Entrée'"

  read --prompt="echo 'url : '" afile

  echo
  echo "En cours de téléchargement de $afile"
  echo

  cd ~/Desktop/
  youtube-dl --extract-audio --audio-format mp3 $afile
  cd -

  echo
  echo "C'est sur le bureau, big kiss"
end
