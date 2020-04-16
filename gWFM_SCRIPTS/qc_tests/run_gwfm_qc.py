''' Runs a series of quality control tests
    on the global waveform catalogue that do:
    1) Creates a list of all entries that may
       be duplicates based on date,time.
    2) Creates a list of events that have
       different fault-plane solutions in
       the gCMT column to the BWF column.
    3) Flags all events that do not have a
       matching solution from ISC-EHB and
       gCMT, but are large enough that they
       should be in the database.'''

# Modules
from numpy import array,where,abs
import seismic as sm

######################################
# Variables:
######################################

gwfm = '/Users/samwimpenny/Documents/Postdoc/Forelands/SEISMOLOGY/CATALOGUES/gWFM/gWFM_MASTER/gWFM_v1.0.txt'

######################################
# Functions:
######################################

def parse_gwfm(infile,headlen=2):
    ''' Reads the global waveform
    catalogue to a Python list'''
    print('Reading gWFM catalogue')
    gwfm = []
    i = 0
    with open(infile) as gwfm_list:
        for line in gwfm_list:
            if i > headlen - 1:
                vals = line.split()
                id = vals[0]
                date = vals[1]
                time = vals[2]
                wlon = vals[3]
                wlat = vals[4]
                wzc = vals[5]
                wzc_mth = vals[6]
                ilon = vals[7]
                ilat = vals[8]
                izc = vals[9]
                izc_mth = vals[10]
                ndp = vals[11]
                clon = vals[12]
                clat = vals[13]
                czc = vals[14]
                czc_mth = vals[15]
                wst = vals[16]
                wdp = vals[17]
                wrk = vals[18]
                wmech_mth = vals[19]
                cst = vals[20]
                cdp = vals[21]
                crk = vals[22]
                dc = vals[23]
                mag = vals[24]
                mtype = vals[25]
                refstr = ' '.join(vals[26:])
                gwfm.append([id,date,time,wlon,wlat,wzc,wzc_mth,ilon,ilat,izc,izc_mth,ndp,\
                clon,clat,czc,czc_mth,wst,wdp,wrk,wmech_mth,cst,cdp,crk,dc,mag,mtype,refstr])
            i = i+1
        return gwfm


def find_duplicates(gwfmlist):
    ''' Checks for matching dates and
    times of events, then creates a
    list to manually check'''

    print('\n')
    print('Finding Duplicates: \n')
    i = 0
    for line in gwfmlist:
        i_date = array([ line[1]==ev_wfm[1] for ev_wfm in gwfmlist[i+1:] ])
        i_time = array([ line[2]==ev_wfm[2] for ev_wfm in gwfmlist[i+1:] ])
        ind = where(i_date*i_time)[0]

        if len(ind)>0:
            # Checking whether they are multiple point sources
            for k in ind:
                if len(gwfmlist[i+1:][k][26].split(',')) == 1:
                    print('ID: ', line[0], 'has duplicate: ', gwfmlist[i+1:][k][0])
                elif len(gwfmlist[i+1:][k][26].split(',')) == 2:
                    print('ID:', line[0], 'has duplicate:', gwfmlist[i+1:][k][0], \
                    'but', gwfmlist[i+1:][k][26].split(',')[1])

        i = i+1


def find_no_gcmt_isc(gwfmlist):
    ''' Searches for entries in the
    list that have no ISC AND no
    gCMT entry, but only for Mw 4.5
    or larger '''

    print('\n')
    print('Events with no gCMT or ISC: \n')

    for line in gwfmlist:
        if line[7] == '-' and line[12] == '-' and float(line[24]) > 4.7 \
        and int(line[1]) > 19650000 and int(line[1])<20190000:
            print(line)

def check_next_line(gwfmlist):
    ''' Checks whether the locations
    are similar'''

    print('\n')
    print('Checking matching locations:')

    for line in gwfmlist:
        wlon=line[3]
        wlat=line[4]
        ilon=line[7]
        ilat=line[8]
        clon=line[12]
        clat=line[13]

        if ilon != '-' and ilat != '-':
            dlon = abs(float(wlon) - float(ilon))
            dlat = abs(float(wlat) - float(ilat))
            if dlon > 0.5 and dlat > 0.5:
                print('isc wrong')
                print(line)

        if clon != '-' and clat != '-':
            dlon = abs(float(wlon) - float(clon))
            dlat = abs(float(wlat) - float(clat))
            if dlon > 0.5 and dlat > 0.5:
                print('cmt wrong')
                print(line)

######################################
# Main Script:
######################################

# Read waveform to list:
gwfmlist = parse_gwfm(gwfm)

# Makes a list of date & time duplicates:
find_duplicates(gwfmlist)

# Makes a list of events without gWFM or
# gCMT solution - suggests somethings up...
find_no_gcmt_isc(gwfmlist)

# Checking that the CMT solutions
# match reasonably well...
check_next_line(gwfmlist)
