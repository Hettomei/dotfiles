while true
do
  git l -1
  madge --circular --no-spinner --no-color --warning  --basedir src src/ 2>&1 \
    | grep 'Found.\+circular' \
    | sed 's/.\+Found \([0-9]\+\) .*/\1/'

  git checkout HEAD~1 2> /dev/null
  echo '--------------'
done


# Output :

# 813effb 2019-01-29 20:31:43 +0100 commit message 1
# 17
# --------------
# 8b60365 2019-01-29 16:55:46 +0000 commit message 2
# 17
# --------------
# 329d706 2019-01-29 16:51:36 +0000 commit message 3
# 17
# --------------
# af8f4c4 2019-01-29 16:33:04 +0000 commit message 4
# 87

