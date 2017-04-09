
# Makefile.am
#
# This file is part of fizmo.
#
# Copyright (c) 2009-2017 Christoph Ender.
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

.PHONY: libfizmo libmonospaceif libsndifsdl2 libdrilbo libglkif \
 fizmo-console fizmo-ncursesw fizmo-glktermw fizmo-remglk fizmo-sdl2


# default target

all: fizmo-ncursesw fizmo-console $(OPTIONAL_FIZMO_BUILDS)


# fizmo libraries

libfizmo:
	cd libfizmo ; \
	$(MAKE) install-dev

libmonospaceif: libfizmo
	cd libmonospaceif ; \
	$(MAKE) install-dev

libsndifsdl2: libfizmo
	cd libsndifsdl2 ; \
	$(MAKE) install-dev

libdrilbo: libfizmo
	cd libdrilbo ; \
	$(MAKE) install-dev

libglkif: libfizmo
	cd libglkif ; \
	$(MAKE) install-dev

libpixelif: libfizmo libdrilbo
	cd libpixelif ; \
	$(MAKE) install-dev


# fizmo frontends

fizmo-console: libfizmo
	cd fizmo-console ; \
	$(MAKE)

fizmo-ncursesw: libfizmo libmonospaceif libdrilbo $(OPTIONAL_SOUND_BUILD)
	cd fizmo-ncursesw ; \
	$(MAKE)

fizmo-glktermw: libfizmo libglkif
	cd fizmo-glktermw ; \
	$(MAKE)

fizmo-remglk: libfizmo libglkif
	cd fizmo-remglk ; \
	$(MAKE)

fizmo-sdl2: libfizmo libpixelif
	cd fizmo-sdl2 ; \
	$(MAKE)


# install targets

install-data-local-libsndifsdl2: libsndifsdl2
	cd libsndifsdl2 ; $(MAKE) install-data-local

install-data-local-libglkif: libglkif
	cd libglkif ; $(MAKE) install-data-local

install-data-local: libfizmo libmonospaceif libdrilbo \
 $(OPTIONAL_FIZMO_DATA_LOCAL_INSTALLS) \
 $(OPTIONAL_SOUND_INSTALL_DATA_LOCAL)
	cd libfizmo ; $(MAKE) install-data-local
	cd libmonospaceif ; $(MAKE) install-data-local
	cd libdrilbo ; $(MAKE) install-data-local

install-fizmo-console: fizmo-console
	cd fizmo-console ; $(MAKE) install

install-fizmo-ncursesw: fizmo-ncursesw
	cd fizmo-ncursesw ; $(MAKE) install ; $(MAKE) install-data-local

install-fizmo-glktermw: fizmo-glktermw
	cd fizmo-glktermw ; $(MAKE) install

install-fizmo-remglk: fizmo-remglk
	cd fizmo-remglk ; $(MAKE) install

install-fizmo-sdl2 : fizmo-sdl2
	cd libpixelif ; $(MAKE) install-data-local
	cd fizmo-sdl2 ; $(MAKE) install; $(MAKE) install-data-local

install: install-data-local install-fizmo-console install-fizmo-ncursesw \
 $(OPTIONAL_FIZMO_INSTALLS)


# clean targets

clean: $(OPTIONAL_FIZMO_CLEANS)
	cd libfizmo ; $(MAKE) clean
	cd libmonospaceif ; $(MAKE) clean
	cd libdrilbo ; $(MAKE) clean

clean-fizmo-glktermw: fizmo-glktermw
	cd fizmo-glktermw ; $(MAKE) clean

clean-fizmo-remglk: fizmo-remglk
	cd fizmo-remglk ; $(MAKE) clean

clean-fizmo-sdl2 : fizmo-sdl2
	cd libpixelif ; $(MAKE) clean
	cd fizmo-sdl2 ; $(MAKE) clean

clean-libsndifsdl2:
	cd libsndifsdl2 ; $(MAKE) clean

clean-libglkif:
	cd libglkif ; $(MAKE) clean ; $(MAKE) clean-dev

# distclean targets

distclean: $(OPTIONAL_FIZMO_DISTCLEANS)
	cd libfizmo ; $(MAKE) distclean
	cd libmonospaceif ; $(MAKE) distclean
	cd libdrilbo ; $(MAKE) distclean

distclean-fizmo-glktermw: fizmo-glktermw
	cd fizmo-glktermw ; $(MAKE) distclean

distclean-fizmo-remglk: fizmo-remglk
	cd fizmo-remglk ; $(MAKE) distclean

distclean-fizmo-sdl2 : fizmo-sdl2
	cd libpixelif ; $(MAKE) distclean
	cd fizmo-sdl2 ; $(MAKE) distclean

distclean-libsndifsdl2:
	cd libsndifsdl2 ; $(MAKE) distclean

distclean-libglkif:
	cd libglkif ; $(MAKE) distclean

