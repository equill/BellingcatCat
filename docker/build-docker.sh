VERSION='0.0.4'
cp ../schemas/bellingcatcat.json ./
docker build . -t equill/bellingcatcat:$VERSION
rm bellingcatcat.json
