#!/bin/bash
#
#3 <#> a <http://purl.org/twc/vocab/conversion/ConversionTrigger> ;
#3     rdfs:seeAlso <https://github.com/timrdf/csv2rdf4lod-automation/wiki/Conversion-trigger>,
#3                  <https://github.com/timrdf/csv2rdf4lod-automation/blob/master/bin/cr-create-convert-sh.sh> .
#
# datasetID versionID (lastModDate):
# 1554-frbr-demo-www 2011-Sep-15 ()
#--------------------------------------------------------------

CSV2RDF4LOD_HOME=${CSV2RDF4LOD_HOME:?"not set; source csv2rdf4lod/source-me.sh or see https://github.com/timrdf/csv2rdf4lod-automation/wiki/CSV2RDF4LOD-not-set"}

# The identifiers used to name the dataset that will be converted.
#            (see https://github.com/timrdf/csv2rdf4lod-automation/wiki/Conversion-process-phase:-name)
surrogate="http://logd.tw.rpi.edu" # Came from $CSV2RDF4LOD_BASE_URI when cr-create-convert-sh.sh created this script.
sourceID="data-gov"               # Came from directory name ../../../ (see https://github.com/timrdf/csv2rdf4lod-automation/wiki/Directory-Conventions)
datasetID="1554-frbr-demo-www"             # Came from directory name ../../ (see https://github.com/timrdf/csv2rdf4lod-automation/wiki/Directory-Conventions)
datasetVersion="2011-Sep-15"        # DEPRECATED
versionID="2011-Sep-15"             # Came from directory name ../ (see https://github.com/timrdf/csv2rdf4lod-automation/wiki/Directory-Conventions) renaming datasetVersion (deprecating datasetVersion)
eID="1"                             # enhancement identifier
if [[ ${1:-"."} == "-e" && $# -ge 2 ]]; then
   eID="$2" # see https://github.com/timrdf/csv2rdf4lod-automation/wiki/Generating-enhancement-parameters
fi


destDir="automatic"                 # convention has led to always be 'automatic'; the directory where the converted RDF is put.
#--------------------------------------------------------------


#-----------------------------------
# source/csv
sourceDir="source"
datafile="csv"
data="$sourceDir/$datafile"
# Bootstrap conversion parameters (see https://github.com/timrdf/csv2rdf4lod-automation/wiki/Conversion-trigger):
subjectDiscriminator=""             # Additional part of URI for subjects created; must be URI-ready (e.g., no spaces).
commentCharacter="#"                 # ONLY one character; complain to http://sourceforge.net/projects/javacsv/ otherwise.
cellDelimiter=","                   # ONLY one character; complain to http://sourceforge.net/projects/javacsv/ otherwise.
header=1                             # Line that header is on; only needed if not '1'. '0' means no header.
dataStart=                          # Line that data starts; only needed if not immediately after header.
repeatAboveIfEmptyCol=              # 'Fill in' value from row above for this column.
onlyIfCol=                          # Do not process if value in this column is empty
interpretAsNull=                    # NO SPACES
dataEnd=                            # Line on which data stops; only needed if non-data bottom matter (legends, footnotes, etc).
source $CSV2RDF4LOD_HOME/bin/convert.sh


#-----------------------------------
source $CSV2RDF4LOD_HOME/bin/convert-aggregate.sh
# ^^ Note, this step can also be done manually using publish/bin/publish.sh
