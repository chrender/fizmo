


   **Version 0.8.5**

 - Fix superfluous libraries and includes during install when using $DESTDIR, addressing github issue #21.
 - Made screen size functions use 16-bit instead of 8-bit values, allowing version 5+ games to work with screen dimensions > 255.
 - In case of screen dimensions > 255, write 255 into the byte-sized header entries $20 and $21.
 - Fixes for wrong submodule version numbers.

---


   **Version 0.8.4 — April 9, 2017**

 - Fixed missing display of upper screen output on game start, like, for example, the title display of “Alpha“ or “Anchorhead”.
 - Fixed missing evaluation of events on start-up. This fixes a bug that made the interpreter crash when your initial screen size was less than the default size. This fix does now also allow resizing the window during frontispiece display.
 - Fix for crashes on startup when loading hyphenation patterns und localiazation data for machines which have chars as unsigned types. Thanks to Lewis Gentry for the patch.
 - Fixed a crash which occurred after entering an invalid filename for the /fileinput command and then re-invoking the same command. Thanks to Michael Baltes for reporting the problem.
 - Fixed possible crash when invoking read_char with a non-zero verification routine address. Thanks to Stephen Gutknecht for reporting the problem.
 - Fixed missing opening screen and disappearing prompt during timed input in “eliza.z5”. Thanks to Stephen Gutknecht for reporting the problem.
 - Fixed build error which occured when "--disable-x11" was set for drilbo.
 - Fixed missing repeat-paragraph-output in case buffer back was encountered in output history. This fixes the initial missing line of text in “eliza.z5”.
 - Fixed overlong reverse chars. This corrects several ASCII art problems as in Photopia, Nameless and ZChess, as well as in several opening screens. Thanks to Stephen Gutknecht.
 - Replaced en_US locale with en_GB due to license issues with the US hyphenation patterns from the “hyph-utf8” package for the time being. Adapted localization aliases so any current configuration should be still working without problems.
 - User input for read_char is now supported in stream 4. Thanks to Michael Baltes for the initial implementation.
 - Improved build system for separate library and interface builds.
 - Fixed an issue libpixelif's truetype-wordwrapper. This corrects the incorrect display of the startup-screens in “AtWork.z5” and “Photopia”. Thanks to Stephen Gutknecht for reporting the problem.
 - Added “-fPIC” flag to compilation of static stand-alone libraries. This will allow them to get later linked to binaries with shared libraries.
 - Added detection whether supplied story file for the interpreter is a valid Z-Machine file or a blorb file containing a "ZCOD" chunk and show error message if it's not the case.
 - Fix startup error messages and missing output of fatal interpreter messages in fizmo-sdl2, this also fixes silent exists in case the story file could not be found.

---


   **Version 0.8.3 — September 9, 2016**

 - Fixed missing documentation and other files from distribution version 0.8.2. No changes to the source code.

---


   **Version 0.8.2 — August 31, 2016**

 - In the context of the Debian Reproducible Builds, building libfizmo is now reproducible, see https://wiki.debian.org/ReproducibleBuilds. Thanks to Sascha Steinbiss for the patch.
 - Renamed “libcellif” to “libmonospaceif”.
 - Fixed several build files and pkg-configurations for stand-alone module builds.
 - Use tiny-xml-doc-tools for documentation.

---


   **Version 0.8.1 — August 22, 2016**

 - Fixed build error for parallel make, github issue #2.

---


   **Version 0.8.0 — July 28, 2016**

 - Addition of SDL2-frontend and libpixelif screen-interface. These allow for pixel-based output instead of monospaced text-only output as before. As a result, the frontend provides proportional font display using the freetype2 library, on a wide range of systems since SDL2 is implemented in a cross-platform manner.
 - The SDL2-frontend uses the “Fira Sans” and “Fira Mono” typefaces designed by Erik Spiekermann, Ralph du Carrois, Anja Meiners and Botio Nikoltchev.
 - When enabled in the freetype library, text is displayed using subpixel rendering. There is also support for hi-dpi displays.
 - Added “fizmo-remglk” frontend.
 - Added write/read of last paragraph_attribute in libfizmo, along with a fix for segfaults which could occur in case metadata is written to output history when screen interface was not open.
 - Added missing config options to output of fizmo-ncursesw.
 - Adaptations for libglkif: Separate glk and glktermw from each other for better integration with remglk.
 - Minor improvements for building libglkif with ncurses(w).

---


   **Version 0.7.10 — October 9, 2015**

 - Adaptations for print_table opcode, which fixes output in “Sherlock”.
 - Fix for Debian bug #795800: When the ncurses screen is resized when Inform's menu library displays hints or instructions fizmo will no longer exit and complain about an error in the “output_rewind_paragraph” function. Thanks to Lewis Gentry for reporting this problem.
 - Fixed score/turns position in statusline for v≤3 games.
 - Adapted sound interface to SDL2.
 - Fixed possible garbled upper window after erase_window(-1) invocation.
 - Minor fixes for lib detection, will remove some warnings and possible some build issues on linux.
 - No more strict dependency on libncursesw since libncurses works equally well.
 - Added forgotten configuration options “with-ncurses-includedir”, “with-ncursesw-libdir” and “with-ncurses-libdir”.
 - Fix in history/remove_chars_from_history.
 - Fix for missing prompt after interpreter commands.
 - Many minor fixes to history, autoconf and lib detection.

---


   **Version 0.7.9 — May 25, 2014**

 - Fixed conflicting array sizes in libfizmo which could result in compile-time errors or invalid memory assumptions by the compiler. Thanks to Michael Tautschnig.

---


   **Version 0.7.8 — March 19, 2014**

 - Entire re-implementation of screen refresh and scrolling ncursesw/libcellif interface. Many thanks to Lewis gentry for bug-reporting and extensive beta-testing.
 - Fixed missing lowering of input case for versions ≥ 5, thanks to irb.
 - Fixed “encode_text” and tokenizing for cases in which the “unrecognized”-flag is set. This fixes a bug with the “name” spell in Beyond Zork, thanks to irb.
 - Fixed wrapping of long lines without spaces as in ASCII art. Thanks to David Batchelder for pointing out the problem.
 - Adapted to automake v1.14 and fixed compiler warning.
 - Relocated “AC_CONFIG_AUX_DIR” invocation, fixing the missing-file warning during configure.
 - Fixed incorrect backspace or delete behaviour which could cause in crash in case of small screen sizes combined with the use of preloaded input.
 - Several small fixes for ncursesw input.
 - Fixed wrong status line display style after restore in version ≤ 3 games.
 - When breaking long lines, multiple spaces are now skipped at the linebreak point to avoid superfluous spaces at the start of the next line. Thanks to Lewis Gentry.
 - Fixed UTF-8 for input from file. Thanks to Mikko Torvinen for reporting the bug.
 - After a restore, the current screensize is now written into the header. This should correct upper windows display problems after loading of savegames.

