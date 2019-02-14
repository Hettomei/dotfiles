while true
do
  git l -1
  madge --circular --no-spinner --no-color --warning  --basedir src src/ 2>&1 \
    | grep 'Found.\+circular' \
    | sed 's/.\+Found \([0-9]\+\) .*/\1/'

  git checkout HEAD~1 2> /dev/null
  echo '--------------'
done
