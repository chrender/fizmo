
CONFIG_EXISTS := $(wildcard config.mk)

default:
	@echo
	@echo
	@echo '  How to build:'
	@echo
	@echo '  First, create a "config.mk" from "config.default.mk" or "config.macports.mk"'
	@echo '  and adjust variables as requried.'
	@echo
	@echo '  Second, install the locale files:'
	@echo '  "make install-locales"'
	@echo
	@echo '  Third, choose one or more of the following:'
	@echo '  "make install-fizmo-ncursesw" will build and install ncursesw-based fizmo.'
	@echo '  "make install-fizmo-console" will create a plain, console-based fizmo.'
	@echo '  "make install-fizmo-glktermw" will build an GLK-based, experimental fizmo.'
	@echo
	@echo '  Optionally, libraries and development files may be installed using:'
	@echo '  "cd <library-name> ; make install-dev"'
	@echo '  where "library-name" is one out of:'
	@echo '  "libfizmo", "libcellif", "libdrilbo", "libsndifsdl" or "libglkif".'
	@echo
	@echo

all: fizmo-console fizmo-ncursesw fizmo-glktermw

ifeq ($(strip $(CONFIG_EXISTS)),)

include config.default.mk

test_config:
	@echo
	@echo No file \"config.mk\" was found, using \"config.default.mk\".
	@echo
	cp config.default.mk config.mk
else

include config.mk

test_config:
	@true

endif


.PHONY : \
 all install install-locales clean distclean \
 libfizmo libcellif libsndifsdl libdrilbo libglkif \
 fizmo-console fizmo-ncursesw fizmo-glktermw \
 subdir-configs \
 libfizmo-config libcellif-config libsndifsdl-config \
 libdrilbo-config libglkif-config \
 fizmo-ncursesw-config fizmo-console-config fizmo-glktermw-config \
 build-dir

export DEV_INSTALL_PATH = build
#export DEV_INSTALL_PREFIX = $(CURDIR)/$(DEV_INSTALL_PATH)
export fizmo_build_prefix=$(CURDIR)/$(DEV_INSTALL_PATH)
export PKG_CONFIG_PATH:=$(PKG_CONFIG_PATH):$(fizmo_build_prefix)/lib/pkgconfig

install: install-locales install-fizmo-console install-fizmo-ncursesw \
 install-fizmo-glktermw

fizmo-console:: fizmo-console-config libfizmo
	cd fizmo-console ; make

install-fizmo-console:: fizmo-console
	cd fizmo-console ; make install

fizmo-ncursesw:: fizmo-ncursesw-config libfizmo libcellif libsndifsdl libdrilbo
	cd fizmo-ncursesw; make

fizmo-glktermw:: fizmo-glktermw-config libfizmo libglkif
	cd fizmo-glktermw; make

install-fizmo-ncursesw:: fizmo-ncursesw
	cd fizmo-ncursesw; make install

install-fizmo-glktermw:: fizmo-glktermw
	cd fizmo-glktermw; make install

libfizmo:: build-dir libfizmo-config
	cd libfizmo ; make install-dev

libcellif: libcellif-config build-dir libfizmo
	cd libcellif; make install-dev

libsndifsdl: libsndifsdl-config build-dir libfizmo
ifdef SOUND_INTERFACE_NAME
ifdef SOUND_INTERFACE_STRUCT_NAME
ifdef SOUND_INTERFACE_STRUCT_NAME
	cd libsndifsdl; make install-dev
endif
endif
endif

libdrilbo: libdrilbo-config build-dir libfizmo
ifdef ENABLE_X11_IMAGES
	cd libdrilbo; make install-dev
endif

drilbo-test: libdrilbo-config build-dir libfizmo
ifdef ENABLE_X11_IMAGES
	cd libdrilbo; make test
endif

libglkif: libglkif-config build-dir libfizmo
	cd libglkif; make install-dev

clean: subdir-configs
	cd fizmo-glktermw ; make clean
	cd fizmo-ncursesw ; make clean
	cd fizmo-console ; make clean
	cd libglkif ; make clean
	cd libdrilbo ; make clean
	cd libsndifsdl ; make clean
	cd libcellif ; make clean
	cd libfizmo ; make clean

distclean: subdir-configs
	cd fizmo-glktermw ; make distclean
	cd fizmo-ncursesw ; make distclean
	cd fizmo-console ; make distclean
	cd libglkif ; make distclean
	cd libdrilbo ; make distclean
	cd libsndifsdl ; make distclean
	cd libcellif ; make distclean
	cd libfizmo ; make distclean
	rm -rf $(DEV_INSTALL_PATH)

install-locales: subdir-configs
	cd libdrilbo ; make install-locales
	cd libsndifsdl ; make install-locales
	cd libcellif ; make install-locales
	cd libfizmo ; make install-locales
	cd libglkif ; make install-locales

subdir-libs-configs: libfizmo-config libcellif-config libsndifsdl-config \
 libdrilbo-config libglkif-config

subdir-configs: libfizmo-config libcellif-config libsndifsdl-config \
 libdrilbo-config libglkif-config fizmo-ncursesw-config fizmo-console-config \
 fizmo-glktermw-config

libfizmo-config:: test_config
	cp config.mk libfizmo/config.mk

libcellif-config:: test_config
	cp config.mk libcellif/config.mk

libsndifsdl-config:: test_config
	cp config.mk libsndifsdl/config.mk

libdrilbo-config:: test_config
	cp config.mk libdrilbo/config.mk

libglkif-config:: test_config
	cp config.mk libglkif/config.mk

fizmo-glktermw-config:: test_config
	cp config.mk fizmo-glktermw/config.mk

fizmo-ncursesw-config:: test_config
	cp config.mk fizmo-ncursesw/config.mk

fizmo-console-config:: test_config
	cp config.mk fizmo-console/config.mk

build-dir::
	mkdir -p $(DEV_INSTALL_PATH)