---


   **Version 0.7.7 — June 5, 2013**

 - Fixed wordwrapper for cases in which text was written on the same line as read_char was invoked. This makes output of multiline-hints in PRIZM's Invisiclues work. Thanks to David Batchelder.
 - Renamed getchar, getchars and ungetchars from the file system interface to readchar, readchars and unreadchars. This makes fizmo compile on systems where getchar() is implemented as a macro.
 - Added missing evalation of fixed-pitch font flag in the flags2 header.
 - Fix build error for some systems due to missing wchar.h include – thanks to Nikos Chantziaras.
 - Altered close_interface function to allow z_mem access during shutdown.
 - Fixed several compiler warnings.
 - Invoking “/config” without setting color defaults will no longer crash the interpreter.
 - Implemented terminal default color detetction for fizmo-ncursesw.
 - Added z_rgb_colour datatype.
 - Renamed “install-locales” into “install-data-local” build target.
 - Fixed verification of libglktermw location for GLK-interface.
 - Removed non-POSIX-flag from tcsetattr call in fizmo-console.
 - Minor bugfixes.

---


   **Version 0.7.6 — December 27, 2012**

 - Reparied “math.h” name collision, fixing missing “rint” function declaration.
 - Fixed universal builds on Mac OS X.
 - Fixed warning in “cmd_hst” compilation.
 - Searching for z-code files will now automatically create ~/.config/fizmo so that search results are no longer lost, thanks to B. Watson.
 - Added “--disable-sound” configure option, fixed “--disable-x11” option.
 - Improved configure-detection for libncursesw for systems without pkg-config's “ncursesw.pc”.
 - Minor fixes for “clean” and “distclean” build targets and library build targets.

---


   **Version 0.7.5 — November 30, 2012**

 - Preloaded input will no longer apperar in transscripts. Thanks to Lewis Gentry.
 - Fixed missing characters in transcripts.
 - Implemented missing delete in read_line and read_char, corrected backspace key behaviour on read_char.
 - Fixed typos in manpages, thanks to Johan Ljunglid.
 - Fixed swallowing of dots, commas and quotation marks at line starts in case hyphenation is disabled – thanks to Lewis Gentry.
 - Fixed crash which occurred when invoking fizmo-ncursesw with the “-fi” flag, also thanks to Lewis Gentry.
 - Colors are now correctly set for all windows on screen in case no window is specified for @set_colour.
 - CTRL-R will now redraw the screen. Contrary to CTRL-L, which refreshes the screen based on the current layout, CTRL-R will reconstruct the latest output based on the output history. This will help to display output which is hidden in case a game clears the screen, writes some text into the top line and then turns on the score line which then overlays the topmost line.
 - Re-implemented line-wrapper, fixing several issues.
 - Fix for memory corruption in command-history, thanks to Lewis Gentry.

---


   **Version 0.7.4 — September 17, 2012**

 - Adapted to new autoconf/automake build process.

---


   **Version 0.7.3 — August 1, 2012**

 - Merged Andrew Plotkin's iOS-fizmo changes: No more raw exit() calls, added screeninterface-specific filename prompt, new screeninterface-specific filename prompt replaces fizmo_register_ask_user_for_file_function, fixed autosave-functionality, added quote boxes for libglkif, added configuration option “disable-stream-2-wrap” and “max-undo-steps” config option and fix for an overlong property issue that made “Heist” crash.
 - Implemented memory-cleanup and fixed variable states after story end to  allow fizmo_start() to be called repeatedly.
 - Fixed some minor memory leaks.
 - Fixed segfault which would occur after storing 10240 undo steps.
 - Added new option to set number of maximum stored undo steps.
 - Changed blockbuffer initialization to allow for output at any time, made fizmo_new_screen_size adapt blockbuffer size correctly.
 - Fixed a buffer overflow during tokenization, thanks for Andrew Plotkin.
 - Implemented binary chop dictionary search.
 - Fixed screen interface invocation in libcellif to not require timeouts from screen interface if not actually required by the game, saving a bit of CPU time.

---


   **Version 0.7.2 — March 9, 2012**

 - Made fizmo comply to “praxix.z5” test, merged zarf's DISABLE_PREFIX_COMMANDS functionality.
 - Merged zarf's GLK changes into “glk_screen_if.c”. The new version 0.1.2 fixes screen size detection, timed input and adds lowering of the input line.
 - Fixed missing $(DESTDIR) variable – should already have been present since version 0.7.1.
 - Fixed an error which would occur for empty pathnames when starting up a game on 32-bit platforms, thanks to Samuel Verschelde.
 - The transcription and fixed font bits will now correctly survive a restore, as defined in the Z-Maschine standard.

---


   **Version 0.7.1 — November 6, 2011**

 - Fixed missing “override” statments for CFLAGS in Makefiles.
 - Fixed $(DESTDIR) evaluation in config.[default|macports].mk.
 - Adapted Makefiles and configuration to use standard GNU Makefile variables instead of INSTALL_PATH and FIZMO_BIN_DIR.
 - Fixed an error in the stack restoration in “opcode_restore_undo”. Thanks to Lewis Gentry for reporting this bug.
 - Implemented first debugger stubs. The debugger is available via network socket and will currently only dump PC, locals and stack contents.
 - Removed “drilbo-x11.c” requirement for “Xatom.h”.
 - Respect LD_FLAGS for linking.

---


   **Version 0.7.0 — September 18, 2011**

 - From the user's perspective, version 0.7 adds hyphenation, saving of the latest screen output into savefiles, re-display of said output upon restore, a much improved X11-frontispiece display and improved localization. Thanks to Andrew Plotkin for the GLK-related code and Eric Forgeot for the french localization. Please see “README-0.7.txt” for more information.
 - Restructured fizmo: The interpreter core, ncursesw- and console-interface, the sdl-sound interface and the X11-specific code have been moved into separate modules named “libfizmo”, “fizmo-ncursesw”, “fizmo-console”, “libsndifsdl” and “libdrilbo”. Basic GLK functionality may be implemented using “libglkif”, an example GLK implementation based on glktermw is available in module “fizmo-glktermw”.
 - Implemented Frank Liangs TeX hy-phen-a-tion algorithm into the wordwrapper. Patterns were taken from the “hyph-utf8” project at http://www.ctan.org/tex-archive/language/hyph-utf8/. Re-implemented the word wrapper.
 - Rebuilt locales system. So far, all available locales were directly compiled into the binary and stored using a rather inflexible method which wasted some memory. Version 0.7 now stores the locales on the disk, reading only those languages and modules which are currently required. All i18n-invocations do now directly accept a module identifier, make the old switch functionality obsolete. Adapted all i18n calls to new method.
 - Rebuilt output history storage. This has been reimplemented using a single memory stream instead of storing text and metadata separately.
 - Implemented a cell-screen meta-interface. This translates the output from fizmo's screen interface into simple goto-xy and print commands, allowing implementation of interfaces using fixed-width fonts with a minimum of work. This is also used by the new “fizmo-ncursesw” interface, which has also been entirely rewritten.
 - libdrilbo (“drilbo represents an imaging library not only for blorb objects”) now handles all graphical related tasks. It also makes fizmo's version 0.6 requirement for GTK to load images obsolete, it directly uses libjpg and libpng to load images and provides its own Xlib implementation for X11 output.
 - X11 frontispiece display is now by default in a separate window, which, contrary to the older implementation that simply invoked a XCopyArea directly into the terminal's X window, should work reliably. For terminals which by chance support it, the old behaviour is still available by using the “display-x11-inline-image” config option. The inline display has been changed to no longer write directly into the terminal window, but instead to use a subwindow instead.
 - Implemented saving of text history using a non-standard chunk type “TxHs” in quetzal savegames.
 - Added configuration variable “save-text-history-paragraphs” which defines the maximum number of paragraphs to store in a savegame.
 - Added variable interpretation – so far, only $(HOME) is implemented – for config files.
 - Re-implemented the entire build process. Libraries may now be compiled and installed on their own, pkg-config is used whereever possible to ease compilation and installation.

