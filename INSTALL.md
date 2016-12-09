

**Installation Instructions**  





The following minimum components need to be installed to build fizmo:

 - A C compiler like gcc or clang
 - make
 - automake
 - autoconf
 - pkg-config



To build all of the frontends, you will need the following in addition to the components listed abobe:     

 - libxml2
 - ncursesw5
 - sdl2
 - libsndfile1
 - X11
 - libjpeg
 - libpng
 - freetype2



If you are on Debian or any derivate like Ubuntu you can execute the following commands to install all of the required components:

 - `apt-get install gcc make pkg-config autoconf automake`
 - `apt-get install libxml2-dev libncursesw5-dev libsdl2-dev`
 - `apt-get install libsndfile1-dev libjpeg-dev libpng-dev libfreetype6-dev`



In case you're on Mac OS X, you can use homebrew to install the build requirements:

 - `brew install sdl2 freetype pkg-config`
 - `brew install libjpeg autoconf libsndfile automake`



The source code in the master fizmo “master” branch on github does not contain the `configure` script. If you want to install from github instead from a downloaded fizmo-\*.tar.gz you can either run the `autoreconf -fi` command to create the missing files, or clone the “upstream” branch which contains the release-relevant files.

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
In case SDL2 is not available, you can still build fizmo using this option. However, there will be no sound or SDL frontend available.

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

