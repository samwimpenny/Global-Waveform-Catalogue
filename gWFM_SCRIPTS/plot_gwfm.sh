#!/bin/bash
### Plotting the distribution,
### mechanisms and depths of the
### global waveform catalogue.

################################
# Variables
###############################

# gwfm=../../gWFM_MASTER/gWFM_master_20200324.txt
gwfm=../../gWFM_MASTER/gWFM_v1.0.txt
version=1.0
out=gWFM_catalogue.ps

################################
# Calculations:
###############################

numev=`awk 'FNR>2{print $0}' $gwfm | wc -l`

################################
# Plotting:
###############################

# GMT variables
gmt gmtset PS_PAGE_ORIENTATION landscape
gmt gmtset PS_MEDIA a4
gmt gmtset COLOR_NAN white
gmt gmtset FONT_ANNOT_PRIMARY 10p
gmt gmtset FONT_LABEL 10p
gmt gmtset FONT_TITLE 14p,Helvetica-BoldOblique
gmt gmtset MAP_FRAME_WIDTH 0.1c
gmt gmtset MAP_FRAME_TYPE plain
gmt gmtset FORMAT_GEO_MAP +D.xx
gmt gmtset MAP_GRID_CROSS_SIZE_PRIMARY 3p

# Plotting mechanisms and distribution
gmt pscoast -Rg -JN0/25 -Glightgray -Swhite -Dc \
-Bxa30f15 -Bya30f15 -BNEsW+t"gWFM Catalogue: v.${version}" -X2 -Y6 -K > $out

awk 'FNR>2{if($7=="BWF") print $4,$5,$6,$17,$18,$19,$25,0,0}' $gwfm |
gmt psmeca -R -J -Sa0.2c -Glightred -W0.1p -O -K >> $out
awk 'FNR>2{if($7=="DP" && $17!="-") print $4,$5,$6,$17,$18,$19,$25,0,0}' $gwfm |
gmt psmeca -R -J -Sa0.2c -Glightblue -W0.1p -O -K >> $out
awk 'FNR>2{if($7=="DP" && $17=="-") print $4,$5,$6}' $gwfm |
gmt psxy -R -J -Sc0.1c -Glightblue -W0.1p -O -K >> $out
awk 'FNR>2{if($7=="INS") print $4,$5,$6,$17,$18,$19,$25,0,0}' $gwfm |
gmt psmeca -R -J -Sa0.2c -Glightgreen -W0.1p -O -K >> $out

# Plotting parameter distributions:
awk 'FNR>2{print $25}' $gwfm | \
gmt pshistogram -JX4/4 -W0.2 -F -Bxa1f0.5+l"Mw" \
-Bya250f125+l"# of models" -BSW -Glightgray \
-L0.1p -R4.5/7.5/0/500 -X0 -Y-4.5 -O -K >> $out

awk 'FNR>2{print $6}' $gwfm | \
gmt pshistogram -JX4/4 -W5 -F -Bxa50f25+l"Centroid Depth, km" \
-Bya250f125+l"# of models" -BSw -Glightgray \
-L0.1p -R0/100/0/500 -X5 -Y0 -O -K >> $out

awk 'FNR>2{print $18}' $gwfm | \
gmt pshistogram -JX4/4 -W5 -F -Bxa45f22.5+l"Dip, degrees" \
-Bya250f125+l"# of models" -BSw -Glightgray \
-L0.1p -R0/90/0/500 -X5 -Y0 -O -K >> $out

awk 'FNR>2{print $19}' $gwfm | \
gmt pshistogram -JX4/4 -W20 -F -Bxa90f45+l"Rake, degrees" \
-Bya250f125+l"# of models" -BSw -Glightgray \
-L0.1p -R-180/180/0/500 -X5 -Y0 -O -K >> $out

### Adding a statistics box in bottom right
gmt pslegend -Dx8.5/4/7/4 -R-10/10/-10/10 -JX1/1 -F+g240/240/240+p1p -O -K << END >> $out
H 12 1 $numev events in catalogue
D 0 1p
N 3
V 0 1p
S 0.1c c 0.1c white 0.25p 0.4c MT5
S 0.1c c 0.1c white 0.25p 0.4c P,pP,sP
S 0.1c c 0.1c white 0.25p 0.4c InSAR
V 0 1p
D 0 1p
T Catalogue of earthquakes studied using
T teleseismically-measured P and S waves
T to estimate point-source mechanisms and
T accurate centroid depths. Also included
T are moderate-magnitude events studied
T using InSAR constant-slip inversions.
END
gmt psmeca -R0/8.5/0/4 -JX8.5/4 -Sa0.3c \
-Glightred -W0.2p -O -X0 -Y0 -K << END >> $out
5.3 3 0 90 45 90 6.0 0 0
END
gmt psmeca -R0/8.5/0/4 -JX8.5/4 -Sa0.3c \
-Glightblue -W0.2p -O -X0 -Y0 -K << END >> $out
7.65 3 0 90 45 90 6.0 0 0
END
gmt psmeca -R0/8.5/0/4 -JX8.5/4 -Sa0.3c \
-Glightgreen -W0.2p -N -O -X0 -Y0 << END >> $out
10.0 3 0 90 45 90 6.0 0 0
END

gv $out
#gmt psconvert -Tj -E450 $out
gmt psconvert -Tf $out -A

################################
# Cleaning:
###############################
rm -rf gmt.* $out
