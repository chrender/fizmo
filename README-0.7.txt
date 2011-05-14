
   User-relevant changes from 0.6 to 0.7:


 - The "enable-xterm-graphics" config option and "-x" are no longer required
   for X11-frontispiece display, the title image will now automatically be
   displayed on startup. Instead the "disable-x11-graphics" option may be
   used to disable frontispiece display.

 - By default, the frontispiece is now show in a separate X-Window -- which
   should always work, contrary to old experimental form of writing the image
   into the terminal. To re-enable the old behaviour, you may use the option
   "enable-x11-inline-graphics", which is however still not recommended as
   a default setting and will still crash on some terminals.

 - Boolean variables like "dont-use-colors" don't require an explicit " = yes"
   after the variable anymore, simply stating the variable name is sufficient.
 
 - Configuration files may now use the $(HOME) variable.

 - In case the "save-text-history-paragraphs" configuration option is set
   to an integer value larger zero, the specified number of paragraphs
   from the most recent output are written into the savefile. On restore,
   these are written to the screen, making it easier to get a picture
   of the saved situation.

 - The default language setting is now no longer determined from the
   current locale setting but instead always set to en_US.

 - In case you're playing in a game for which there's no locale available
   (currently everything non-english and non-german), it might make sense
   to disable hyphenation: [...]


