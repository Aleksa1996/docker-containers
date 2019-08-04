
CURL_OPTIONS_DEFAULT=
COMMAND_DEFAULT="restart"
INOTIFY_EVENTS_DEFAULT="delete,move,close_write"

#
# Display settings on standard out.
#
echo "inotify settings"
echo "================"
echo
echo "  Container:        ${CONTAINER}"
echo "  Volumes:          ${VOLUMES}"
echo "  Curl_Options:     ${CURL_OPTIONS:=${CURL_OPTIONS_DEFAULT}}"
echo "  Command:          ${COMMAND:=${COMMAND_DEFAULT}}"
echo "  Events:           ${INOTIFY_EVENTS_DEFAULT}"
echo

#
# Inotify part.
#
echo "[Starting inotifywait...]"
inotifywait -m "${VOLUMES}" -e "${INOTIFY_EVENTS_DEFAULT}" -r --format '%f %e %T' --timefmt '%H%M%S' |
    while read file events tm;
    do
        if [[ "$file" =~ .*php$ ]]; then # Does the file end with .php?
            current=$(date +'%H%M%S')
            delta=`expr $current - $tm`
            if [ $delta -lt 2 -a $delta -gt -2 ] ; then
                sleep 1  # sleep 1 set to let file operations end
                echo "$file => $events"
                echo "notify received, sent command ${COMMAND} to container ${CONTAINER}"
                for CNT in ${CONTAINER//;/$'\n'} ; do
                    curl ${CURL_OPTIONS} -X POST --unix-socket /tmp/docker.sock http://docker/containers/${CNT}/${COMMAND} > /dev/stdout 2> /dev/stderr
                done
            fi
        fi
    done
