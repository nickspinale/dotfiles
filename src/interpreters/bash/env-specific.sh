function marsf () {
    mars $@ | grep ^.[^A] | sed -e "s/\t/ /g"
}

function marsfl () {
    length=$1
    shift
    marsf 0x10010000-$((0x10010000 + ($length - 1) * 4)) $@
}
