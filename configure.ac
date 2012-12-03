
# configure.ac
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


# The configuration process for "fizmo-dist" will install the fizmo-libraries
# not into the target directory, but into a subdirectory named "build" inside
# it's own source directory. This will make sure that only the files which
# are required to run fizmo are installed in the end.

# Since the configuration process must be completed before the build
# begins, some extra effort has to be taken. As submodules may require
# other fizmo-libraries to be build -- libcellif for example requires
# libfizmo -- it's not possible to use the whole subsystem's configuration,
# since libfizmo already have to be built so that the configuration can
# find it. Thus, the following rules apply:

# For every submodule, all non-fizmo-specific requirements are listed
# in the submodule's respective "config-libs.m4". As an example, libdrilbo
# may check for libfizmo" inside it's own configure.ac, the requirements
# for libjpg however go into "config-libs.m4".
# The fizmo-dist's "configure.ac" will then include the "config-libs.m4"
# of all submodules and provide the cflags and libs for the fizmo-related
# libs itself in the section "fizmo-internal libs".




# Definition for configuration options

AC_ARG_ENABLE([tracing],
 [AS_HELP_STRING([--enable-tracing],
         [enable tracelog for debugging])],
 [],
 [enable_tracing=no])

AC_ARG_ENABLE([glktermw],
 [AS_HELP_STRING([--enable-glktermw],
         [enable experimental glktermw])],
 [],
 [enable_glktermw=no])

#AC_ARG_ENABLE([fizmo-sdl],
# [AS_HELP_STRING([--enable-fizmo-sdl],
#         [enable experimental fizmo-sdl])],
# [],
# [enable_fizmo_sdl=no])


# Import submodule-specific options from their respective directories

m4_include(libsndifsdl/config-flags.m4)
m4_include(libdrilbo/config-flags.m4)
AS_IF([test "x$enable_glktermw" == "xyes"], [
  m4_include(libglkif/config-flags.m4)
])
#AS_IF([test "x$enable_fizmo_sdl" == "xyes"], [
#  m4_include(libpixelif/config-flags.m4)
#  m4_include(fizmo-sdl/config-flags.m4)
#])


AC_INIT([fizmo], [0.7.6])


# Check for external, non-fizno libs:

m4_include(libfizmo/config-libs.m4)
m4_include(libsndifsdl/config-libs.m4)
m4_include(libdrilbo/config-libs.m4)
m4_include(fizmo-ncursesw/config-libs.m4)
AS_IF([test "x$enable_glktermw" == "xyes"], [
  m4_include(libglkif/config-libs.m4)
  m4_include(fizmo-glktermw/config-libs.m4)
])
#AS_IF([test "x$enable_fizmo_sdl" == "xyes"], [
#  m4_include(libpixelif/config-libs.m4)
#  m4_include(fizmo-sdl/config-libs.m4)
#])

AC_CONFIG_AUX_DIR([.])
AM_INIT_AUTOMAKE([-Wall -Werror foreign])
AC_PROG_CC
AC_PROG_RANLIB
AM_PROG_AR


# Setup conditionals:
AM_CONDITIONAL([ENABLE_TRACING], [test "$enable_tracing" = "yes"])
m4_include(libfizmo/config-conds.m4)
m4_include(libcellif/config-conds.m4)
m4_include(libsndifsdl/config-conds.m4)
m4_include(libdrilbo/config-conds.m4)
m4_include(fizmo-ncursesw/config-conds.m4)
m4_include(fizmo-console/config-conds.m4)

