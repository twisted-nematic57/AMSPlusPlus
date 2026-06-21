/*** Quickzoom 1.2 ************************************************************\
 * Author:         twisted_nematic57                                          *
 * Date:           04/30/2026 [MM-DD-YYYY]                                    *
 * License:        Public Domain                                              *
 * Product Type:   Hybrid BASIC/ASM program                                   *
 * Platform:       TI-89 Titanium - can be ported to other Motorola 68000     *
 *                 based TI calculators with ease.                            *
\******************************************************************************/

Quickzoom is a program for the TI-89 Titanium that implements a box zooming/
panning mechanism that is much more intuitive than the built-in ZoomBox/other
zooming methods.

The major benefits of using this program over the built-in graphical zooming
methods are:
 * It always maintains the aspect ratio of the viewing window;
 * It's far more intuitive + faster to drag and resize the rectangle instead of
   having to draw two corners in one take;
 * You can store and recall zoom windows to 9 independent slots;
 * You can "back up" slots to have certain predefined viewing windows always
   instantly available;
 * It does not modify your {xscl,yscl} at all on its own;
 * This program makes it very easy to "pan" your viewing window in any
   direction, so it's not just for zooming. (E.g., viewing a different part of
   the graph in identical resolution)


I. INSTALLATION

Send quiczoom.89p to your calculator. Keep it in the `misc` folder, and keep it
archived.

Then send statline.89z from the "_deps" directory. It should be in the `misc`
folder on-calc, and should be archived.

 * statline is a public domain C program by me that enables BASIC programs to
   efficiently manipulate the status line.
   https://www.cemetech.net/downloads/files/2600/x3320

There's another dependency you'll have to download yourself, called Flib 3.2:
https://www.ticalc.org/pub/89/asm/libs/flib.zip
If the file is no longer available please email me at:
twisted.nematic57 [at] [Google's mail service].com and I will send it to you. I
didn't include it with this package because then I'd have to make it
GPL-licensed, which I think is a bit overkill for a simple calculator program.
 * Both of the Flib binaries (ending in ".89z") should be in the `misc` folder
   on-calc and should be archived. Strictly speaking, Quickzoom only depends on
   Flib2 but some other programs may depend on the other binary so it's not good
   practice to have only one.


II. USAGE

It's recommended to launch Quickzoom as a keyboard program. (The included file
`kbdprgm5.89p` integrates Spinner and Quickzoom into a single shortcut: Spinner
will only be launched if the current graphing mode is 3D, else it will launch
Quickzoom, which only works on 2D graphs.)

The first time you launch Quickzoom, you'll get a prompt to create a new folder.
Press [ENTER] when it comes up.

