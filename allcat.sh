rm -f rivers-joined.mbtiles

for f in NHD/NHDPlus??/NHDPlus*/NHDSnapshot/Hydrography/*lowline.shp; do
    >&2 echo "processing $f"
    DBF=`echo $f | cut -d '/' -f 1-3`"/NHDPlusAttributes/PlusFlowlineVAA.dbf"
    shp2json $f | node ~/src/geojson-join/geojson-join $DBF \
        --format=dbf \
        --geojsonField=COMID \
        --againstField=ComID
done | tippecanoe -o rivers-joined.mbtiles -y StreamOrde
