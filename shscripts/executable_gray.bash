#!/usr/bin/env bash

function graywllpper(){
    mv /home/rayou/.background_image.jpg /home/rayou/.background_image.jpg.old
    echo "moving previous background to" $_
    magick $1 -colorspace Gray /home/rayou/.background_image.jpg
    feh --bg-fill /home/rayou/.background_image.jpg
}