Launching the program will cause the Graph Screen to be displayed and a
rectangle to be drawn at the edges of the window. This rectangle is the "zoom
box".

 * Using the D-pad (arrow keys) will move the box around. Its movement speed
   will increase a little if you hold one or two arrow keys down. If you want to
   move it precisely pixel-by-pixel, then just press the arrow keys individually
   and slowly.
    - You can also use [2ND] + {arrow key} to move the box in large steps.

 * Press the [+]/[-] arrow keys to increase/decrease the box's size.
    - Using [2ND] + [+]/[-] will change the box's size in finer steps.
	
 * To confirm that you want to change your viewing window to the region selected
   with the zoom box, just press [ENTER]!

 * Pressing [ESC]/[CLEAR] will exit Quickzoom and keep the Graph Screen visible.
   Pressing [HOME] will exit the program and return the calc to the Home Screen.

 * Pressing [0] will revert the graph window to the last confirmed zoom from
   Quickzoom. (Please note that the OS's built in ZoomPrev token is entirely
   unrelated to Quickzoom's functionality, and for the best experience you
   should only use Quickzoom's.)

 * Pressing [1] will resize the box back to its original dimensions, perfectly
   lining it up with the edges & corners of the current viewing window.

 * Pressing [STO>] will bring up a menu which lets you save the currently active
   viewing window (not the zoom box!) to a "zoom slot".
    - Pressing [2ND] + [RCL] will let you switch back to/recall any of these
      zoom slots, provided that something was saved to them earlier.
    - Currently populated zoom slots will be marked with a diamond. Zoom slots
      can be overwritten if you choose. There will be no request for
	    confirmation if you choose to overwrite a zoom slot.
	  
 * Pressing [BACKSPACE] will let you clear any zoom slot. The bottom of the menu
   has an extra option that lets you clear all slots. There is no confirmation
   for anything after you press Enter on this menu, so be careful!

 * Pressing [2ND] + [INS] will let you restore the backed up zoom slots. This
   functionality lets you instantly populate the entire group of zoom slots to
   ones you've predefined - this could be useful if you find yourself using a
   certain window configuration very often.
    - The backup zoom slots matrix is to be located at `ωprgmvrs\zoomsbak`. (The
	  first character is a Greek lowercase omega.)
    - To create a backup matrix, just populate as many zoom slots as you wish,
      copy `ωprgmvrs\zooms` to `ωprgmvrs\zoomsbak`, and archive the `bak` one.
    - Note that your previous zoom (row 10 of the matrix) will also be stored in
      the backup matrix. So, when you restore default zoom slots, even your
      previous zoom will be overwritten with whatever is in row 10 of the backup
	  matrix.
    - This action cannot be undone: restoring the zoom slot backup will
	    overwrite all of your current zoom slots, and the data that was in them
	    before restoration will not be saved.
    - Confirmation for restoring backup zooms will not be requested. Be careful!

NOTE: this program was not explicitly designed to be used with zoom windows with
sizes other than 159x77px, which is the size of the graph screen active region
on TI-89s in full screen graphing mode. It's also not meant to be used in split-
screen modes. However, Quickzoom seems to work mostly fine anyways on different
screen sizes, so it may not be a huge problem.

If you want to use this on a TI-92/Voyage 200, just open the program with the
Program Editor and replace the first two "159"s to your viewing window's width
in pixels, and the first two "77"s to its height in pixels.


III. DATA STORAGE FORMAT

All the zoom slots and the previous zoom window data is stored in a 10x6 matrix,
`zooms`, in a folder called `ωprgmvrs`. It takes up 624 bytes of memory when
fully populated, and 192 bytes when empty. (It shouldn't be archived since it's
modified every time you confirm a new zooming window in Quickzoom, and takes so
little space anyway. The backup matrix, however, should be archived, because it
is assumed that you won't change those often and want them to be available after
a reboot.)

Each column is responsible for storing each of the following data items, in this
order left-to-right: {xmin,xmax,ymin,ymax,xscl,yscl}. Rows 1-9 are each of the
zoom slots. Row 10 is the "last zooming window" slot which is modified every
time a new zoom is confirmed; its window is recalled upon pressing [0].

The backup zoom file uses the exact same format; it's just named differently. As
outlined in II. USAGE, row 10 (and subsequently the behavior of switching to the
last zoom window) does not differ on a backup zooms matrix at all. So, the user
is going to be able to recall into a zoom window that existed before they saved
the backup zooms matrix.


IV. CHANGELOG (LATEST-FIRST)

 * Quickzoom 1.2: modernization, maintenance & cleanup
	- ALL: Remove various off-by-one soft errors
    - CODE: Remove confirmation dialog for restoring backup zooms
	- CODE: Clarify some wording in dialog titles
	- CODE: Improve status bar messages
	- DOC: Mention enhanced slot clearing functionality
	

 * Quickzoom 1.1: add another convenience feature
    - CODE: implement backup zoom restoration
    - CODE: make it impossible to confirm an invalid zooming window
    - DOC: update to reflect backup zoom restoration functionality
    - DOC: miscellaneous touchups

 * Quickzoom 1.0: first public release, name changed to Quickzoom, implemented
   saving/recalling xscl and yscl alongside normal window coords
    - DOC: create documentation

 * [PRIVATE] grpanner 0.3: added ability to STO/RCL zoom windows

 * [PRIVATE] grpanner 0.2: switched to using graph coordinate system instead of
   pixel-based box drawing

 * [PRIVATE] grpanner 0.1: initial creation, basic (buggy) pixel-based zooming/
   panning implemented
