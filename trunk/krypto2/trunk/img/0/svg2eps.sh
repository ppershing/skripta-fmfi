INKSCAPE="/cygdrive/c/Program Files/Inkscape/inkscape.exe"

CYG_WD=`pwd`
DOS_WD=`cygpath -w "$CYG_WD"`
file=$1
echo "Converting $DOS_WD/$file.svg to $file.eps"

"${INKSCAPE}" "$DOS_WD/$file.svg" --export-eps="$DOS_WD/$file.eps"