---


   **Version 0.6.10 — June 29, 2011**

 - Bugfix release: Fizmo did not stop tokenzing after the maximum number of allowed words, which would result in a parse buffer overflow. Thanks to Samuel Verschelde for discovering this problem.

---


   **Version 0.6.9 — April 24, 2011**

 - Bugfix release: Fixed negative count for unsorted dictionaries in the tokenise opcode. This fixed the crash in “Beyond Zork” which occurred while executing “i” after an item was name, thanks to irb.
 - Fixed “get_utf8_code_length”. This fixes output of non-latin1 output codes in the transcript file, thanks to Lewis Gentry, closes debian issue #617714.
 - Increased maximum allowed option size to 512 to allow for longer filenames.
 - Added NCURSESW_INCLUDE_FROM_W_DIRNAME to configs to allow usage of Apple's ncurses implementation, added GDKPIXBUF_INC_DIR configuration variable.

---


   **Version 0.6.8 — January 12, 2010**

 - Bugfix release: Interpreter and interface information is now correctly written into the header after restarting, additionally the input length for transcript and command input/output-stream filenames has been  fixed. Thanks to Samuel Verschelde.
 - Added “sync-transcript” option: When enabled, it'll flush the wordwrapper and file output buffer as soon as possible.

---


   **Version 0.6.7 — December 14, 2009**

 - Fixed trunction of babel data input. So far, the last byte was cut off from the input, resulting in an error if the file was encoded using unix newlines, but no errors as long as DOS newlines were used. This fixes missing metadata issues in the story browser. Thanks again to Zachary Kline.

---


   **Version 0.6.6 — December 14, 2009**

 - Fixed story browser to remove “.zblorb” suffixes from story titles which are not backed by babel information and evaluated from the filename. This will only work for new stories which are added to the list, to re-index your current story-list the old file has to be removed and re-built. “rm $HOME/.config/fizmo/story-list.txt” should be run first, followed by the command “fizmo -u”. Thanks to Zachary Kline.
 - Minimal changes to the seeding of math.c's “srand” and “init_by_array” in hopes of increasing input entropy.

---


   **Version 0.6.5 — October 13, 2009**

 - Bugfix release: Recommend for MacPorts, will make compiling work for parallel builds in MacPorts version 1.8.0+.
 - Transcription will be kept active after restarts, thanks to Samuel Verschelde.
 - Fixed Makefiles for parallel builds (make -j).

---


   **Version 0.6.4 — May 24, 2009**

 - Bugfix release: Definitely recommend for read_char fix.
 - Fixed interface to supply default colors in case ncurses' “pair_content” returned invalid colors (thanks to Samuel Verschelde).
 - Input from read_char is no longer re-echoed to the screen (thanks to Samnuel Verschelde).

---


   **Version 0.6.3 — April 26, 2009**

 - The top-level Makefile may now be invoked with “CONFIG_FILE=<filename>”.
 - Adapted “config.macos.mk” to MacPorts portfiles and ports-filesystem so that fizmo is now easily MacPorts-buildable.
 - Added license information to every file.
 - Improved GNU coding compliance: install now goes to “($DESTDIR)/usr”.

---


   **Version 0.6.2 — April 25, 2009**

 - Bugfix release: Corrected save opcode and prepared for debianization.
 - Adapted manpage to make lintian work.
 - Corrected “src/c/interface.h”.
 - Fixed typo in manpage.
 - Fixed save opcode to not wrap data into IFF and to disable compression when only a table from memory is saved (operands 2 and 3 for address and length are set). This fixes “Comp96.z5”.

