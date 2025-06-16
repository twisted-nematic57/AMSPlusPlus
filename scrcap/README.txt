/*** scrcap 1.0 ***************************************************************\
 * Author:         twisted_nematic57                                          *
 * Date:           06/15/2025 [MM-DD-YYYY]                                    *
 * License:        Public Domain                                              *
 * Product Type:   Hybrid BASIC/ASM program                                   *
 * Platform:       TI-89/Titanium                                             *
\******************************************************************************/

scrcap is a screenshotting utility for the TI-89/Titanium. When mapped to a
keyboard program, it can be used to take a screenshot of most screens that don't
involve a menu or a dialog. So, that means you can use it to take screenshots of
graphs, your Home Screen, all built-in applications, and most (if not all)
official FlashApps.


I. INSTALLATION

Send "kbdprgm8.89p" to your calculator. It should be in the `main` folder
on-calc, and should be archived. This is the main scrcap executable that is in
charge of taking and storing screenshots.
 * You can remap the program to a different key, if you wish, by changing the
   first "8" in the variable name to some other valid kbdprgm number. (Pro tip:
   use AMS Extender to get more kbdprgm keys:
   https://www.ticalc.org/archives/files/fileinfo/430/43017.html)

Send "picview.89p" to your calculator. It can be stored in any folder, and
should be archived.

Also send "padstr.89f" - you'll find it in the "_deps" folder of this package.
It should be archived and stored in the `misc` folder on-calc.

There's a dependency you'll have to download yourself, called Flib 3.2:
https://www.ticalc.org/pub/89/asm/libs/flib.zip
If the file is no longer available please email me at:
twisted.nematic57 [at] [Google's mail service].com and I will send it to you. I
didn't include it with this package because then I'd have to make it
GPL-licensed, which I think is a bit overkill for a simple calculator program.
 * Both of the Flib binaries (ending in ".89z") should be in the `misc` folder
   on-calc and should be archived.

 - kbdprgm8 is the main scrcap executable that takes/stores screenshots
 - picview is a program used to view full-screen screenshots
 - padstr is a function used to pad/truncate strings
    - https://www.cemetech.net/downloads/files/2618/x3360
 - Flib is a C subprogram used to do "advanced" operations with the screen that
   BASIC can't do alone
    - https://www.ticalc.org/archives/files/fileinfo/117/11770.html


II. USAGE

Just launch scrcap via a keyboard shortcut (which is [DIAMOND]+[8] by default).
It'll take a screenshot, quickly inverting the screen to let you know that it's
happening, and tell you the filepath of the screenshot in the status line after
it's done storing the file. (Note that pressing any keys after taking the
screenshot may cause this filepath message to disappear.)

Screenshots are stored to the folder "ωscrcaps". (That first letter is a Greek
lowercase omega.) Nothing will be automatically archived by scrcap. There will
be ZERO information about the date and time each screenshot was taken, so it is
on you to keep track of/reorganize screenshots after you take them.

scrcap will take a screenshot as long as you aren't actively hovering over a
menu or a floating dialog, like the VAR-LINK screen. This limitation is due to
internal workings of the AMS. Screenshots also cannot be taken in custom ASM
programs, e.g. most games that aren't written in BASIC.


III. VIEWING SCREENSHOTS

A special program is required to view full-screen images, like the ones scrcap
generates. The program for the job is picview, which is included with this
package. Let's assume you've already installed it as per the instructions in I.
INSTALLATION.

Launch the program from the Home Screen by calling it as such:
 misc\picview()

I keep my picview in the `misc` folder, but yours might be different so you can
change the folder reference if need be. If picview is stored in the same folder
as your working directory, you can omit the backslash and everything behind it
entirely. (picview can also be called from within other programs, FYI.)

picview starts by displaying a menu of all the folders you have present on the
calc. Press the [UP] arrow key to jump to the bottom of the list, and navigate
to "ωscrcaps". Press [ENTER] to select it.
 * This is assuming that you haven't moved the screenshot you're trying to view 
   to another folder. If that's the case, select the folder you moved it to from
   the list.

Then, another menu will pop up, listing all the image files present in the
folder you selected in the last menu. Find and select the name of the image file
you want to view.

The entire screen will briefly fade to white to let you know that you're now
viewing a screenshot, and then the screenshot will be displayed. Look at it for
as long as you'd like. When you're done, press any key to exit picview.


IV. FILE ENCODING EFFICIENCY

The TI-89/Titanium screen has 1-bit color in AMS and has a resolution of 160x100
(WxH). The number of bytes required to represent all of it in uncompressed form
is (160*100)/8 = 2000 bytes (B). VAR-LINK reports the file size of each
screenshot to be 2007 B (regardless of content); therefore the AMS' image file
format incurs a 0.35% overhead on top of the raw image data size.


V. VERSION HISTORY

 * scrcap 1.0: initial release; basic screenshotting features implemented; does
   not work in menus/dialogs because of AMS event handling shenanigans :(
