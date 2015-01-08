echo -e "\e[?6c"

set_colors()

    {

    local base03="002b36"
    local base02="073642"
    local base01="586e75"
    local base00="657b83"
    local base0="839496"
    local base1="93a1a1"
    local base2="eee8d5"
    local base3="fdf6e3"
    local yellow="b58900"
    local orange="cb4b16"
    local red="dc322f"
    local magenta="d33682"
    local violet="6c71c4"
    local blue="268bd2"
    local cyan="2aa198"
    local green="859900"

    # echo -en "\e]P4${base02}" #black
    # echo -en "\e]P4${base03}" #brblack
    # echo -en "\e]P1${red}" #red
    # echo -en "\e]P3${orange}" #brred
    # echo -en "\e]P2${green}" #green
    # echo -en "\e]P7${base01}" #brgreen
    # echo -en "\e]P3${yellow}" #yellow
    # echo -en "\e]P7${base00}" #bryellow
    # echo -en "\e]P4${blue}" #blue
    # echo -en "\e]P6${base0}" #brblue
    # echo -en "\e]P5${magenta}" #magenta
    # echo -en "\e]P5${violet}" #brmagenta
    # echo -en "\e]P6${cyan}" #cyan
    # echo -en "\e]P4${base1}" #brcyan
    # echo -en "\e]P7${base2}" #white
    # echo -en "\e]P7${base3}" #brwhite

    echo -en "\e]P0${base02}" #black
    echo -en "\e]P8${base03}" #brblack
    echo -en "\e]P1${red}" #red
    echo -en "\e]P9${orange}" #brred
    echo -en "\e]P2${green}" #green
    echo -en "\e]PA${base01}" #brgreen
    echo -en "\e]P3${yellow}" #yellow
    echo -en "\e]PB${base00}" #bryellow
    echo -en "\e]P4${blue}" #blue
    echo -en "\e]PC${base0}" #brblue
    echo -en "\e]P5${magenta}" #magenta
    echo -en "\e]PD${violet}" #brmagenta
    echo -en "\e]P6${cyan}" #cyan
    echo -en "\e]PE${base1}" #brcyan
    echo -en "\e]P7${base2}" #white
    echo -en "\e]PF${base3}" #brwhite

    clear #for background artifacting

    }

if [ "$TERM" = "linux" ]; then
    set_colors
fi
