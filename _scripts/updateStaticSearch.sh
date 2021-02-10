#!/usr/bin/bash

STATICSEARCH_HOME=../rcb-manual-staticSearch-1.1
WAX_HOME=`pwd`
CLASSPATH=/usr/share/java/ant-contrib.jar

# generate random 10-character string as version id
VERSION=`date +%s | sha256sum | base64 | head -c 10`
echo $VERSION > VERSION
echo "---
version: $VERSION" > _data/staticSearch.yml

# build the wax site for indexing
bundle exec jekyll build

# for Wax: remove the IIIF tiles directories (so staticSearch won't crawl them)
#rm -r _site/img/derivatives/iiif/images

# remove the staticSearch artefacts so they'll be regenerated
rm -r _site/staticSearch

# run html tidy on generated html pages to get proper xhtml for indexing
find _site -name \*.html | xargs -n 1 tidy -mq -asxhtml --drop-empty-elements no --numeric-entities yes

# run staticSearch to do the indexing
cd $STATICSEARCH_HOME
ant -DconfigFile=$WAX_HOME/_site/staticSearch-config.xml

# return to Wax, copy the staticSearch artefacts up from _site
cd $WAX_HOME
rsync -a --delete _site/staticSearch ./

# serve the site
bundle exec jekyll serve
