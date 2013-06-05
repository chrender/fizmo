

**About fizmo**

fizmo represents a generic a Z-Machine interpreter — “fizmo interprets z-machine opcodes” — supporting all Z-Machine kinds except version 6, allowing you to run Infocom-made and most other Z-Machine based interactive fiction, also called text adventures. It also provides a generalized, plain-C interpreter library, as well as interfaces / implementations for various display and sound output methods, providing an interpreter-engine for you own project, even for closed-source implementations due to it's BSD-style license.

 - About Infocom and interactive fiction in general, see the
   [“New to IF”](http://www.ifarchive.org) section at the Interactive Fiction Archive.
 - To download Z-Machine games, see  [the IF-Archive's “Z-Code”](http://www.ifarchive.org/indexes/if-archiveXgamesXzcode.html) section.

---

**Frontends**

Currently three frontends are available:

 - _fizmo-ncursesw_  
    The default frontend uses ncurses “wide” variant for story output. [Ncurses](http://www.gnu.org/software/ncurses/) is commonly used for output on fixed-width text displays. The wide extensions will ensure correct unicode display.

 - _fizmo-console_  
   This frontend will simple read and write from the console / terminal. No fance functionality whatsoever, but may be useful for automization or voice output.
   
 - _fizmo-glktermw_  
   An example [GLK](http://en.wikipedia.org/wiki/Glk_(software)) frontend. Requires glktermw — notice the trailing “w” — which may be downloaded from the [“GLK-Implementations”](http://www.ifarchive.org/indexes/if-archiveXprogrammingXglkXimplementations.html) the the Interactive Fiction archive.

---

**Interfaces**

For developers, interfaces translate the Z-machine specific output — window management, output, scrolling and so on — into more display-specific commands, easing implementation considerably.

- _libcellif_  
  This interface will convert output into simple “goto-xy”- and “print”-commands, providing support for implementations on a fixed-width display. This interface is used by fizmo-ncursesw.
  
- _libglkif_  
 The GLK-interface translates Z-Machine output into GLK-specific instructions. This is used by Andrew Plotkin's [iOS-fizmo](https://github.com/erkyrath/iosfizmo/).

---

**Libraries**

 - _libfizmo_  
   This provides the interpreter core. It is a plain-C implementation which requires no external libraries (libxml2 is used by default, but in case babel support is not needed even libxml2 is not required).
   
 - _libdrilbo_  
   Provides support for jpeg, png and infocom's mg1 image reading as well as X11-based output.
   
 - _libsndifsdl_  
   Supplies a SDL-based sound interface.

---

**Installation**

 Please see `INSTALL.txt` on how to bulid the packages.

---

**Miscellaneous**

 Please send bug reports (or other requests) to [fizmo@spellbreaker.org](mailto:fizmo@spellbreaker.org).

 Fizmo was written by Christoph Ender in 2005 – 2013.

 _Please note:_  
 Currently fizmo is in beta status, meaning it might do unexpected things such as stop with an error message, crash or cleesh your machine into a frog. There is no warranty of any kind whatsoever and you're entirely on your own when running it.
