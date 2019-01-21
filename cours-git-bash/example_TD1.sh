for i in $(find test/unit -name '*.spec.js')
do
    filePath=$(echo $i | sed 's/test\/unit/src/' | sed 's/\.spec\.js/.js/')
    cat $filePath &> /dev/null
    RESULT=$?
    if [ $RESULT -gt 0 ]
    then
        echo $i
    fi
done
