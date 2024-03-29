# README for the Global Waveform Catalogue v1.1

## Catalogue Key - in column order:

id   = Reference number for the event - this reference matches the icons
       included in gWFM_ICONS.

wlon = Longitude of the event quoted in the literature.

wlat = Latitude of the event quoted in the literature.

wzc  = Waveform-modelled depth of the event, which can be either hypocentral or centroid
       depending on the method used. All depths are given as depth below the plate surface,
       not sea level.

mth  = Waveform-modelling method used to determine the depth. This can be either:

       BWF = Long-period body-waveform modelling of event mechanism,
             depth, source-time function and magnitude as a point
             source. Usually using programs like MT5. Yields a centroid depth.
       DP  = Waveform modelling of the vertical-component broadband
             or short-period waveforms, typically fitting P,pP,sP
             but not solving explicitly for the mechanism. Yields a
             hypocentral depth.
       REG = Waveform modelling of body waves measured at regional distances.

ilon  = Longitude in the ISC-EHB bulletin [from Engdahl et al., 2020].

ilat  = Latitude in the ISC-EHB bulletin.

izc   = Hypocentral depth determined by the ISC bulletin.

ieb   = Hypocentral depth determined by the ISC-EHB bulletin.

mth   = ISC-EHB bulletin code for the method by which the depth is determined.
        The string is a combination of three upper-case letters and one
        lower case letter from the following:

        HEQ = origin time & hypocenter fixed
        DEQ = depth free (sedep <= 15 km)
        FEQ = depth fixed by review
        LEQ = depth fixed by program (sedep > 15 km)
        XEQ = poor solution (ser > 35 km)

        d = depth constrained by depth phases
            with sedep < 5 km and at least 3
            defining depth phases
        b = depth set to USGS broadband depth
        h = depth set to GCMT depth
        g = depth set to ISC-GEM depth provided
            there are no other constraints on
            depth
        o = depth set to 10 km for oceanic events
            provided there are no other constraints
            on depth
        c = depth set to 15 km for events within
            known regions of shallow seismicity
            provided there are no other constraints
            on depth
        t = depth set to 15 km for events within
            a radius (distance and depth) of 55 km
            to a trench provided there are no other
            constraints on depth
        v = depth set to 15 km for events within
            a radius (distance and depth) of 55 km
            to a volcano provided there are no other
            constraints on depth
        s = depth from research studies
        i = depth set to ISC depth
        x = depth reviewed but uncertain
            DEQ x assigned to events with sedep
            > 5 and < 15 km
        n = depth set to nearest neighbor with a
            well constrained depth
        z = explosion or earthquake location known
            to z km where z is a number from 0-9

clon  = Longitude from the global CMT catalogue [Dziewonski et al., 1981].

clat  = Latitude from the global CMT catalogue.

czc   = Centroid depth determined by the global CMT catalogue.

mth   = Method by which the CMT depth was determined. Can be either:

        FREE = Centroid depth is solved for as part of the CMT inversion.
        FIX  = Centroid depth is fixed during the inversion.
        BDY  = Depth is determined using body-wave depth phases.

st    = Nodal plane strike determined from waveform modelling. Convention
        is of Aki and Richards (2002) - i.e. +ve clockwise from north.

dp    = Nodel plane dip determined from waveform modelling.

rk    = Nodal plane rake determined from waveform modelling.

mth   = Mechanism by which the strike, dip and rake have been determined by
        the analyst. The code string is the essentially the same as that
        used for the depth, except with a few additions:

        BWF = Long-period body-waveform modelling of event mechanism,
              depth, source-time function and magnitude as a point
              source. Usually using programs like MT5. Yields a centroid depth.
        DP  = Waveform modelling of the vertical-component broadband
              or short-period waveforms, typically fitting P,pP,sP
              but not solving explicitly for the mechanism. Yields a
              hypocentral depth.
        REG = Waveform modelling of body waves measured at regional distances.
        FM  = P-wave first motion polarities used to determine the earthquake
              mechanism.

st    = Nodal plane strike determined by the global CMT.

dp    = Nodal plane dip determined from global CMT.

rk    = Nodal plane rake determined from global CMT.

%dc   = Percentage double-couple of the global CMT moment tensor
        determined using the expression of Jackson et al., (2002).

mag   = Magnitude determined from waveform-modelling or quoted in
        the literature.

mty   = Magnitude type: Mw = moment magnitude, mb = body-wave magnitude
        Ms = surface-wave magnitude.

reference = Source of the waveform-modelling study.

### A note on the earthquake magnitudes:

- Magnitudes are derived from three different sources. If the earthquake
  has been studied using long-period body-waveform modelling (i.e. has
  the code BWF in the mechanism method column), then the magnitude is determined by
  converting the moment release in Newton-metres into the moment magnitude
  using the expression Hanks et al., 1979. If the earthquake has been
  studied using vertical-component seismograms with a mechanism taken
  from the global CMT catalogue (i.e. has the code gCMT in the mechanism
  method column), then the moment magnitude is taken from the gCMT. Finally,
  if the earthquake has been studied using vertical-component seismograms
  and there is no gCMT mechanism or magnitude estimate, the magnitude is
  quoted from the original source of information regarding this earthquake,
  and is most often a body-wave magnitude (mb).

### A note on the reference:

- References are not necessarily where the earthquake was first
  modelled, but where the information came from in the catalogue.
  Therefore, you may need to follow a paper trail to find the
  original modelling. Eventually we will be trying to include
  figures of the original modelling with the catalogue.

- Upublished theses: Most of the theses mentioned are in the library
  at the Bullard laboratories and may become available through the
  University of Cambridge Apollo website in due course.

## References:

- ISC-EHB database is taken from: http://www.isc.ac.uk/isc-ehb/
- global CMT data is taken from: https://www.globalcmt.org/CMTfiles.html
- Jackson, J., Priestley, K., Allen, M., & Berberian, M. (2002). Active tectonics of the South Caspian Basin. Geophysical Journal International, 148(2), 214–245.
