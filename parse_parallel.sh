find NHD/NHDPlus??/NHDPlus*/NHDSnapshot/Hydrography/*lowline.shp | \
    parallel ./join.sh > all_joined.geojson
