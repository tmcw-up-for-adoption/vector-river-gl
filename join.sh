DBF=`echo $1 | cut -d '/' -f 1-3`"/NHDPlusAttributes/PlusFlowlineVAA.dbf"
shp2json $1 | node ~/src/geojson-join/geojson-join $DBF \
    --format=dbf \
    --geojsonField=COMID \
    --againstField=ComID
