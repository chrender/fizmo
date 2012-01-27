
CC = gcc
AR = ar
override CFLAGS += -Wall -Wextra

# Since the "fizmo-all" metapackage will install all modules into a separate
# "build" directory -- in order not to install dev-files into the installation
# directory, but to keep the dev-files available for other modules which
# depend on these -- we need to tell pkg-config where to find these files.
PKG_CONFIG_PATH \
 := $(PKG_CONFIG_PATH):$(dir $(lastword $(MAKEFILE_LIST)))../build/lib/pkgconfig

prefix = /usr/local
bindir = $(prefix)/games
datarootdir = $(prefix)/share
mandir = $(datarootdir)/man
localedir = $(datarootdir)/fizmo/locales


# -----
# General settings:
ENABLE_OPTIMIZATION = 1
#ENABLE_TRACING = 1
#ENABLE_GDB_SYMBOLS = 1
# -----



# -----
# Settings for libfizmo:
LOCALE_SEARCH_PATH = $(localedir)
#ENABLE_STRICT_Z = 1
#THROW_SIGFAULT_ON_ERROR = 1
#DISABLE_BABEL = 1
#DISABLE_FILELIST = 1
#DISABLE_BLOCKBUFFER = 1
#DISABLE_COMMAND_HISTORY = 1
#DISABLE_OUTPUT_HISTORY = 1
#DISABLE_CONFIGFILES = 1
#DISABLE_PREFIX_COMMANDS = 1
#ENABLE_DEBUGGER = 1

# If libxml2 may be found using pkg-config -- may be tested by executing
# command "pkg-config --modversion libxml-2.0" -- fizmo will automatically
# find the required files using the following three lines:
LIBFIZMO_REQS = libxml-2.0
LIBXML2_PKG_CFLAGS = $(shell pkg-config --cflags libxml-2.0)
LIBXML2_PKG_LIBS = $(shell pkg-config --libs libxml-2.0)

# In case "pkg-config --modversion libxml-2.0" does not work, use the
# following two lines (and adapt locations if necessary):
LIBXML2_NONPKG_CFLAGS =
LIBXML2_NONPKG_LIBS =

# In case libxml2 is not available at all, uncomment "DISABLE_BABEL=1" above.
# -----


# -----
# Setting for sound-sdl:
ENABLE_AIFF_FOR_SOUND_SDL = 1

# If the "sdl" and "sndfile" packages may be found using the commands
#"pkg-config --modversion sdl" and "pkg-config --modversion sndfile", fizmo
# will automatically locate the required files using the following lines:
SOUNDSDL_PKG_REQS = sdl, sndfile
SOUNDSDL_PKG_CFLAGS = $(shell pkg-config --cflags sdl) \
                       $(shell pkg-config --cflags sndfile)
SOUNDSDL_PKG_LIBS = $(shell pkg-config --libs sdl) \
                       $(shell pkg-config --libs-sndfile)

# If either "sdl" or "sndfile" cannot be found using pkg-config, you have
# to provide the required flags in the following two lines:
SOUNDSDL_NONPKG_CFLAGS =
SOUNDSDL_PKG_LIBS =

# The "sound-sdl" modules always requires "sdl" to work. In case "sndfile"
# is not available, you can still compile it if ENABLE_AIFF_FOR_SOUND_SDL
# is disabled above.
# -----



# -----
# Settings for drilbo:
DRILBO_ENABLE_X11 = 1
DRILBO_ENABLE_JPG = 1
DRILBO_ENABLE_PNG = 1

# In case X11, libpng and/or libjpeg may be found using pkg-config,
# using the following lines will make fizmo locate the required files
# automatically:
DRILBO_PKG_REQS = x11, libpng #,libjpeg
DRILBO_PKG_X11_CFLAGS = $(shell pkg-config --cflags x11)
DRILBO_PKG_X11_LIBS = $(shell pkg-config --libs x11)
#DRILBO_PKG_LIBJPEG_CFLAGS = $(shell pkg-config --cflags libjpg)
#DRILBO_PKG_LIBJPEG_LIBS = $(shell pkg-config --libs libjpeg)
DRILBO_PKG_LIBPNG_CFLAGS = $(shell pkg-config --cflags libpng)
DRILBO_PKG_LIBPNG_LIBS = $(shell pkg-config --libs libpng)

# In case one or more packages are not localizable using pkg-config, you
# have to provide the required flags below:
DRILBO_NONPKG_X11_CFLAGS =
DRILBO_NONPKG_X11_LIBS =
DRILBO_NONPKG_LIBJPEG_CFLAGS = -I/usr/include
DRILBO_NONPKG_LIBJPEG_LIBS = -L/usr/lib -ljpeg
DRILBO_NONPKG_LIBPNG_CFLAGS =
DRILBO_NONPKG_LIBPNG_LIBS =
# -----



# -----
# Settings for ncursesw -- required by fizmo-ncursesw and fizmo-glktermw:
# If pkg-config provides information how to find the ncursesw files, you
# can use the following two lines to make fizmo automatically find the
# required information:
#NCURSESW_PKG_CFLAGS = $(shell pkg-config --cflags ncursesw)
#NCURSESW_PKG_LIBS = $(shell pkg-config --libs ncursesw)

# In case pkg-config has no information about ncursesw, you have to provide
# the required flags below:
NCURSESW_NONPKG_CFLAGS = -I/usr/include/ncursesw
NCURSESW_NONPKG_LIBS = -L/usr/lib -lncursesw
# -----



# -----
# Settings for fizmo-ncursesw (also requires ncursesw, above):
ENABLE_X11_IMAGES = 1
SOUND_INTERFACE_CONFIGNAME = SOUNDSDL
SOUND_INTERFACE_STRUCT_NAME = sound_interface_sdl
SOUND_INTERFACE_INCLUDE_FILE = sound_sdl/sound_sdl.h
SOUND_INTERFACE_NAME = libsndifsdl
# -----



# -----
# Settings for libglkif:
LIBGLK_NONPKG_CFLAGS = -I$(HOME)/opt/glktermw
LIBGLK_NONPKG_LIBS = -L$(HOME)/opt/glktermw
# -----



# -----
# Settings for fizmo-glkterm (also requires ncursesw, above):
LIBGLKTERMW_NONPKG_CFLAGS = -I$(HOME)/opt/glktermw
LIBGLKTERMW_NONPKG_LIBS = -L$(HOME)/opt/glktermw
# -----



# -----
# Settings for fizmo-console
ENABLE_READCHAR_VIA_TERMIOS = 1
# -----

