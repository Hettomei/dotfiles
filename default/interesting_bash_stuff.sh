#!/bin/bash

function git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
}

function ooservice_stop_start() {
  for process in $@; do
    echo stop start $process
    ssh box "systemctl stop $process && sleep 1 && systemctl start $process || echo 'Failed to stop start $process'"
  done
}

function ooservice_restart() {
  ssh box "systemctl restart $@"
}

function oovacuum() {
  ssh box 'journalctl --vacuum-size=0.1K'
}

function ooflash() {
  docker ps | grep -q "stb_server"
  if [ "$?" = "1" ]; then
    echo 'please run oostart_env'
    return 1
  fi

  if [ "$#" -ne 1 ]; then
    cat <<EOF
please run

ooflash 1
then
ooflash 2
EOF
  return 1
  fi

  if [ "$1" = "1" ]; then
    echo 'command is 1'
  fi

  if [ "$1" = "2" ]; then
    echo 'command is 2'
  fi
}

# just type
# ooadd_toggleconnectionmode
#
# and it will update a file
# then oopush_code
# then, in console, toggleConnectionMode()
function ooadd_toggleConnectionMode() {
  local place='path/to/file.js'
  echo "updating $place"
  cat <<EOF >> $place
Add
lot
of
code here
EOF
}

# just type
# ooadd_log_all_request_content
#
# and it will update a file Request
# then oopush_code
function ooadd_log_all_request_content() {
  local place='path/to/file.js'
  echo "updating $place"
  sed -i 's/^\(function requestJson.*\)/\1\nconsole.log("ttiimm", options, headers, onProgress);/' $place
  grep -A5 'function requestJson' $place
}

# oovim_all_file_last_commit      # Open all touched file in buffer from last commit
# oovim_all_file_last_commit 1234 # Open all touched file in buffer from commit 1234
function oolast_commit_vim() {
  git log -1 $1 --stat
  v $(git show $1 --name-only --diff-filter=ACM | grep "js$")
}

# How to use :
# go on gerrit
# click on 'copy'
# then open bash and type
# cher
# cher is for cherry-picking the copy paste from gerrit
function cher() {
  pbpaste
  echo
  echo

  pbpaste | grep -q -P '^git fetch.+project-name.+ && git cherry-pick FETCH_HEAD$'

  RESULT=$?
  if [ $RESULT -eq 0 ]; then
    echo -n '>>>>>>>>> '
    git_branch
    echo

    gerrit_part=$(pbpaste | sed 's/git fetch \(.\+\) && git cherry-pick FETCH_HEAD$/\1/')
    echo will fetch $gerrit_part
    echo

    git fetch $gerrit_part
    echo

    git checkout --detach
    git cherry-pick FETCH_HEAD
  else
    echo failed to match a gerrit cherry pick
    return 2
  fi
}

function cher_on_up_to_date_master() {
  git checkout master
  git fetch
  git reset --hard origin/master
  cher
}

# compare 2 commit :
function oocompare_backport() {
  if [ -z "$1" ]
  then
    cat <<EOF
Use it this way :
First time with soimething to match comlmit number

oocompare_backport ARRISEOS-123

Then when you grab the commit :

oocompare_backport FETCH_HEAD abcdefg
EOF
    return 1
  fi

  if [ -z "$2" ]
  then
    echo "Ensure you are on master :"
    git_branch
    echo '-----------'
    git log --oneline | grep "$1"
  else
    v -d <(g show "$1") <(g show "$2")
  fi
}