---


   **Version 0.6.1 — March 30, 2009**

 - Bugfix release: minor addition of several features (may now compile without libsndfile and libSDL alone, implemented XDG base directory specification).
 - Removed unused references to SDL-mixer (which isn't used for anything anymore).
 - Improved and documented default “config.\*.mk” files and added config default for cygwin with sound support (to my own great surprise, sound really works under Cygwin).
 - Added more information to “INSTALL.txt”.
 - Implemented new ENABLE_AIFF_FOR_SOUND_SDL variable in config files. This allows the sound-sdl-interface to at least play Infocom .snd files when no libsndfile is available.
 - Added config-file options to manpage.
 - Changed location of fizmo config directory from fixed “$HOME/.fizmo” to XDG_CONFIG_HOME standard and implemented use of XDG_CONFIG_DIRS. Thanks for suggestions and debugging help from Eric Forgeot. Specifications and more information found at http://freedesktop.org/wiki/Software/xdg-user-dirs.
 - Fixed broken space allocation, forgotten NULL-checks and fixed some issues to make frontispiece work better on GenToo. Thanks for these patches from David Leverton (see also line #50 in “src/ncursesw/Makefile”). This fixes possible startup crashes.
 - Added FIZMO_BIN_DIR variable to Makefile.

---


   **Version 0.6.0 — March 25, 2009**

 - (find c cgi cpp fizmo ncursesw simple-c simple-cpp single-turn sound-sdl   -type f -name '\*.c' -or -name '\*.cpp' -or -name '\*.h' | xargs cat | wc -l  resulted in 29953 lines of output)
 - This marks the point for the first public beta release. Killed all known bugs as far as I could find them and made fizmo work on Linux – tested with a 64-bit distribution of Debian/Lenny – and Mac OS X 10.5 with a 32-bit Intel machine and MacPorts for SDL. New features since version 0.5 include an SDL-based sound interface, support for charachter font via unicode translation, partial (z)blorb-support – runs code from blorbs, can display frontispiece images in XTerms and play AIFF-sounds, a story file navigator, interface margins, restore from command line, a much improved streams implementation, a manpage and many other small features as well as a large amount of bugfixes.
 - Implemented conversion of font 3 (charachter font) to unicode. This appears to make Beyond Zork's map appear at least readable.
 - All directories in the “ZCODE_ROOT_PATH” are now recursively searched for Z-machine games.
 - Implemented recording and replaying of timed input.
 - Implemented new “\*.snd” search method: Generalized for all files, not only Lurking Horror and Sherlock, tries upper- and lowercase.
 - Fixed scan_table opcode. This fixes Beyond Zork window output.
 - The filename input for save and restore may now be cancelled using the escape key.
 - Pressing arrow up/down during filename input no longer displays the command history.
 - Implemented wordwrapper / ncursesw margins.
 - Flags are now correctly restored during undo and restore opcodes.
 - Added progress indicator for story-list update.
 - Fixed a bug that would damage the story list in case a game had a release code with a length equal 5.
 - Fixed an issue that would cause bits > 0xffff from routine address to be lost on timed-routine-calls.
 - Implemented “no-update” command line flag and config option to avoid long startup scan times (for example on slow notebook drivers with many story files).
 - Implemented “--search” and “--recursively-search” command line invocations.
 - Fixed bug in scrollback parapgraph position cache.
 - Fixed a memory leak from getcwd(NULL, 0) in “filelist.c”.
 - Fixed scroll-down display for scrolling to bottom.
 - Fixed crash that occured when a read-instruction was recursively called from a timed input verification-routine.
 - Modified LOADB / LOADW opcodes to store 0 in target instead of doing nothing when trying to read from an illegal address. This appears to make the russian version of “All Roads” (“AllRoadsR.z5”) work.
 - Fixed a bug in the story-title evaluation from filename when the story name did not contain any slashes.
 - Fixed display error on refresh of preloaded input from history.
 - Implemented IGNORE_TOO_LONG_PROPERTIES_ERROR config define which makes “property.c” ignore too long properties (fixes “HugeCave.z8”).
 - Implemented forced predictable mode (ignores seeding random generator).
 - Fixed story-list for directly invoked files with relative pathname.
 - Many, many other minor fixes and extensions.

---


   **Version 0.5.3 — March 11, 2009**

 - (find c cgi cpp fizmo ncursesw simple-c simple-cpp single-turn sound-sdl -type f -name '\*.c' -or -name '\*.cpp' -or -name '\*.h' | xargs cat | wc -l resulted in 28499 lines of output)
 - Re-built SDL-Sound system (implemented sound effect stack, better sound- has-finished-detection and many, many fixes).
 - Re-wrote Makefile system. Releveant module defaults are now kept in separate .mk-files.
 - Added support for AIFF-sounds in blorb files.
 - Added support for extra-blorb files (these are specified on the command line directly after the story file name).
 - Added “-Wextra” flag to CFLAGS and cleaned up new warnings caused by the new flag.
 - Cleaned up config file, fixed a minor bug and made boolean vars work “more” correctly.
 - Fixed “VERIFY” opcode.
 - Several fixes: Patched “savegame.c” to re-enable use of “CMem” save method, removed a superfluous free in streams.c which tried to free a static string.
 - Many minor fixes (option system, running X11-enabled fizmo in text-only console, etc).

---


   **Version 0.5.2 — January 17, 2009**

 - (find c cgi cpp fizmo ncursesw simple-c simple-cpp single-turn sound-sdl   -type f -name '\*.c' -or -name '\*.cpp' -or -name '\*.h' | xargs cat | wc -l resulted in 27123 lines of output)
 - Implemented filelist (which remembers all files invoked and files in searched directories).
 - Added use of libxml2 to parse metadata from the babel XML file.
 - Implemented story selection menu in ncursesw interface.
 - Implemented parsing of rc file.
 - Added bold-for-bright-foreground and blink-for-bright-background terminal options.
 - Implemented dont-use-color and force-color option.
 - Fixed interface for > 121 colors.
 - Added “help” command.
 - Implemented “savegame-path” configuration option which specifies the directory for savegames.
 - Implemented text paragraph position cache to speed up scrollback for large amounts of text (not elegant, but works).
 - Savegames are no longer restored in case serial, release or checksum don't match.
 - Removed non-standard “FILE” chunk again, the storyfiles for directly invoked savegames (from the command line) are now located via the filelist.
 - Implemened “force-quetzal-umem” config option from the command line.
 - Added manpage.
 - Fixed “verify” opcode.
 - Basic implementation of input stream 1.
 - Implemented basic blorb support (meaning that blorb files are detected, information about pictures and sound is parsed and the first found “ZCOD” chunk is executed).
 - Fizmo now always keeps a FILE\* to the story file open, eliminating the need for a lot of open / close calls (and simplyfing blorb handling).
 - Stories may now be started from the command line using their “real name” in case they are stored in the story-list. Example: “fizmo sorcerer”.
 - Many, many small fixes (scrollback, winch-redisplay, negative score, undo, crash on large scrollbacks, etc).

---


   **Version 0.5.1 — November 4, 2008**

 - find fizmo simple-c simple-cpp c cgi single-turn cpp ncursesw qzinspect   snd2aiff sound-sdl   -type f -name '\*.c' -or -name '\*.cpp' -or -name '\*.h' | xargs cat | wc -l  resulted in 23265 lines of output)
 - Implemented SDL-sound-interface. To make SDL work in Mac OS X I've used MacPorts to install SDL (“port install libsdl”), on Debian I've been using “apt-get install libsdl-sound1.2-dev” (maybe “apt-get install alsa-base alsa-utils” is also required).
 - Fixed scrollback and i18n-exit-translation.
 - Fixed libfizmo to also use setitimer/sigaction (makes fizmo work better on linux).
 - Implemented foreground/background color command line parameters for ncursesw interface.
 - Fixed get-cursor-[column|row] for ncursesw (makes PRINT_TABLE and Sherlock work).
 - Added “UMem” support for quetzal.
 - Added “snd2aiff” commandline utility (this was the basis for the first sound interface experiments).
 - Added “qzinspect”, a simple commandlinetool which uses libfizmo to list the contents of a quetzal savegame.
 - Added non-standard “FILE” chunk to savegames which contains the absolute file name of the story file which saved the game.
 - Implemented restore from the command line: In case a quetzal-savegame containing the non-standard-chunk “FILE” is given on the command line, fizmo will try to restore the savegame using the story filename stored in this chunk.

---


   **Version 0.5.0 — October 30, 2008**

 - (find fizmo simple-c simple-cpp c cgi single-turn cpp ncursesw -type f -name '\*.c' -or -name '\*.cpp' -or -name '\*.h' | xargs cat | wc -l resulted in 21963 lines of output)
 - This version is now definitely usable to play all non-v6 games. Did extensive testing using Borderzone, “LostPig.z8”, “Zokoban.z5”, “crashme.z5”, “etude.z5”, “paint.z5”, “random.z5”, “reverzi.z5” and “unicode.z5”. Only two minor known bugs remain: Scrollback sometimes miscalculates the current row after a lot of scrolling back and forth (which is always “fixable” to pressing any-key which correctly rebuilds the current output page, and a display anomaly on the frontpage of “vampire.z8” which I intended to keep after a lot of code-inspection (since fizmo appears to be implementing the screen modell correctly and fixing this display problem breaks a lot of other games). This version has been tested on Linux, Darwin (Mac Os X) and a little bit on XP/Cygwin (using a self-built ncursesw).
 - Added “z_ucs_rchar” to “z_ucs.c”.
 - Re-implemented word-wrapper to not compress multiple spaces, keep spaces after newlines and buffer more than on line. The fixes the map display problem in “Enchanter”.
 - Changed opcode_restore to read dynamic memory and stack of the restored game into a freshly allocated memory block instead of directly into the game data. This makes it possible to now continue the current game instead of dropping back to the command line.
 - Fixed opcode_save to not exit in case an errors occurs during saving, but to merely give a warning (and correctly evaluate the branch). Now the currently active game isn't lost anymore in case a save goes wrong.
 - Added a LOT of error checking in “iff.c” and “savegame.c”. There's possibly a better way, but checking every single return value also works.
 - Added table-saving extensions to save- and restore-opcodes.
 - Fixed tokenizing for version 5+.
 - Fixed timed-input detection for “read” opcode. This fixes the crash in ZTUU when the lantern goes out.
 - Ran fizmo through (sp)lint, fixed memory leaks, minor bugs, many typecasts, some double and inconsistent definitions, cleanup up code.
 - Fixed Makefile dependencies.
 - Fixed a possible SIGSEV when using fprintf with “%ls” output format. This tended to crash when used on wchar_t on darwin.
 - Implemened scrollback for ncursesw interface, added support method for scrollback in “history.c”.
 - Added last missing v5 opcodes.
 - Fixed end-of-stack detection so that stack is now correctly enlarged when required.
 - Added module-based localization, removed unused localization entries.
 - Fixed space detection in wordwrapper.
 - Fixed metadata-handling (memcpy) in history.c
 - Added “single-turn” interface.
 - Fixed operand handling in zpu.
 - Added configuration system.
 - Re-built save/restore, should be finally 100% quetzal compatible.
 - Implemented output stream 4.
 - Fixed output stream 2.
 - Some split-window / set_window / set_cursor fixed for ncursesw-interface.
 - Substitued ualarm/signal with setitimer/sigaction since the first one won't catch SIGALRM on linux and manpage says that ualarm is obsolete.
 - Fixed color management so that ncurses color pair is avaiable for reading.
 - Many, many minor bugfixes.

---


   **Version 0.4.1 — November 14, 2007**

 - 16373 lines in \*.h and \*.c files
 - Fixed a bug in “parse_utf_8_char”, this fixes i18n-messages.
 - Added C++ wrapper.
 - Implemented demo C++ screen interface.
 - Separated code in core, interface, c and cpp interfaces.
 - Improved upper window handling (trinity sundial) and blockbuffer (zork1.z5).

---


   **Version 0.4.0 — March 20, 2007**

 - 13718 lines in \*.h and \*.c files
 - Moved to this new version on March 3, 2007. The old version has been lying around untouched since November 15, 2006.
 - Abandoned the internal use of UTF-8. It is just much too complicated to handle in the interface. I'm not even sure that with all the code necessary to handle UTF-8 handling that there is much space wasted. The important point for me is that using UCS-4 – fixed, 32-bit sized characters – is much more easier, and thus safer to use.
 - Re-implemented everything using wchar_t. The barebones C-Interface is the first converted. Everything took only a few hours.
 - Compacted code a little bit (tracelog.h, etc.).
 - Re-implemented the history-buffer in “streams.c”. It is controlled by the Z_HISTORY_INCREMENT_SIZE and Z_HISTORY_MAXIMUM_SIZE constants in file “config.h”. The buffer is re-alloced until it reaches the given maximum size. At that time, wrap-around is used to keep the buffer up to date. A debug function named “log_history” exists.
 - Converted the error handling to wchar_t.
 - Implemented SIGWINCH-handler for interfaces and associated handling in “ncrws-if.c”.
 - Implemented metadata (color and style) storage for the history.
 - Implemented set_font opcode.
 - Fixed two minor issues in the wordwrapper.
 - Fixed a missing string-terminator in the zchar_to_ucs_4-function. Over two years that thing was working without it ... unbelievable.
 - Fixed a token-length problem in parsing.
 - Implemented correct UTF8-filename-handling for savefiles.
 - Implemented CATCH and THROW opcodes, both untested.
 - Re-built interpreter commands with new wchar-base, prompt-repetition from history and user-configurable prefix.
 - Re-implemented scripting with UCS-4.
 - Implemented buffering of metadata – colour, styles and font – in the history buffer. Windows may now be resized and keep their styles intact.
 - Fixes in property-management for version 4 games.
 - The sound-effect opcode is accepted now for effects 1 and 2, although it doesn't do anything yet.
 - Improved split-screen in ncurses-interface: In case the upper window becomes smaller, its content is copied over into the lower window (making reading the sundial in trinity.z4 working).
 - Fixed set_window to set cursor to (0,0) when selection upper window (this makes the sonarscope in Seastalker work).
 - Fixed wordwrapper to accomodate for styles which are sent after normal text which is followed by a space – so far the style was activated before the space was output.
 - Implemented command history.
 - Fixed a bug that would cause screen resizes in versions before 5 try to set colours.
 - Implemented specialized blockbuffer for upper window.
 - Threw away wchar_t- and locale.h-usage. The problem is that they are not suported on older compilers, embedded systems or in emulations like cygwin. According to specifications, wchar_t may even only have 8 bits width and is compiler-implementation dependant, so it's practically not useable to store unicode-data. So i've implemented a z_ucs type which is always used for internal processing of characters. Thus every interface gets its output in z_ucs chars (which are simple int32_t types) and can happily typecast it into wchar_t if desired. Interfaces may still use wchar_t (in fact, ncursesw does), but the core is now completely autonomous.
 - Fizmo now compiles fine without warning on Cygwin. Both the c- and the ncursesw-interfaces seem to work nicely.
 - Fixed a bug in the wordwrapper which caused the zchar-converter-state and the linebuffer to overlay in a single byte.
 - Added “z” parameter to i18n string, representing z_ucs-strings.
 - Fixed stream-3-output: Current length is now always updated, not only when closing the stream.
 - Fixed input to make it work all across the screen and not only on the last line.
 - Fixed cursor movements and screen splits for version 4 and 5.
 - Splitted files into fizmo-core and interfaces. The interpreter itself is now put into a static library and linked in from the interfaces.
 - Moved “extern” statements into header files.

---


   **Version 0.3.1**

 - 12276 lines in \*.h and \*.c files
 - Added a few ZSCII/ASCII/ISO-8859-1/UTF-8 conversion functions in “text.c”.
 - Improved the ncursesw-interface to handle US-ASCII and UTF-8 directly.
 - Implemented detection if a character has a suitable ZSCII representation before adding it to the input line.
 - Fixed a bug which prevented correct assembly of multi-Z-characters.
 - Fixed a bug that caused multi-Z-character constructions to have a wrong word length.
 - Extended ncurses interface to handle scrolling on the input line.
 - Once input of a new line is finished, it is erase and then output again using the interface's output_utf8 function. This allows output which is longer than a single line to be word-wrapped.
 - Implemented correct delete and insert in the ncurses interface.

---


   **Version 0.3.0 — November 10, 2006**

 - 13302 lines in \*.h and \*.c files
 - Abandoned the concept to pack absolutely everything in UTF8f. Having to think though the fork-8f is simply more complicated than necessary. In the name of “Keep it simple, stupid” I'll revert to my old idea of having a function in the interface for every output function like color setting, changing font style and so on.
 - Removed wordwrapper, pager, decoder, utf8conv, fork8f and fpipe. Reverted the system to the plain-style-C interface. I'll use the break in the development chain to clean up the code and take a second look at most things which has proven quite benefical in similar occasions.
 - Cleaned up most of the code. I've now got a clean, simple version without any real interface around running again. Better yet, since my last tries with ncursesw I've finally found out how to reliably produce UTF-8 output: By simply calling the setlocale function from #include <locale.h> and setting LC_ALL to “”. Once the system locale is now set to something using UTF-8, ncurses delivers correct output.
 - Implemented a new, much simpler wordwrapper that should now also wrap UTF-8 correctly.
 - Fixed quetzal saving. The main FORM chunk has now the correct length so that both frotz and Zoom now correctly load savegame files.
 - Implemented a whole new wordwrapper. This one correctly wraps UTF-8 and is capable of storing “metadata” – colors and styles – into the text. This allows color and style changes in the middle of a word without having to flush buffers.
 - Implemented colors.
 - Implemented text style.
 - The etude.z5-test is running again. So far I've got everything working except the character output.
 - Implemented v3 window handling.
 - The random.z5 test is now running okay.
 - Implemented [More] prompt.

---


   **Version 0.2.1**

 - Improved command line parameter handling.
 - Fixed a REAL nasty bug in the line-history resulting in buffer overflows in very rare cases.
 - Fixed another minor bug that would let the word wrapper start a new line after input with a space (Wishbringer's “read message and move leaves”) by added the wordwrap_reset_wrapper method (which correctly reset the number of consecutive spaces).
 - Fixed a bug that would cause a crash when games were saved in a restarted game (forgotten store_empty_stack_frame).
 - (Successfully completed Wishbringer – 96/100 points, one wish used. I just have to find a way to unlock the chains down in the tower...)
 - Fixed paging module, long lines causing wrap-arounds are now correctly accounted for. Modified the module to keep one more line than required on the screen to ease continued reading.
 - Tested compatibility to Zork I, Z-Machine version 1, release 2, serial number AS000C. This version appears to have a bug at $585b. It occurs when the command “open mailbox and read leaflet” is executed right at the beginning. To circumvent this, a skip-underflow-check can be enabled in variable.c.
 - I've posted a related newsgroup-message at http://groups.google.de/group/ rec.arts.int-fiction/browse_frm/thread/c77652b28be69f2d/ a52b9f652fc75928#a52b9f652fc75928
 - Added the “@info” command.
 - Added automatic detection of “problem” games. This way, the “AS000C” hack is automatically activated at start-up.
 - Activated hacks are displayed using the “@info” command.
 - (0.20.1 finished)
 - Enchanhed the pipe/filter system. Each filter will now receive the destination function (and “object-struct”) directly. Thus, no more extra forwarding functions are required.
 - Rebulid the windowing system in the curses interface.
 - No more flushes are sent from the fizmo “core” any longer. The interface will flush it's filters by itself if required (sending a flush into the first filter in case input is required or the interface is closed).
 - ABSOLUTELY FASCINATING to discover how many can bugs can still reside in a program just to creep up occassionally ... or is that just a sign of a bad programming style? Now I begin to grasp even more the significance of Java's Array-out-of-bounds-exception. I found a bug in the utf8x-buffer (forgot a multiplation by factor 3, resulting in a much too small buffer. I must have had a lot of overflows without ever noticing them in the past). Found another bug in the UTF8x-Converter where I simply referenced the wrong variable.
 - Fixed a forgotton “converter->utf8f_parameter_bytes_to_copy = 0” in utf8conv.c which SOMETIMES (grrr!) caused an error which caused the screen output to vanish.
 - Reorganized piping in the curses interface. Every window now has its own combination of wordwrapper, converter, pager and decoder. General window commands like split_window or erase_window are caught by a enhanced type of decoder named fork8f and passed along to the correct window structure. The random.z5 seems to work fine and I hope it's sufficiently correct to finally try my luck with Seastalker.
 - (0.20.2 finished)
 - Fixed status line display.
 - Fixed ncurses color recycling.

---


   **Version 0.2.0 — April 15, 2006**

 - 12794 lines in \*.h and \*.c files
 - Version 0.2.0 adds an unix interface, allowing for timed intput, and an [n]curses interface including color, better wordwrapping and accented characters. Zinc now runs random.z5 and passes all of the etude tests. I completed Moonmist without encountering any strange behaviour.
 - Put the conversion of UTF-8 to [ASCII|ISO-8859-1|UTF-8] in utf8conv.[c|h]. That way, c_if.c is now down to a minimum size, and all it's “outsourced” functions – wordwrapping and UTF-8-conversion – can now be used without any problems by other functions or interfaces.
 - Cleaned up Makefile.
 - Implemented call_vs2 and call_vn2 opcodes.
 - Made PRINT_NUM output signed instead of unsigned numbers (found it thanks to etude.z5).
 - Corrected OPCODE_MOD to correctly handle signed operand 0 values (etude again).
 - Corrected a REAL nasty mistake: Replaced sizeof(<constant>) in a utf8conv.c malloc-call with a simple <constant>. This made the system crash under OS X PPC (though not on linux and some other unix-variant).
 - Re-organised the makefile a bit. Interface dependencies are now correctly resolved and build dependencies are in order again.
 - Renamed the interpreter from the project name “zint” – meaning Z-Machine-Interpreter – to “ZInC”, meaning Z-INterpreter-Code.
 - Corrected the Makefile again.
 - Implemented the Unix-Interface. This one assumes that it's running on a unix machine terminal without any specials (not even curses).
 - It uses select and tc[g|s]etattr to implement timed and preloaded input and a get_char implementation.
 - Fixed a bug in unix_if.c that would cause a segfault on startup.
 - Some more i18n, cleaner tc[g|s]etattr in unix_if.c
 - Implmented correct input line restoration after timed-input output.
 - Modified text.c so that the streams_echo_input command is executed no matter whether the first word could be found in the vocabluary or not.
 - Implemented preloaded input in the Unix-Interface.
 - Implemented correct READ_CHAR in Unix-Interface.
 - Fixed a LOT of tiny bugs and itches.
 - Implemented [MORE] paging via additional pager module.
 - Fixed german translation of i18n messages.
 - Fixed ZSCII-to-UTF8 encoding, ZInC now passes etude's accented character test.
 - Implemented a curses interface. At the moment raw constructs for the upper and lower window and a status line. Basic color management. Adapted wordwrap.c a little bit in order to achieve corrent linebreaks.
 - Completely re-wrote wordwrapping in order to get rid of trailing spaces and other problems evident when using curses.
 - Completely re-wrote the entire output stream system. It turned out that the usage of flags caused problems buffering text: In order for everything to work correctly the flags would have to be buffered along with the text output. Text-relevant formatting data like color is now passed directly along with the UTF-8 text: Internally I'm now using an encoding that can encode special formatting sequences into the UTF-8 stream – see UTF8X.txt for more information. These conversions added the utf8x.\* and decoder.\* files. Although quite a major change, the encoding helps to make the whole system a lot cleaner.
 - Numerous fixes to the [n]curses interface, addition of status line, better color management with careful consideration of availiable color pairs.
 - Using the ncurses interface, the interpreter now passes the etude.z5 test with the exception of the text styles and undo capability.
 - Modified the i18n_translate_and_exit and close_streams functions to support a message-on-exit. This way, error messages are supported without regard for what's left in the UTF8x output pipe and error output can be seperated from the other valid stream output. This way, the ncurses interface can correctly endwin() and output the message to read on stderr.
 - So far, multiple invocations of READ or READ_CHAR with timed input casued a “nested timed input not availiable” error. This is a problem for the random.z5 test which appears to use this feature. The nested behaviour has been altered to an overwrite behaviour. In case a second timed input is requested, the old timer and routine are erased from memory and replaced with the new data.
 - Fixed interface commandline choice.
 - The random.z5 tests now apperas to run correctly.
 - Fixed a tiny bug in wordwrapping directly after read_line, fixed command line parsing, i18n-string-length and a few tiny localization issues.
 - Added text styles to the curses interface.
 - Finally added modifiable names for game saving and restoring.
 - (Successfully completed the red storyline of Moonmist).
 - Renamed ZinC (name already exists) to fizmo: Fizmo Interprets Z-Machine Opcodes.

---


   **Version 0.1.4 — December 9, 2005**

 - 8848 lines in \*.h and \*.c files
 - The 0.1.4 complies to the strictz.z5 test, allows transcripting (even on startup via command line switch). A few minor bugs were fixed and a history of the last output is kept, allowing for a faithfully original prompt after an interpreter command has been finished.
 - Compacted locate_dictionary_entry (so that the zscii_string_length function is no longer needed) and adapted it to version 4+ files.
 - Implemented the object-number-unequal-zero-checks (in order to run strict.z5).
 - Adapted read opcode to version 4+.
 - Renamed c_iface.c to c_if.c in order to gain more space for other interface names.
 - Fixed zchar_to_utf_8 so that multibyte-characters are handeled correctly between two zchar_to_utf_8 function calls (when continuing on the first call's source string due to output buffer shortage).
 - Implemented basic transcipting in streams.c and moved the trace functions there. All output is now channeled from text.c through stream.c into the active interface. The input is seperately written to to the streams, in order to be able to distinguish it from regular output (and to write it only to the streams requested).
 - Implemented “-s” / “--start-script” startup option to start scripting right away. This allows to capture really all input emitted by the game.
 - Implemented input of file name (supplying a default filename) for transcripts.
 - Fixed a bug in the parsed word position which would cause the following garbeled Moonmist-output:>get out of the cat[I don't know the word " cat."]>oops car [I assume you mean: get  ou  o  th  ca]You're not in it!
 - Implemented CALL_VN opcode.
 - Added STRICT_Z definition in config.h and implemented a lot of checks in object.c together with a warning mechanism in i18n.c in order to make this interpreter compliant to strictz.z5.
 - Fixed a bug in the length-code-size determination in properties.c (replaced “& 80” with “& 0x80”).
 - Added a lot of STRICT_Z tests to properties.c.
 - Implemented READ_CHAR opcode (not very well, since in stanard C without any Operating-System-specific calls there's no single read of a char, thus you still have to press enter).
 - Zinc now passes the strictz.z5 test and looks close enough to the frotz output stored at http://www.ifarchive.org/if-archive/infocom/interpreters/old/frotz/frotz_zstrict_result (with other warning messages, of course).
 - Implemented wordwrapping as a seperate re-usable module in wordwrap.[c|h]. The C-interface and the function for output to stream 2 currently use it both.
 - Implemented line_history_buffer, a circular buffer that will record the last output sent to the streams. It's supposed to be used for reconstruction of the current prompt in case an interpreter command is entered an the original prompt should be restored after executing it and later for easier handling of preloaded input.
 - Interpreter commands will now prompt with the last line that was output by the Z-program after finishing command processing.

---


   **Version 0.1.3 — November 27, 2005**

 - 6013 lines in \*.h and \*.c files
 - This 0.1.3 version adds localization for error- and startup messages, corrects a few minor bugs abd adds UTF-8 support.
 - Made mod (remainder-after-divison) signed (due to 2.2.1).
 - Corrected opcode_div so that the divisor, not the dividend, is verified not to be 0. Added divisor-not-0-check to mod.
 - A few paranoid sanity checks in opcode_read.
 - Modified opcode_read so that the whole line of input is always read, no matter how much can actually be stored so that the next line of input does not begin with left-over-text. The non-used input is discarded.
 - Removed use of input_to_zscii-function in text.c, since the input does not have to be converted.
 - Extended store_ZSCII_as_zchar in text.c to accept not only characters in the current alphabet, but also to encode other chars as multi-z-chars, thus also allowing the '@' as input which I want to use to identify interpreter commands.
 - Implemented the “@predictable” command to switch interpreter in or out of predicatable random mode as suggested in the spec.
 - Made random generator more spec conforming by using negative values to seed the generator to this value.
 - Implemented parsing of command line options. Currently only used to start up interpreter in predictable random mode.
 - Implemented UTF-8 handling. The data traffic between the core interpreter and the interface(s) has been modified to use exclusively UTF-8. It is now also possible to output a whole string via the utf_8_output function.
 - The C interface can now be put in three output modes – ASCII, ISO-8859-1 and UTF-8. Characters that cannot be printed in the ASCII and ISO-8859-1 modes are substituted by a '?'.
 - Implemented UTF-8 output as defined by the Z-Machine specification v1. So far only implemented without testing.
 - Implemented loclization. In order to avoid special cases in which it is not possible to tell the user that the localized files cannot be loaded since the files have not been loaded yet in his own language :-) I'm using the prepi18n binary to convert the locales/xx_XX.txt into the file locales.c which can be directly complied into the interpreter binary.
 - The localization files are supposed to be encoded in UTF-8 so they can be easily output using the usual interface functions.
 - Split the activate_interface function into activate_interface and link_active_interface_to_story. The first call actually initializes the interface which is used to make output possible (in case the story file can't be loaded), the second call performs the necessary initializations with the story file's header.
 - Extended localization to use parameters the like “Could not open \{0}.”.
 - So far, parameters are only allowed to contain ASCII values.
 - Moved last remaining function in output.c, read_zscii_string, into text.c.
 - Implemented forgotten lowering of case after reading input from the keyboard. Now it's possible to answer “YES” to Moonmist when it asks for “YES or NO”.
 - Cleaned up stack.c a bit and fixed a bug that would have caused the stack not to enlarge in case it was supposed to.
 - Extended localization to use type identifiers. In the beginning I decided to skip them, but to make error messages useful to the user and handier in the code I decided to give it a shot. Parameters are now specified by using \{0s} for a string and \{0d} for a decimal. Together with a few supporting wrapper functions, the main file already looks much cleaner. Due to the buffering of the Z-Machine output, messages are even correctly word-wrapped.
 - Implemented switching between ASCII / ISO-8859-1 / UTF-8 into zinc.c.
 - Logically it would have been better to put it in to c_iface, but since it will be required more often and don't want any copied code I decided to leave it this way.
 - Implemented echo option in the C interface in order to be able to read the input from input piped into the interpreter.
 - Converted all current 51 conditions-to-translate from FATAL_ERROR and [s|f|]printf to i18n_translate[and_exit]. The FATAL_ERROR macro has been removed.
 - Compacted the zchar-storage-functions.
 - Completely replaced read_zscii_string with zscii_to_utf_8. The new functions will output z-char-strings of an arbitrary length into an limited-size output buffer. Multiple calls to this function for the same source string will continue with the output where the last call of the functions had to stop.

---


   **Version 0.1.2 — October 20, 2005**

 - 5094 lines
 - 0.1.2 fixes my currently last known problems with playing the 840726 Zork I revision. Word wrapping makes it look a little bit nicer and the barebones-C-interface is now probably as good as it can get. Did quite a lot of code-cleanup.
 - Implemented NOT opcode.
 - Implemented NOP opcode.
 - Implemented RESTART opcode.
 - Implemented POP opcode.
 - Implemented SHOW_STATUS opcode.
 - Allowed output of tab – ZSCII 9 – for version 3 (due to the guidebook in the Dam Lobby).
 - Implemented VERIFY opcode.
 - Implemented PIRACY opcode (we're all honest, so an evaluate_branch(1) sounds okay, right?).
 - Fixed a bug in INC_CHK (wrong cast to unsigned value instead of signed).
 - Totally forgot about the 8.3-filename-limits on DOS machines, files were renamed and merged together – /(.\*)_opcodes.c/ joined /$1.c/.
 - Fixed a bug in the random opcode which allowed 0 as a minimum result value to the random call (should have been 1). Fighting with the thief now results in much less garbled text output.
 - Cleanly wrapped TRACE_LOG calls in curly braces, meaning disabling tracing now works correctly. The zinc binary now has a size of 82308 bytes with logging enabled, and 54700 bytes without logging.
 - Created Makfile-dependency for zinc.h from iface.h (by using the touch command, is the okay?). Made all and clean .PHONY targets.
 - Removed globals.c, moved globals into zinc.c and created “extern” references in other source files.
 - Moved globals to corresponding source files (which eliminates a lot of non-needed “extern” references).
 - The linux manpages tell me bzero is outdated. Faithfully replaced bzero with memset calls.
 - Replaced memcpy call with a loop that assembles uint16_t values byte by byte. This will avoid problems on little-endian machines (i386 and the like), since the Z-machine uses a big-endian model.
 - Used the Mersenne Twister as random generator. Only the genrand_int32 function is used, the rest of the functions, with exception of the two init calls, were deleted from the mt19937ar.c file. The generator is seeded by an init vector consisting of the number of seconds since 1970, a standard C random generator number, the number of milliseconds since 1970, followed by another standard C random generator number.
 - Splitted zinc.h in a header file for each .c file. Adjusted Makefile and #includes accordingly.
 - Changed \*\*z_opcode_procedures into \*z_opcode_functions and moved it from zinc.c to zpu.c (thus avoiding external reference and setup). Now z_opcode_functions is a one-dimenstional array indexed by the value instruction_form + instr_code. This allows saving the space for 32 pointers in the smaller opcode classes (with only 16 instead of 32 opcodes).
 - Implemented buffering / word-wrapping in the C Interface. With this change, the C interface should be complete. Comparing to everything else it's still very raw, but hey, it works.
 - Implemented BUFFER_MODE opcode.
 - Moved all the configuration options from zinc.h to config.h.

---


   **Version 0.1.1 — September 23, 2005**

 - 0.1.1 was the first version that was able to save and restore games.
 - Implemented OR opcode.
 - Implemented MOD opcode.
 - Changed get_prop_len so that get_prop_len(0) returns 0 (for 1.1 standard).
 - Updated property.c, splitted up property search in three functions in order to allow easier implementation of the GET_NEXT_PROP opcode.
 - Implemented GET_NEXT_PROP (you can now pick up the elven sword).
 - Implemented CALL_2S.
 - Implemented CALL_2N.
 - Implemented SET_COLOUR (but does not have no effect in c_interface).
 - Implemented all remaining 2OP-opcodes with the exception of THROW.
 - Implemented DEC opcode.
 - Implemented PRINT_ADDR opcode.
 - Implemented CALL_1S opcode.
 - Implemented REMOVE_OBJ opcode.
 - Implemented LOAD opcode.
 - Modified the tokenising routine to correctly return position and length of a word even if it was not found in the dictionary.
 - Implemented dummy stack frame storage for quetzal compatibility.
 - Implemented SAVE opcode.
 - Implemented RESTORE opcode.

---


   **Version 0.1.0 — September 14, 2005**

 - 0.1.0 is the first version that allows basic playing of version 3 games. The only game used for testing so far is Zork 1 which was drawn from the well-known site of Peter Scheyen.
 - Moving around the house, object movement (taking and dropping of the leaflet) all seems to work quite okay now.
 - Implementing more missing opcodes.
 - Fixing a few not-so-easy to find bugs (like the property addresses etc).
 - Fixed a bug in the branch-address calculation.
 - Fixed a bug in the object-unlinking mechanism that would not correctly remove the object-to-be-unlinked from an object further up the sibling line.

---


   **Version 0.0.4**

 - Implemented the c_interface, which allows very bare-bone input / output provided by standard C facilities (meaning fprintf / fgets).
 - Implementing of user input, tokenising and dictionary parsing.

---


   **Version 0.0.3**

 - Major cleanup of the code.
 - distribution of the old interpreter.c file into multiple .c files.
 - First appearance of the interpreter.h interface.

---


   **Version 0.0.2**

 - Further implementation of the basic capabilities, including property management etc.

---


   **Version 0.0.1**

 - First basic implementation of memory, variables, stack and primary opcodes.


