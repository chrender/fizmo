#!/bin/sh

function xslt {
  if [ "$5" == "true" ]
  then
    OUTPUTFILE="${1}/`echo "$2" | tr '[:lower:]' '[:upper:]'`.txt"
  else
    OUTPUTFILE="${1}/${2}.txt"
  fi
  echo Processing \"${4}\".
  xsltproc -o "$OUTPUTFILE" "${3}" "${4}"
}

function print_syntax {
  echo Syntax: create-txts.sh \<output-dir\>.
  exit 1
}

SRCDIR=`dirname $0`

if [ $# -lt 1 ]
then
  print_syntax
fi

if [ $# -eq 2 ]
then
  if [ "$1" != "-u" ]
  then
    print_syntax
  fi
  UPPERCASE="true"
  shift
fi

xslt "${1}" "changelog" "$SRCDIR/changelog-ascii.xslt" "$SRCDIR/changelog.xml" $UPPERCASE

for srcfile in "$SRCDIR"/*.xml
do
  BASENAME="`basename $srcfile .xml`"
  if [ "$BASENAME" != "changelog" ]
  then
    xslt "${1}" "$BASENAME" "$SRCDIR/ascii.xslt" "$srcfile" "$UPPERCASE"
  fi
done

