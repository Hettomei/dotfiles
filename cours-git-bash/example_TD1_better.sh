set -e

for i in $(find test/unit -name '*.spec.js')
do
  file=$(echo "$i" | sed 's/test\/unit/src/' | sed 's/\.spec\.js/.js/')
  # if [ ! -f "$file" ]
  # then
  #   echo $file
  # fi

  [ ! -f "$file" ] && echo "$file"
done
