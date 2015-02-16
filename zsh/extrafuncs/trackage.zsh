function trackage() {
    if (( ${#argv} < 1 )) ; then
        echo 'usage: trackage <tracking number>...' >&2
        return 1
    fi

    boxoh="http://www.boxoh.com/?rss=1&PageSpeed=noscript&t="

    for pkg
    do
        pkg_stat=$(curl -L -s "${boxoh}${pkg}" | xmllint --xpath '//item[1]/description/text()' - | sed -e 's/&gt;/>/g' -e 's/&lt;/</g' -e 's/<br\/>/ /g' -e 's/&..;/ /g' | nohtml | head -n1)
        echo "${pkg} status: ${pkg_stat}"
    done
}
