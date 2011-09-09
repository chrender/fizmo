


   User-relevant changes from 0.6 to 0.7:


 - In order to be able to support language-specific hyphenation patterns, the
   file format for the story-list has been changed. Thus, after upgrading
   from fizmo 0.6 to 0.7 you'll have to remove the old file and make fizmo
   re-index your current list automatically from the $ZCODE_ROOT_PATH and
   $ZCODE_PATH or $INFOCOM_PATH:
   rm $HOME/.config/fizmo/story-list.txt ; fizmo-ncursesw --update-story-list

 - Since frontispiece display is now in a separate window instead of directly
   in the terminal and no longer experimental, the "enable-xterm-graphics"
   config option and "-x" are no longer required for X11-frontispiece display,
   the title image will now automatically be displayed on startup. Instead
   the "disable-x11-graphics" option may be used to disable frontispiece
   output.

 - By default, the frontispiece is now shown in it's own X-Window. To re-enable
   the old behaviour, you may use the option "enable-x11-inline-graphics",
   which is however still not recommended as a default setting and may still
   crash your X-Terminal.

 - Boolean variables like "dont-use-colors" don't require an explicit "yes"
   value anymore, simply stating the variable name in the config file is
   sufficient.
 
 - Configuration files may now use the $(HOME) variable.

 - In case the "save-text-history-paragraphs" configuration option is set
   to an integer value larger zero, the specified number of paragraphs
   from the most recent output are written into the savefile. On restore,
   these are written to the screen, making it easier to get an overview
   of the saved situation.

 - The default language setting is now no longer derived from the
   current locale setting but instead always set to en_US since most
   games are provided in english. The default locale may still be set
   using the "locale" variable in the config file.

 - In case there's no locale available for a game you're playing (currently
   everything non-english, non-german and non-french), it might make sense
   to disable hyphenation using either "disable-hyphenation" in the config
   file or using the "-dh" or "--disable-hyphenation" switch when starting
   fizmo-ncursesw.

 - The "bold-for-bright-foreground" and "blink-for-bright-background"
   options are no longer supported. If someone would be still actually
   using them, please send an e-mail to fizmo@spellbreaker.org.

 - Transcripting got a bit more configurable: The new "stream-2-line-width",
  "stream-2-left-margin" and "disable-stream-2-hyphenation" configuration
   variables control transcript behaviour and some command-line options
   were added to ease usage for command recording and replaying (see manpage
   for details).

