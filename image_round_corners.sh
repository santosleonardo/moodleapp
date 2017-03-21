#!/bin/bash

function image_round_corners() {
    # Parameters
    # $1 - Image to be rounded
    # $2 - Rounded image
    # $3 - Input/output directory
    IMAGEW=$(identify -format '%w' $3/$1)
    ROUNDSIZE=$(echo "$IMAGEW * 0.25" | bc -l | cut -d . -f 1)
    convert $3/$1 \
     \( +clone  -alpha extract \
        -draw "fill black polygon 0,0 0,$ROUNDSIZE $ROUNDSIZE,0 fill white circle $ROUNDSIZE,$ROUNDSIZE $ROUNDSIZE,0" \
        \( +clone -flip \) -compose Multiply -composite \
        \( +clone -flop \) -compose Multiply -composite \
     \) -alpha off -compose CopyOpacity -composite  $3/$2
}

#image_round_corners drawable-ldpi-icon.png icon-36-ldpi.png resources/android/icon
#image_round_corners drawable-mdpi-icon.png icon-48-mdpi.png resources/android/icon
#image_round_corners drawable-hdpi-icon.png icon-72-hdpi.png resources/android/icon
#image_round_corners drawable-xhdpi-icon.png icon-96-xhdpi.png resources/android/icon
#image_round_corners drawable-xxhdpi-icon.png icon-144-xxhdpi.png resources/android/icon
#image_round_corners drawable-xxxhdpi-icon.png icon-192-xxxhdpi.png resources/android/icon

cp resources/android/icon/drawable-ldpi-icon.png resources/android/icon/icon-36-ldpi.png
cp resources/android/icon/drawable-mdpi-icon.png resources/android/icon/icon-48-mdpi.png 
cp resources/android/icon/drawable-hdpi-icon.png resources/android/icon/icon-72-hdpi.png
cp resources/android/icon/drawable-xhdpi-icon.png resources/android/icon/icon-96-xhdpi.png
cp resources/android/icon/drawable-xxhdpi-icon.png resources/android/icon/icon-144-xxhdpi.png
cp resources/android/icon/drawable-xxxhdpi-icon.png resources/android/icon/icon-192-xxxhdpi.png