#!/bin/sh

cvs co libfizmo
cvs co libcellif
cvs co libsndifsdl
cvs co libdrilbo
cvs co libglkif
cvs co fizmo-console
cvs co fizmo-ncursesw
cvs co fizmo-glktermw

#rm -r CVS
#find libfizmo libcellif libsndifsdl libdrilbo fizmo-console fizmo-ncursesw \
#  -name CVS -print0 | xargs -0 rm -r

rm libfizmo/config.default.mk
rm libcellif/config.default.mk
rm libsndifsdl/config.default.mk
rm libdrilbo/config.default.mk
rm libglkif/config.default.mk
rm fizmo-console/config.default.mk
rm fizmo-ncursesw/config.default.mk
rm fizmo-glktermw/config.default.mk

rm libfizmo/config.macports.mk
rm libcellif/config.macports.mk
rm libsndifsdl/config.macports.mk
rm libdrilbo/config.macports.mk
rm libglkif/config.macports.mk
rm fizmo-console/config.macports.mk
rm fizmo-ncursesw/config.macports.mk
rm fizmo-glktermw/config.macports.mk

#rm build.sh

