


 ABOUT THE FIZMO INTERPRETER

 Fizmo is a Z-Machine interpreter ("Fizmo Interprets Z-Machine Opcodes") which
 allows you to run Infocom- and most other Z-Machine based games, except
 version 6, on POSIX-like systems.

 It provides four frontends:
  - fizmo-sdl: A SDL-based interface for GUIs or framebuffer devices.
  - fizmo-ncursesw: A ncursesw-based unicode-capable text interface.
  - fizmo-glktermw: A GLK-capable interface, using glktermw for output.
  - fizmo-console: A "dumb" console interface.
 
 This distribution contains the following packages:
  - libfizmo, providing the interpreter core.
  - libcellif, providing a translation for Z-Machine output into simple
    goto-xy and print-commands for fixed-width screens.
  - libsndifsdl, supplying a SDL-based sound interface.
  - libdrilbo, providing support for jpeg, png and infocom's mg1 image
    reading as well as X11-based output.
  - libglkif, which provides basic GLK bindings.
  - libpixelif, translating the entire Z-Machine output into draw-RGB-pixel
    instructions.
  - fizmo-ncursesw, a screen interface uses ncurses for display.
  - fizmo-console, a barebone screen interface.
  - fizmo-glktermw, an example GLK implmentation.
  - fizmo-sdl, the SDL- and freetype-based interface.

 Please see QUICKSTART.txt or INSTALL.txt on how to bulid the packages.

 About Infocom and interactive fiction in general, see the "New to IF" section
 at http://www.ifarchive.org.

 To download Z-Machine games, see
 http://www.ifarchive.org/indexes/if-archiveXgamesXzcode.html

 Please send bug reports (or other requests) to fizmo@spellbreaker.org.

 Fizmo was written by Christoph Ender in 2005-2013.

 Please note:
 Currently fizmo is in beta status, meaning it might do unexpected things
 such as stop with an error message, crash or cleesh your machine into a
 frog. There is no warranty of any kind whatsoever and you're entirely on
 your own when running it.

