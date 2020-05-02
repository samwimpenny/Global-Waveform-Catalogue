# Global-Waveform-Catalogue (gWFM) v1.0

[![DOI](https://zenodo.org/badge/255866939.svg)](https://zenodo.org/badge/latestdoi/255866939)

## Catalogue Overview:

This is the central repository for the Global Waveform Catalogue (gWFM) v1.0, which is a database of point-source fault-plane solutions and focal depths for moderate-magnitude earthquakes that have been modelled by an analyst using synthetic seismograms. Most earthquakes have been modelled using the program MT5 [see McCaffrey et al., 1991, McCaffrey and Abers 1988], which is described in detail by Molnar and Lyon-Caen 1989 and Taymaz et al., 1990. A number of smaller earthquakes (Mw < 5.3) have also been studied by modelling the P, pP and sP phases on vertical-component short-period or broadband seismograms [e.g. Maggi et al., 2000].

Most of the earthquakes in this database come from the literature, with some solutions from theses that are available online.

The database is complimentary to other global catalogues of earthquakes, such as the global centroid moment tensor (gCMT) catalogue and the ISC-EHB bulletin. What this catalogue brings to the table are the well-constrained focal depths of moderate-magnitude earthquakes. A short manuscript describing origins of the gWFM and how it compares to the gCMT and ISC-EHB is currently in preparation.

## Downloading the Catalogue:

The easiest way to download the catalogue is using git. Run the following command to download the entire directory, including the catalogue and some scripts that you may find useful:

```
git clone https://github.com/samwimpenny/Global-Waveform-Catalogue.git
```

Then to keep up to date with new additions, run:

```
git pull
```

from within the cloned directory.

Alternatively, you could directly copy the catalogue file from the directory gWFM_MASTER/.

## Catalogue Layout:

A README file explaining the layout and syntax of the data table is provided in gWFM_MASTER.

## Contributing to the Catalogue:

If you have tables of waveform-modelled earthquakes that are not included in the current version of the gWFM, then we are happy to accept contributions. The best way to contribute is to send a ASCII table of the solution information to sew57@cam.ac.uk with the following format:

    yyyymmdd hhmm longitude latitude depth strike dip rake magnitude reference

## Quality Control and Errors in the Catalogue:

The vast majority of this catalogue has been typed by hand, but there may remain some typographical errors. If you find any, please email sew57@cam.ac.uk with the line in error and what you think it should read.

The quality control has included:
1) Checking for each entry for matching events in the ISC-EHB and gCMT with matching times (within +/- 1 minute) and locations (within +/- 0.5 degrees).
2) Checking all mechanisms where the %DC of the gCMT moment tensor is >80% but the Kagan angle [Kagan, 1991] between the waveform-modelled solution and the gCMT is > 50 degrees.
3) Removing any duplicate events that are not double shocks (highlighted in the catalogue as 'multiple point source').

## References:

* McCaffrey, R., & Abers, G. (1988). Syn3: A program for inversion of teleseismic body waveforms on microcomputers.
* McCaffrey, R., Abers, G., & Zwick, A. (1991). Inversion of teleseismic body waves, in Digital Seismogram Analysis and Waveform Inversion. W. Lee (ed.), IASPEI Software Library, chapter 3: IASPEI Software Library, Vol. 3, Menlo Park, USA.
* Molnar, P., & Lyon-Caen, H. (1989). Fault plane solutions of earthquakes and active tectonics of the Tibetan Plateau and its margins. Geophysical Journal International, 99(1), 123–154.
* Taymaz, T., Jackson, J. & McKenzie, D., 1991. Active tectonics of the north and central Aegean Sea, Geophysical Journal International, 106, 433-490.
* Maggi, A., Jackson, J. A., Priestley, K., & Baker, C. (2000). A re-assessment of focal depth distributions in southern Iran, the Tien Shan and northern India: Do earthquakes really occur in the continental mantle Geophysical Journal International, 143(3), 629–661.
