
AUTOMAKE_OPTIONS = -Wno-override

# localedir = $(datarootdir)/fizmo/locales

# if FIZMO_BUILD_PREFIX_EMPTY
#   fizmo_build_prefix=$(DESTDIR)$(prefix)
# endif

# PKG_DIR = $(fizmo_build_prefix)/lib/pkgconfig
# PKGFILE = $(PKG_DIR)/libfizmo.pc

# SUBDIRS = libfizmo .

# install-locales::
# 	mkdir -p $(DESTDIR)$(localedir)
# 	for l in `cd src/locales ; ls -d ??_??`; \
# 	  do \
# 	  mkdir -p $(DESTDIR)$(localedir)/$$l; \
# 	  cp src/locales/$$l/*.txt $(DESTDIR)$(localedir)/$$l; \
# 	done

#export PKG_CONFIG_PATH=$(PKG_CONFIG_PATH):$(DEV_BUILD_PREFIX)/lib/pkgconfig ; \
#./configure $(AC_CONFIGURE_ARGS) ; 

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

# distclean:
#	cd libcellif ; make distclean
#	cd libfizmo ; make distclean

.PHONY: libfizmo libcellif libsndifsdl libdrilbo fizmo-ncursesw

