function vimgolian {
    if (( ${#argv} < 1 )) ; then
        echo 'usage: vimgolian mongouri' >&2
        return 1
    fi
    (echo "rs.status()" | mongo "${1}" >/dev/null) || return 1
    orig_rs_conf=$(echo 'rs.conf()' | mongo "${1}" | sed -e 1,2d | head -n-1)
    new_rs_conf=$(echo "${orig_rs_conf}" | vipe)
    if [ "${new_rs_conf}" = "${orig_rs_conf}" ] ; then
        echo "Same stuff. Doing nothing"
    else
        echo "differences exist. Validating JSON"
        (echo "${new_rs_conf}" | jq . >/dev/null) || return 1
        echo "Executing rs.reconfig"
        echo "rs.reconfig(${new_rs_conf})" | mongo "${1}"
    fi
}
