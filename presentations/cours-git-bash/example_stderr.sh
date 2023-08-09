plus=1

function err {
  (>&2 echo "ERROR: $1 $plus")
  plus=$((plus + 1))
}

function out {
  echo "$1 $plus"
  plus=$((plus + 1))
}

err "stderr"
out "stdout"

err "stderr"
out "stdout"

err "stderr"
out "stdout"

err "stderr"
out "stdout"

err "stderr"
out "stdout"


# Why ?
# ./example_stderr.sh  | cat -n
# ./example_stderr.sh  | grep stder
# stderr 1
# stderr 2
# stderr 3
# stderr 4
# stderr 5
# stderr 6
# stderr 7
# stderr 8
# stderr 9


# hint : everything works
# Because grep does not work on stderr : stderr is always printed
