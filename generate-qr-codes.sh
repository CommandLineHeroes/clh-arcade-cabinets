#!/usr/bin/env bash

# create a temp dir
mkdir -p .temp

# clear out existing images
rm *.png

for n in {1..5};
do

    # filename for the raw qr code
    qrfile=.temp/cab$n-qrcode.png

    # filename for the labeled qr code
    labelfile=cab$n-label.png

    # generate the qr codes
    qrencode -o $qrfile "mailto:clh-arcade-cabinets@fire.fundersclub.com?subject=Cabinet $n Field Report&body=Please describe the issue with Cabinet $n."

    # add a label to each qr code
    # convert -background black CommandLineHeroes_Logo_Reverse.svg -scale 100% -append $qrfile -scale 220% -gravity South -background purple -fill white -splice 0x32 -pointsize 18 -annotate +0+8 "Scan to report an issue with Cabinet $n" $labelfile
    mogrify -scale 300% -bordercolor black -border 16x16 $qrfile 
    montage -background black CommandLineHeroes_Logo_Reverse.svg $qrfile -mode Concatenate -tile 1x $labelfile

    convert -append $labelfile -gravity South -background black -fill white -splice 0x32 -pointsize 26 -annotate +0+12 "Problems?  Scan here." $labelfile
done
