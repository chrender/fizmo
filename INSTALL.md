

Installing should be as simple as running the following commands:

./configure  
make  
make install

The “configure” script tries to guess the correct values for all the system settings and locations of all include files and libraries. If some files cannot be found, the script will ask for the required values.

In addition to the standard parameters, “configure” provides the following options:

--enable-tracing  
For debugging purposes, fizmo can write very extensive logging information into a file named “tracelog.txt”. The logging can be enabled using this option. See also the “--with-glktermw-includedir” and “--with-glktermw-libdir” parameters below.

--enable-glktermw  
Fizmo provides experimental GLK support, which can be activated using this option.

--disable-x11  
This option will disable X11 image display in fizmo-ncursesw.

--disable-jpeg  
In case JPEG support is not available or not desired, this option will disable libdrilbo's JPEG capabilities.

--disable-png  
In case PNG support is not available or not desired, this option will disable libdrilbo's PNG capabilities.

--disable-sound  
In case SDL is not available or sound support is not desired, sound can be disabled using this option.

--disable-aiff  
In case libsndfile1 is is not available or no AIFF support is required, this option will disable AIFF support.

--with-jpeg-includedir  
If pkg-config cannot provide information about libjpeg, the location of the jpeglib.h can be given using this parameter.

--with-jpeg-libdir  
If pkg-config cannot provide information about libjpeg, the location of the libjpeg can be given using this parameter.

--with-glktermw-includedir  
In case glktermw should be build, the location of the include files must be given using this parameter.

--with-glktermw-libdir  
In case glktermw should be build, the location of the library file must be given using this parameter.
