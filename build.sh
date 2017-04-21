# remove everything in current dist
rm -r dist/*

# build epiviz hugo instance
hugo -s home/ -d ../dist/

# build tutorial hugo instance
hugo -s tutorials/ -d ../dist/tutorials/

# copy epiviz documentation
cp -r documentation dist/documentation/app

# build metaviz hugo instance
hugo -s metaviz/ -d ../dist/metaviz/

# copy metaviz documentation
cp -r metavizDocumentation/dataprovider/ dist/metaviz/documentation/
cp -r metavizDocumentation/metavizr/ dist/metaviz/documentation/
cp metavizDocumentation/IntroToMetavizr.html dist/metaviz/documentation/IntroToMetavizr.html

# build polymer documentation
mkdir dist/polymer

# build epiviz-chart documentation
cp -r polymer-epiviz-chart dist/polymer/charts
cd dist/polymer/charts
bower install
bower install hcbravolab/epiviz-chart
sed -i 's/bower_components/components/g' components/epiviz-charts/index.html
echo "<META http-equiv="refresh" content=\"0;URL=charts/components/epiviz-charts/\">" >index.html
cd ../../..

# build epiviz-data-source documentation
cp -r polymer-epiviz-ds dist/polymer/datasource
cd dist/polymer/datasource
bower install
bower install hcbravolab/epiviz-data-source
sed -i 's/bower_components/components/g' components/epiviz-data-source/index.html
echo "<META http-equiv="refresh" content=\"0;URL=datasource/components/epiviz-data-source/\">" >index.html
cd ../../..