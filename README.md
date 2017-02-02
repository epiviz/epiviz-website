# github repo for epiviz-website using hugo

## installation instructions.
```
git clone epiviz/epiviz-website
git submodule init
git submodule update --recursive
```

## add a dist folder that maps to epiviz.github.io
`git submodule add -b master http://github.com/epiviz/epiviz.github.io.git dist`

# to build
`./build.sh`

# to publish to epiviz.github.io
`./deploy.sh`



