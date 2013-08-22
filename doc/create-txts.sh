#!/bin/sh

SRCDIR=`dirname $0`

if [ $# -ne 1 ]
then
  echo Syntax: create-txts.sh \<output-dir\>.
  exit 1
fi

for srcfile in "$SRCDIR"/*.xml
  do
    BASENAME="`basename $srcfile .xml`"
  echo Processing \"${BASENAME}.xml\".
  echo xsltproc -o "${1}/$BASENAME.txt" "$SRCDIR/ascii.xslt" "$srcfile"
done

