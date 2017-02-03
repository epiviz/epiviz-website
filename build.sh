rm -r dist/*
# mkdir dist/
hugo -s home/ -d ../dist/
hugo -s tutorials/ -d ../dist/tutorials/
mkdir dist/documentation
cp -r documentation/ dist/

hugo -s metaviz/ -d ../dist/metaviz/
cp -r metavizDocumentation/dataprovider/ dist/metaviz/documentation/
cp -r metavizDocumentation/metavizr/ dist/metaviz/documentation/
cp metavizDocumentation/IntroToMetavizr.html dist/metaviz/documentation/