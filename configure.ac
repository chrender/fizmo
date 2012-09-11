
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

m4_include(libsndifsdl/config-flags.m4)
m4_include(libdrilbo/config-flags.m4)
AS_IF([test "x$enable_glktermw" == "xyes"], [
  m4_include(libglkif/config-flags.m4)
])

AC_INIT([fizmo], [0.7.4])

m4_include(libfizmo/config-libs.m4)
m4_include(libsndifsdl/config-libs.m4)
m4_include(libdrilbo/config-libs.m4)
m4_include(fizmo-ncursesw/config-libs.m4)
AS_IF([test "x$enable_glktermw" == "xyes"], [
  m4_include(libglkif/config-libs.m4)
  m4_include(fizmo-glktermw/config-libs.m4)
])

AC_CONFIG_AUX_DIR([.])
AM_INIT_AUTOMAKE([-Wall -Werror foreign])
AC_PROG_CC
AC_PROG_RANLIB
AM_PROG_AR

#ac_configure_args="$ac_configure_args --with-dev-build-prefix=`pwd`/build"
#AC_SUBST([AC_CONFIGURE_ARGS], $ac_configure_args)
#AC_SUBST([DEV_BUILD_PREFIX], `pwd`/build)

AM_CONDITIONAL([ENABLE_TRACING],
                [test "$enable_tracing" = "yes"])

m4_include(libfizmo/config-conds.m4)
m4_include(libcellif/config-conds.m4)
m4_include(libsndifsdl/config-conds.m4)
m4_include(libdrilbo/config-conds.m4)
m4_include(fizmo-ncursesw/config-conds.m4)
m4_include(fizmo-console/config-conds.m4)

build_prefix=`pwd`/build
build_prefix_cflags=$build_prefix/include/fizmo
build_prefix_libs=$build_prefix/lib/fizmo
AC_SUBST([DEV_BUILD_PREFIX], $build_prefix)
AC_SUBST([libfizmo_CFLAGS], "-I$build_prefix_cflags $xml2_CFLAGS $m_CFLAGS")
AC_SUBST([libfizmo_LIBS], "-L$build_prefix_libs -lfizmo $xml2_LIBS $m_LIBS")
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

m4_include(fizmo-ncursesw/config-subst.m4)

AS_IF([test "x$enable_glktermw" == "xyes"], [
  AC_SUBST([OPTIONAL_FIZMO_BUILDS], "fizmo-glktermw")
  AC_SUBST([OPTIONAL_FIZMO_INSTALLS], "install-fizmo-glktermw")
])

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

AC_OUTPUT

