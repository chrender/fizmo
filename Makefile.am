
AUTOMAKE_OPTIONS = -Wno-override


all: fizmo-ncursesw fizmo-console $(OPTIONAL_FIZMO_BUILDS)

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

fizmo-ncursesw: libfizmo libcellif libsndifsdl libdrilbo
	cd fizmo-ncursesw ; \
	$(MAKE)

fizmo-console: libfizmo
	cd fizmo-console ; \
	$(MAKE)

libglkif: libfizmo
	cd libglkif ; \
	$(MAKE) install-dev

fizmo-glktermw: libfizmo libglkif
	cd fizmo-glktermw ; \
	$(MAKE)

install: all $(OPTIONAL_FIZMO_INSTALLS)
	cd libfizmo ; $(MAKE) install-locales
	cd libcellif ; $(MAKE) install-locales
	cd libsndifsdl ; $(MAKE) install-locales
	cd libdrilbo ; $(MAKE) install-locales
	cd fizmo-ncursesw ; $(MAKE) install ; $(MAKE) install-locales
	cd fizmo-console ; $(MAKE) install

install-fizmo-glktermw: fizmo-glktermw
	cd libglkif ; $(MAKE) install-locales
	cd fizmo-glktermw ; $(MAKE) install

.PHONY: libfizmo libcellif libsndifsdl libdrilbo fizmo-ncursesw

