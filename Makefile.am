
# Makefile.am
#
# This file is part of fizmo.
#
# Copyright (c) 2009-2015 Christoph Ender.
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

.PHONY: libfizmo libcellif libsndifsdl2 libdrilbo libglkif \
 fizmo-console fizmo-ncursesw fizmo-glktermw


# default target

all: fizmo-ncursesw fizmo-console $(OPTIONAL_FIZMO_BUILDS)


# fizmo libraries

libfizmo:
	cd libfizmo ; \
	$(MAKE) install-dev

libcellif: libfizmo
	cd libcellif ; \
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


# install targets

install-data-local-libsndifsdl2: libsndifsdl2
	cd libsndifsdl2 ; $(MAKE) install-data-local

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

install: install-data-local install-fizmo-console install-fizmo-ncursesw \
 $(OPTIONAL_FIZMO_INSTALLS)


# clean targets

clean-local: $(OPTIONAL_FIZMO_CLEANS)
	cd libfizmo ; $(MAKE) clean
	cd libcellif ; $(MAKE) clean
	cd libdrilbo ; $(MAKE) clean
	cd fizmo-console ; $(MAKE) clean
	cd fizmo-ncursesw ; $(MAKE) clean
	rm -rf $(DEV_BUILD_PREFIX)

clean-fizmo-glktermw: fizmo-glktermw
	cd libglkif ; $(MAKE) clean ; $(MAKE) clean-dev
	cd fizmo-glktermw ; $(MAKE) clean

clean-libsndifsdl2:
	cd libsndifsdl2 ; $(MAKE) clean ; $(MAKE) clean-dev

# distclean targets

distclean-local: $(OPTIONAL_FIZMO_DISTCLEANS)
	cd libfizmo ; $(MAKE) distclean
	cd libcellif ; $(MAKE) distclean
	cd libdrilbo ; $(MAKE) distclean
	cd fizmo-console ; $(MAKE) distclean
	cd fizmo-ncursesw ; $(MAKE) distclean

distclean-fizmo-glktermw: fizmo-glktermw
	cd libglkif ; $(MAKE) distclean
	cd fizmo-glktermw ; $(MAKE) distclean

distclean-libsndifsdl2:
	cd libsndifsdl2 ; $(MAKE) distclean

