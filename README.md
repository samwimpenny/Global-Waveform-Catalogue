# Global-Waveform-Catalogue (gWFM)

## Catalogue Overview:

This is the central repository for the Global Waveform Catalogue (gWFM), which is a database of earthquakes that have been studied by an analyst and modelled using synthetic seismograms with programs like MT5 [Zwick et al., 1994]. Most of the earthquakes in this database come from the literature, however there are also a number of solutions that are as yet unpublished. The purpose of including unpublished solutions is to prevent people re-inventing the wheel.

The database is complimentary to other global catalogues of earthquakes, such as the global centroid moment tensor (gCMT) project and the ISC-EHB database. What this catalogue specifically brings to the table are the well-constrained focal depths of moderate-magnitude earthquakes. A short manuscript describing origins of the gWFM database and how it compares to the gCMT and ISC-EHB is currently in prep.

## Downloading the Catalogue:

The easiest way to download the catalogue is using git. Run the following command to download the entire directory, including the catalogue and some scripts that you may find useful:

```
git clone https://github.com/samwimpenny/Global-Waveform-Catalogue.git
```

Alternatively, you could directly copy the catalogue file from the directory gWFM_MASTER/.

## Catalogue Layout:

A README file explaining the layout and syntax of the data table is provided in gWFM_MASTER.

## Contributing to the Catalogue:

If you have tables of waveform-modelled earthquakes that are not included in the current version of the gWFM, then we are happy to accept contributions. The best way to contribute is to send a ASCII table of the solution information to sew57@cam.ac.uk with the following format:

    yyyymmdd hhmm longitude latitude depth strike dip rake magnitude reference
