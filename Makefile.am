
# Makefile.am
#
# This file is part of fizmo.
#
# Copyright (c) 2009-2012 Christoph Ender.
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
# 1. Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.
# 3. The name of the author may not be used to endorse or promote products
#    derived from this software without specific prior written permission.
# 
# THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
# IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
# OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
# IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
# NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
# THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.



# option settings

AUTOMAKE_OPTIONS = -Wno-override

.PHONY: libfizmo libcellif libsndifsdl libdrilbo libglkif \
 fizmo-console fizmo-ncursesw fizmo-glktermw fizmo-sdl


# default target

all: fizmo-ncursesw fizmo-console $(OPTIONAL_FIZMO_BUILDS)


# fizmo libraries

libfizmo:
	cd libfizmo ; \
	$(MAKE) install-dev

libcellif: libfizmo
	cd libcellif ; \
	$(MAKE) install-dev

libsndifsdl: libfizmo
	cd libsndifsdl ; \
	$(MAKE) install-dev

libdrilbo: libfizmo
	cd libdrilbo ; \
	$(MAKE) install-dev

libglkif: libfizmo
	cd libglkif ; \
	$(MAKE) install-dev

libpixelif: libfizmo
	cd libpixelif ; \
	$(MAKE) install-dev


# fizmo frontends

fizmo-console: libfizmo
	cd fizmo-console ; \
	$(MAKE)

fizmo-ncursesw: libfizmo libcellif libdrilbo $(OPTIONAL_SOUND_BUILD)
	cd fizmo-ncursesw ; \
	$(MAKE)

fizmo-glktermw: libfizmo libglkif
	cd fizmo-glktermw ; \
	$(MAKE)

fizmo-sdl: libfizmo libpixelif
	cd fizmo-sdl ; \
	$(MAKE)


# install targets

install-data-local-libsndifsdl: libsndifsdl
	cd libsndifsdl ; $(MAKE) install-data-local

install-data-local: libfizmo libcellif libdrilbo \
 $(OPTIONAL_SOUND_INSTALL_DATA_LOCAL)
	cd libfizmo ; $(MAKE) install-data-local
	cd libcellif ; $(MAKE) install-data-local
	cd libdrilbo ; $(MAKE) install-data-local

install-fizmo-console: fizmo-console
	cd fizmo-console ; $(MAKE) install

install-fizmo-ncursesw: fizmo-ncursesw
	cd fizmo-ncursesw ; $(MAKE) install ; $(MAKE) install-data-local

install-fizmo-glktermw: fizmo-glktermw
	cd libglkif ; $(MAKE) install-data-local
	cd fizmo-glktermw ; $(MAKE) install

install-fizmo-sdl : fizmo-sdl
	cd libpixelif ; $(MAKE) install-data-local
	cd fizmo-sdl ; $(MAKE) install; $(MAKE) install-data-local

install: install-data-local install-fizmo-console install-fizmo-ncursesw \
 $(OPTIONAL_FIZMO_INSTALLS)


# clean targets

clean: $(OPTIONAL_FIZMO_CLEANS)
	cd libfizmo ; $(MAKE) clean
	cd libcellif ; $(MAKE) clean
	cd libdrilbo ; $(MAKE) clean

clean-fizmo-glktermw: fizmo-glktermw
	cd libglkif ; $(MAKE) clean
	cd fizmo-glktermw ; $(MAKE) clean

clean-fizmo-sdl : fizmo-sdl
	cd libpixelif ; $(MAKE) clean
	cd fizmo-sdl ; $(MAKE) clean

clean-libsndifsdl:
	cd libsndifsdl ; $(MAKE) clean

# distclean targets

distclean: $(OPTIONAL_FIZMO_DISTCLEANS)
	cd libfizmo ; $(MAKE) distclean
	cd libcellif ; $(MAKE) distclean
	cd libdrilbo ; $(MAKE) distclean

distclean-fizmo-glktermw: fizmo-glktermw
	cd libglkif ; $(MAKE) distclean
	cd fizmo-glktermw ; $(MAKE) distclean

distclean-fizmo-sdl : fizmo-sdl
	cd libpixelif ; $(MAKE) distclean
	cd fizmo-sdl ; $(MAKE) distclean

distclean-libsndifsdl:
	cd libsndifsdl ; $(MAKE) distclean

