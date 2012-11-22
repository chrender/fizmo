
AUTOMAKE_OPTIONS = -Wno-override


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

fizmo-console: libfizmo
	cd fizmo-console ; \
	$(MAKE)

fizmo-ncursesw: libfizmo libcellif libsndifsdl libdrilbo
	cd fizmo-ncursesw ; \
	$(MAKE)

fizmo-glktermw: libfizmo libglkif
	cd fizmo-glktermw ; \
	$(MAKE)

fizmo-sdl: libfizmo libpixelif
	cd fizmo-sdl ; \
	$(MAKE)

install-locales: libfizmo libcellif libsndifsdl libdrilbo
	cd libfizmo ; $(MAKE) install-locales
	cd libcellif ; $(MAKE) install-locales
	cd libsndifsdl ; $(MAKE) install-locales
	cd libdrilbo ; $(MAKE) install-locales

install-fizmo-console: fizmo-console
	cd fizmo-console ; $(MAKE) install

install-fizmo-ncursesw: fizmo-ncursesw
	cd fizmo-ncursesw ; $(MAKE) install ; $(MAKE) install-locales

install-fizmo-glktermw: fizmo-glktermw
	cd libglkif ; $(MAKE) install-locales
	cd fizmo-glktermw ; $(MAKE) install

install-fizmo-sdl : fizmo-sdl
	cd libpixelif ; $(MAKE) install-locales
	cd fizmo-sdl ; $(MAKE) install

install: install-locales install-fizmo-console install-fizmo-ncursesw \
 $(OPTIONAL_FIZMO_INSTALLS)

all: fizmo-ncursesw fizmo-console $(OPTIONAL_FIZMO_BUILDS)

.PHONY: libfizmo libcellif libsndifsdl libdrilbo libglkif \
 fizmo-console fizmo-ncursesw fizmo-glktermw fizmo-sdl

