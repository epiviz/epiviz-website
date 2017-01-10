rm -r dist/*
# mkdir dist/
hugo -s home/ -d ../dist/
hugo -s tutorials/ -d ../dist/tutorials/
mkdir dist/documentation
cp -r documentation/ dist/