

**Installation Instructions**  





The following minimum components need to be installed to build fizmo:

 - A C compiler like gcc or clang
 - make
 - pkg-config



Installing should be as simple as running the following commands:

./configure  
make  
make install

The “configure” script tries to guess the correct values for all the system settings and locations of all include files and libraries. If some files cannot be found, the script will ask for the required values.

In addition to the standard parameters, “configure” provides the following options:

`--`enable-tracing  
For debugging purposes, fizmo can write very extensive logging information into a file named “tracelog.txt”. The logging can be enabled using this option. See also the “`--`with-glktermw-includedir” and “`--`with-glktermw-libdir” parameters below.

`--`enable-glktermw  
Fizmo provides experimental GLK support, which can be activated using this option.

`--`disable-x11  
This option will disable X11 image display in fizmo-ncursesw.

`--`disable-jpeg  
In case JPEG support is not available or not desired, this option will disable libdrilbo's JPEG capabilities.

`--`disable-png  
In case PNG support is not available or not desired, this option will disable libdrilbo's PNG capabilities.

`--`disable-sdl  
In case SDL is not available, you can still build fizmo using this option. However, there will be no sound or SDL frontend available.

`--`disable-aiff  
In case libsndfile1 is is not available or no AIFF support is required, this option will disable AIFF support.

`--`with-jpeg-includedir  
If pkg-config cannot provide information about libjpeg, the location of the jpeglib.h can be given using this parameter.

`--`with-jpeg-libdir  
If pkg-config cannot provide information about libjpeg, the location of the libjpeg can be given using this parameter.

`--`with-glktermw-includedir  
In case glktermw should be build, the location of the include files must be given using this parameter.

`--`with-glktermw-libdir  
In case glktermw should be build, the location of the library file must be given using this parameter.

Strictly speaking it would be possible build fizmo without pkg-config by compiling all the necessary modules yourself instead of letting the distribution package do this for you. Since pkg-config should however be universally available, there shouldn't be any need to do this.

Debian and derivates:  
`apt-get install gcc make pkg-config`

The following components are required to build the ncursesw-frontend:

 - libxml2
 - ncursesw5



If possible, the following optional components should also be installed:

 - sdl-audio
 - libsndfile1
 - libjpeg
 - libpng
 - X11



Debian and derivates:  
`apt-get install libxml2-dev libncursesw5-dev libsdl-sound1.2-dev`  
`apt-get install libsndfile1-dev libjpeg-dev libpng-dev`

If you want to build the SDL-based fizmo frontend, you'll need:

 - The freetype2 libraries
 - SDL version 1.2



Debian and derivates:  
`apt-get install libfreetype6-dev libsdl1.2-dev`