# Setup flags for fizmo-internal libs. This will allow us to build the
# project after only one configuration iteration.
build_prefix=`pwd`/build
build_prefix_cflags=$build_prefix/include/fizmo
build_prefix_libs=$build_prefix/lib/fizmo
AC_SUBST([DEV_BUILD_PREFIX], $build_prefix)
libfizmo_CFLAGS="-I$build_prefix_cflags $xml2_CFLAGS $m_CFLAGS"
libfizmo_LIBS="-L$build_prefix_libs -lfizmo $xml2_LIBS $m_LIBS"
AC_SUBST([libfizmo_CFLAGS], $libfizmo_CFLAGS)
AC_SUBST([libfizmo_LIBS], $libfizmo_LIBS)
AC_SUBST([libcellif_CFLAGS], "-I$build_prefix_cflags")
AC_SUBST([libcellif_LIBS], "-L$build_prefix_libs -lcellif")
AC_SUBST([libsndifsdl_CFLAGS], "-I$build_prefix_cflags $sdl_CFLAGS $sndfile_CFLAGS")
AC_SUBST([libsndifsdl_LIBS], "-L$build_prefix_libs -lsndifsdl $sdl_LIBS $sndfile_LIBS")
AC_SUBST([libdrilbo_CFLAGS], "-I$build_prefix_cflags $x11_CFLAGS $jpeg_CFLAGS $libdrilbo_nonpkg_cflags $png_CFLAGS")
AC_SUBST([libdrilbo_LIBS], "-L$build_prefix_libs -ldrilbo -lpthread $x11_LIBS $jpeg_LIBS $libdrilbo_nonpkg_libs $png_LIBS")
AC_SUBST([LIBGLKIF_NONPKG_CFLAGS], "$libglkif_nonpkg_cflags")
AC_SUBST([LIBGLKIF_NONPKG_LIBS], "$libglkif_nonpkg_libs")
AC_SUBST([libglkif_CFLAGS], "-I$build_prefix_cflags $libglkif_nonpkg_cflags")
AC_SUBST([libglkif_LIBS], "-L$build_prefix_libs -lglkif $libglkif_nonpkg_libs")
#AC_SUBST([libpixelif_CFLAGS], "-I$build_prefix_cflags $libfizmo_CFLAGS $freetype2_CFLAGS")
#AC_SUBST([libpixelif_LIBS], "-L$build_prefix_libs -lpixelif $libfizmo_LIBS $freetype2_LIBS")

m4_include(fizmo-ncursesw/config-subst.m4)


# Define optional build and installation targets if required by the
# current flags

AS_IF([test "x$enable_glktermw" == "xyes"], [
  optional_fizmo_builds=fizmo-glktermw
  optional_fizmo_installs=install-fizmo-glktermw
])

#AS_IF([test "x$enable_fizmo_sdl" == "xyes"], [
#  optional_fizmo_builds="$optional_fizmo_builds fizmo-sdl"
#  optional_fizmo_installs="$optional_fizmo_installs install-fizmo-sdl"
#])

AC_SUBST([OPTIONAL_FIZMO_BUILDS], $optional_fizmo_builds)
AC_SUBST([OPTIONAL_FIZMO_INSTALLS], $optional_fizmo_installs)


# Create Makefiles

AC_CONFIG_FILES([Makefile
 libfizmo/Makefile libfizmo/src/tools/Makefile libfizmo/src/interpreter/Makefile
 libcellif/Makefile libcellif/src/cell_interface/Makefile
 libsndifsdl/Makefile libsndifsdl/src/sound_sdl/Makefile
 libdrilbo/Makefile libdrilbo/src/drilbo/Makefile
 fizmo-ncursesw/Makefile fizmo-ncursesw/src/fizmo-ncursesw/Makefile
 fizmo-console/Makefile fizmo-console/src/fizmo-console/Makefile ])

AS_IF([test "x$enable_glktermw" == "xyes"], [
  AC_CONFIG_FILES([libglkif/Makefile libglkif/src/glk_interface/Makefile
    fizmo-glktermw/Makefile fizmo-glktermw/src/fizmo-glktermw/Makefile ])
])

#AS_IF([test "x$enable_fizmo_sdl" == "xyes"], [
#  AC_CONFIG_FILES([libpixelif/Makefile libpixelif/src/pixel_interface/Makefile
#    fizmo-sdl/Makefile fizmo-sdl/src/fizmo-sdl/Makefile ])
#])

AC_OUTPUT

