#!/bin/sh
echo "Select Source:"
echo "1. ranchi"
echo "2. giridih"

read src

echo "Select Destination:"
echo "1. bit mesra"
echo "2. bit more"

read dest

case $src-$dest in
1-1)
    echo "ranchi → bit mesra"
    echo "1. Charminar Express"
    echo "2. Chennai Express"
    ;;
1-2)
    echo "ranchi → bit more"
    echo "1. Mumbai Mail"
    echo "2. Konkan Express"
    ;;
2-1)
    echo "giridih → bit mesra"
    echo "1. bhagalpur Express"
    echo "2. Intercity Express"
    ;;
2-2)
    echo "giridih → bit more"
    echo "1. Udyan Express"
    echo "2. hatiya Express"
    ;;
*)
    echo "Invalid source or destination"
    ;;
esac

