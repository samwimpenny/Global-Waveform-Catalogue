#!/bin/bash
### Making icons for the global-waveform
### catalogue - stores them in icondir
### with the name ${id}.png

# Variables:
headlen=3
catalogue=../gWFM_MASTER_PUBLIC/gWFM_v1.0.txt
icondir=icons
num=`wc -l < $catalogue`

# Cleaning pre-existing icons
if [[ ! -e $icondir ]];then
  mkdir $icondir
else
  rm -rf $icondir/*
fi

gmt gmtset PS_PAGE_ORIENTATION portrait

# Looping over entries and making focal mechanisms
for i in `seq $headlen $num`;do

  id=`awk -v i=$i 'FNR==i{print $1}' $catalogue`
  strike=`awk -v i=$i 'FNR==i{print $17}' $catalogue`
  dip=`awk -v i=$i 'FNR==i{print $18}' $catalogue`
  rake=`awk -v i=$i 'FNR==i{print $19}' $catalogue`
  method=`awk -v i=$i 'FNR==i{print $20}' $catalogue`
  echo $id

  # If a mechanism exists, make focal-mechanism.
  if [[ $strike != "-" && $method == "BWF" ]];then

    echo 0.5 0.5 1 $strike $dip $rake 6.0 0 0 | \
    gmt psmeca -R0/1/0/1 -JX1/1 -Sa0.5c -Glightred \
    -W0.2p > ${icondir}/${id}.ps
    gmt psconvert ${icondir}/${id}.ps -TG -A
    rm -rf ${icondir}/${id}.ps

  elif [[ $strike != "-" && $method != "BWF" ]];then

    echo 0.5 0.5 1 $strike $dip $rake 5.0 0 0 | \
    gmt psmeca -R0/1/0/1 -JX1/1 -Sa0.5c -Glightblue \
    -W0.2p > ${icondir}/${id}.ps
    gmt psconvert ${icondir}/${id}.ps -TG -A
    rm -rf ${icondir}/${id}.ps

  elif [[ $strike == "-" ]];then

    echo 0.5 0.5 | \
    gmt psxy -R0/1/0/1 -JX1/1 -Sc0.5c -Glightblue -W0.2p > ${icondir}/${id}.ps
    gmt psconvert ${icondir}/${id}.ps -TG -A
    rm -rf ${icondir}/${id}.ps

  fi

done

rm -rf gmt.*
