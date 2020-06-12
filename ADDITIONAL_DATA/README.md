# Additional Data Tables - Wimpenny and Watson, 2020 (in review)

This directory contains the data tables used to perform the
calculations and benchmarking in the paper Wimpenny and Watson
2020. There are three tables:

- gWFM_v1.0.txt: The original version of the Global Waveform Catalogue
- gWFM_WPHASE.txt: A data table containing events in the Global Waveform Catalogue
  that have matching solutions in the USGS W-phase catalogue.
- gWFM_INSAR.txt: A data table containing events in the Global Waveform Catalogue
  that also have independent estimates of the focal mechanism and depth of slip
  derived using InSAR, GPS and levelling.

## Key for gWFM_INSAR.txt:

- Depth estimates:

    zwf = body-waveform modelled centroid depth
    zcm = gCMT depth estimate
    zwp = USGS W-phase depth estimate
    zeh = ISC-EHB depth estimate
    ztp = top of the fault plane derived from geodesy
    zbt = bottom of the fault plane derived from geodesy
    zmx = depth of maximum slip derived from geodesy
