
CC = gcc
AR = ar
CFLAGS = -Wall -Wextra

ifneq ($(DESTDIR),)
INSTALL_PREFIX = $(DESTDIR)
else
#INSTALL_PREFIX = /usr/local
INSTALL_PREFIX = $(HOME)/opt/fizmo
endif

# Uncomment to install binaries to $(INSTALL_PREFIX)/$(FIZMO_BIN_DIR).
#FIZMO_BIN_DIR = bin


# General:
ENABLE_OPTIMIZATION = 1
#ENABLE_TRACING = 1
#ENABLE_GDB_SYMBOLS = 1


# libfizmo:
LOCALE_SEARCH_PATH = $(INSTALL_PREFIX)/share/fizmo/locales
#ENABLE_STRICT_Z = 1
#THROW_SIGFAULT_ON_ERROR = 1
#DISABLE_LIBXML2 = 1
# Use apple's libxml2 for simplicity
#LIBFIZMO_REQS = libxml-2.0
#LIBXML2_PKG_CFLAGS = $(shell pkg-config --cflags libxml-2.0)
#LIBXML2_PKG_LIBS = $(shell pkg-config --libs libxml-2.0)
LIBFIZMO_REQS =
LIBXML2_PKG_CFLAGS =
LIBXML2_PKG_LIBS =
LIBXML2_NONPKG_CFLAGS = -I/usr/include/libxml2
LIBXML2_NONPKG_LIBS = -L/usr/lib -lxml2
#DISABLE_BLOCKBUFFER = 1
#DISABLE_COMMAND_HISTORY = 1
#DISABLE_OUTPUT_HISTORY = 1


# sound-sdl:
ENABLE_AIFF_FOR_SOUND_SDL = 1
SOUNDSDL_PKG_REQS = sdl, sndfile
SOUNDSDL_PKG_CFLAGS = $(shell pkg-config --cflags sdl) $(shell pkg-config --cflags sndfile)
SOUNDSDL_PKG_LIBS = $(shell pkg-config --libs sdl) $(shell pkg-config --libs-sndfile)
SOUNDSDL_NONPKG_CFLAGS =
SOUNDSDL_PKG_LIBS =


# drilbo:
DRILBO_PKG_REQS = x11, xext, libpng

DRILBO_ENABLE_X11 = 1
DRILBO_PKG_X11_CFLAGS = $(shell pkg-config --cflags x11) $(shell pkg-config --cflags xext)
DRILBO_PKG_X11_LIBS = $(shell pkg-config --libs x11) $(shell pkg-config --libs xext)
DRILBO_NONPKG_X11_CFLAGS =
DRILBO_NONPKG_X11_LIBS =

DRILBO_ENABLE_JPG = 1
DRILBO_PKG_LIBJPEG_CFLAGS =
DRILBO_PKG_LIBJPEG_LIBS =
DRILBO_NONPKG_LIBJPEG_CFLAGS = -I/opt/local/include
DRILBO_NONPKG_LIBJPEG_LIBS = -L/opt/local/lib -ljpeg

DRILBO_ENABLE_PNG = 1
DRILBO_PKG_LIBPNG_CFLAGS = $(shell pkg-config --cflags libpng)
DRILBO_PKG_LIBPNG_LIBS = $(shell pkg-config --libs libpng)
DRILBO_NONPKG_LIBPNG_CFLAGS =
DRILBO_NONPKG_LIBPNG_LIBS =


# fizmo-ncursesw:
#NCURSESW_PKG_CFLAGS = $(shell pkg-config --cflags ncursesw)
#NCURSESW_PKG_LIBS = $(shell pkg-config --libs ncursesw)
# the macports and self-compiled ncurses won't work 100%, use apple's version
NCURSESW_PKG_CFLAGS =
NCURSESW_PKG_LIBS =
NCURSESW_NONPKG_CFLAGS = -I/usr/include
NCURSESW_NONPKG_LIBS = -L/usr/lib -lncurses
SOUND_INTERFACE_NAME = libsndifsdl
SOUND_INTERFACE_CONFIGNAME = SOUNDSDL
SOUND_INTERFACE_STRUCT_NAME = sound_interface_sdl
SOUND_INTERFACE_INCLUDE_FILE = sound_sdl/sound_sdl.h
ENABLE_X11_IMAGES = 1

