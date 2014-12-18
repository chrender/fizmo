
# configure.ac
#
# This file is part of fizmo.
#
# Copyright (c) 2009-2014 Christoph Ender.
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




# -- README

# Configuration is a little bit more complex since every submodule is
# supposed to be buildable standalone. That means that this distribution
# wrapper includes definitions about configuration flags, conditions,
# substitutions and libraries directly from the submodule directories
# and directly creates all the Makefiles so allthough there are many
# submodules we only need a single configure and make run.

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

# I haven't found a way to make "m4_include" -- or any other type of
# include mechanism -- work with variables, so it's not possible to specify
# the sound interface to build in a single variable and have the build
# process behave accordingly, so any changes will require manual intervention.
# If you can find a better way, I'd be delighted to hear about it.



m4_define([FIZMO_DIST_VERSION_NUMBER], [0.7.10])

AC_INIT(
 [fizmo],
 FIZMO_DIST_VERSION_NUMBER,
 fizmo@spellbreaker.org,
 fizmo)

AC_CONFIG_AUX_DIR([.])
fizmo_dist_version=FIZMO_DIST_VERSION_NUMBER


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

AC_ARG_ENABLE([sdl],
 [AS_HELP_STRING([--disable-sdl],
         [SDL will not be required for building, this will however disable
          sound support])],
 [],
 [enable_sdl=yes])


# Import submodule-specific options from their respective directories

m4_include(libfizmo/config-flags.m4)
m4_include(libcellif/config-flags.m4)
m4_include(libdrilbo/config-flags.m4)
m4_include(fizmo-console/config-flags.m4)
m4_include(fizmo-ncursesw/config-flags.m4)
AS_IF([test "x$enable_glktermw" == "xyes"], [
  m4_include(libglkif/config-flags.m4)
  m4_include(fizmo-glktermw/config-flags.m4)
])
AS_IF([test "x$enable_sdl" == "xyes"], [
  m4_include(libsndifsdl2/config-flags.m4)
])


# Check for external, non-fizmo libs:

m4_include(libfizmo/config-libs.m4)
m4_include(libcellif/config-libs.m4)
m4_include(libdrilbo/config-libs.m4)
m4_include(fizmo-console/config-libs.m4)
m4_include(fizmo-ncursesw/config-libs.m4)
AS_IF([test "x$enable_glktermw" == "xyes"], [
  m4_include(libglkif/config-libs.m4)
  m4_include(fizmo-glktermw/config-libs.m4)
])
AS_IF([test "$enable_sdl" != "no"], [
  m4_include(libsndifsdl2/config-libs.m4)
])

AM_INIT_AUTOMAKE([-Wall -Werror foreign])
AC_PROG_CC
AC_PROG_RANLIB
AM_PROG_AR


# Setup conditionals:
# It appears that conditionals must always be defined, even if they are
# never used. If not, it will result in a "configure: error: conditional
# (name-of-conditional) was never defined".
AM_CONDITIONAL([ENABLE_TRACING], [test "$enable_tracing" = "yes"])
AM_CONDITIONAL([ENABLE_SDL], [test "$enable_sdl" != "no"])
m4_include(libfizmo/config-conds.m4)
m4_include(libcellif/config-conds.m4)
m4_include(libdrilbo/config-conds.m4)
m4_include(fizmo-ncursesw/config-conds.m4)
m4_include(fizmo-console/config-conds.m4)
m4_include(libglkif/config-conds.m4)
m4_include(fizmo-glktermw/config-conds.m4)
m4_include(libsndifsdl2/config-conds.m4)


# Setup flags for fizmo-internal libs. This will allow us to build the
# project after only one configuration iteration.
build_prefix=`pwd`/build
build_prefix_cflags=$build_prefix/include/fizmo
build_prefix_libs=$build_prefix/lib/fizmo

AC_SUBST([DEV_BUILD_PREFIX], $build_prefix)
AC_SUBST([FIZMO_DIST_VERSION], FIZMO_DIST_VERSION_NUMBER)
m4_include(libfizmo/config-subst.m4)
m4_include(libcellif/config-subst.m4)
m4_include(libdrilbo/config-subst.m4)
m4_include(fizmo-console/config-subst.m4)
m4_include(fizmo-ncursesw/config-subst.m4)
AS_IF([test "x$enable_glktermw" == "xyes"], [
  m4_include(libglkif/config-subst.m4)
  m4_include(fizmo-glktermw/config-subst.m4)
])
AS_IF([test "$enable_sdl" != "no"], [
  m4_include(libsndifsdl2/config-subst.m4)
])


# Define optional build and installation targets if required by the
# current flags

AS_IF([test "x$enable_glktermw" == "xyes"], [
  optional_fizmo_builds=fizmo-glktermw
  optional_fizmo_installs=install-fizmo-glktermw
  optional_fizmo_cleans=clean-fizmo-glktermw
  optional_fizmo_dstcleans=distclean-fizmo-glktermw
])

AS_IF([test "$enable_sdl" != "no"], [
  optional_sound_build=libsndifsdl2
  optional_sound_install=install-libsndifsdl2
  optional_sound_install_data_local=install-data-local-libsndifsdl2
  optional_fizmo_cleans="$optional_fizmo_cleans clean-libsndifsdl2"
  optional_fizmo_distcleans="$optional_fizmo_distcleans distclean-libsndifsdl2"
])

# Explicitely set cflags and libs for libsndifsdl2 for use by frontends since
# we cannot use pkg-config for this.
AC_SUBST([libsndifsdl2_CFLAGS], "-I$build_prefix_cflags $sdl2_CFLAGS $sndfile_CFLAGS")
AC_SUBST([libsndifsdl2_LIBS], "-L$build_prefix_libs -lsndifsdl2 $sdl2_LIBS $sndfile_LIBS")

AC_SUBST([OPTIONAL_SOUND_BUILD], $optional_sound_build)
AC_SUBST([OPTIONAL_SOUND_INSTALL], $optional_sound_install)
AC_SUBST([OPTIONAL_SOUND_INSTALL_DATA_LOCAL],$optional_sound_install_data_local)

AC_SUBST([OPTIONAL_FIZMO_BUILDS], $optional_fizmo_builds)
AC_SUBST([OPTIONAL_FIZMO_INSTALLS], $optional_fizmo_installs)
AC_SUBST([OPTIONAL_FIZMO_CLEANS], $optional_fizmo_cleans)
AC_SUBST([OPTIONAL_FIZMO_DISTCLEANS], $optional_fizmo_distcleans)


# Create Makefiles

AC_CONFIG_FILES([
 Makefile
 libfizmo/Makefile
 libfizmo/src/tools/Makefile
 libfizmo/src/interpreter/Makefile
 libcellif/Makefile
 libcellif/src/cell_interface/Makefile
 libdrilbo/Makefile
 libdrilbo/src/drilbo/Makefile
 fizmo-console/Makefile
 fizmo-console/src/fizmo-console/Makefile
 fizmo-ncursesw/Makefile
 fizmo-ncursesw/src/fizmo-ncursesw/Makefile
])

AS_IF([test "x$enable_glktermw" == "xyes"], [
  AC_CONFIG_FILES([
   libglkif/Makefile
   libglkif/src/glk_interface/Makefile
   fizmo-glktermw/Makefile
   fizmo-glktermw/src/fizmo-glktermw/Makefile
  ])
])

AS_IF([test "$enable_sdl" != "no"], [
  AC_CONFIG_FILES([
   libsndifsdl2/Makefile
   libsndifsdl2/src/sound_sdl2/Makefile
  ])
])

AC_OUTPUT

