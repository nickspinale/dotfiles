# case "$TERM" in
# *-256color)
#     alias ssh='TERM=${TERM%-256color} ssh'
#     ;;
# *)
#     POTENTIAL_TERM=${TERM}-256color
#     POTENTIAL_TERMINFO=${TERM:0:1}/$POTENTIAL_TERM

#     # better to check $(toe -a | awk '{print $1}') maybe?
#     BOX_TERMINFO_DIR=/usr/share/terminfo
#     [[ -f $BOX_TERMINFO_DIR/$POTENTIAL_TERMINFO ]] && \
#         export TERM=$POTENTIAL_TERM

#     HOME_TERMINFO_DIR=$HOME/.terminfo
#     [[ -f $HOME_TERMINFO_DIR/$POTENTIAL_TERMINFO ]] && \
#         export TERM=$POTENTIAL_TERM
#     ;;
# esac

if [ "$TERM" = "linux" ]; then
    echo -en "\e]P0222222" #black    -> this is the background color as well. 
    echo -en "\e]P8222222" #darkgray
    echo -en "\e]P1803232" #darkred
    echo -en "\e]P9982b2b" #red
    echo -en "\e]P25b762f" #darkgreen
    echo -en "\e]PA89b83f" #green
    echo -en "\e]P3aa9943" #brown
    echo -en "\e]PBefef60" #yellow
    echo -en "\e]P4324c80" #darkblue
    echo -en "\e]PC2b4f98" #blue
    echo -en "\e]P5706c9a" #darkmagenta
    echo -en "\e]PD826ab1" #magenta
    echo -en "\e]P692b19e" #darkcyan
    echo -en "\e]PEa1cdcd" #cyan
    echo -en "\e]P7ffffff" #lightgray
    echo -en "\e]PFdedede" #white   -> this is the foreground color as well.
    clear #for background artifacting
fi
