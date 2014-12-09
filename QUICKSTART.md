

**Quickstart**  





To install all of the frontends, you will need the following:   A C compiler like gcc or clang
   make
   pkg-config
   libxml2
   ncursesw5
   sdl
   libsndfile1
   X11
   libjpeg
   libpng
   freetype2


If you are on Debian or any derivate like Ubuntu you can execute the following commands to install all of the required components:

 - `apt-get install gcc make pkg-config`
 - `apt-get install libxml2-dev libncursesw5-dev libsdl1.2-dev`
 - `apt-get install libsndfile1-dev libjpeg-dev libpng-dev libfreetype6-dev`



After that, execute the following commands to compile and install all available frontends – fizmo-console, fizmo-ncursesw and fizmo-sdl:  
`./configure `--`enable-fizmo-sdl ; make install`

