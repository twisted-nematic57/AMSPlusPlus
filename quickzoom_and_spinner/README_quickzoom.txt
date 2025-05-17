/*** Quickzoom 1.0 ************************************************************\
 * Author:         twisted_nematic57                                          *
 * Date:           05/17/2025 [MM-DD-YYYY]                                    *
 * License:        Public Domain                                              *
 * Product Type:   Hybrid BASIC/ASM program                                   *
 * Platform:       TI-89 Titanium - can be ported to other Motorola 68000     *
 *                 based TI calculators with ease.                            *
\******************************************************************************/

Quickzoom is a BASIC program for the TI-89 Titanium that implements a box
zooming/panning mechanism which is much more intuitive than the built-in
ZoomBox/other zooming methods.

The major benefits of using this program over the built-in graphical zooming
methods are:
 * It maintains the aspect ratio of the viewing window;
 * You can edit a zoom box after creating it;
 * You can store and recall zoom windows to 9 independent slots;
 * It does not modify your {xscl,yscl} at all;
 * This program makes it very easy to "pan" your viewing window in any
   direction.


I. INSTALLATION

Send quiczoom.89p to your calculator. Keep it in any folder and archived.

Then send sendstr.89z and statline.89z from the "_deps" directory. They should
both be in the `misc` folder on-calc, and should be archived since there's no
reason for them not to be.

 * sendstr is a program by Samuel Stearley (sstear70@calvin.edu,
   http://www.geocities.com/sstear70/) that enables BASIC programs to send
   arbitrary strings to input boxes in the OS GUI. It is licensed as "freely
   distributable" as per Samuel. Original licensing statement by Samuel:
    > "This program is freeware so Samuel Stearley is not
      responsible or liable for anything that might
      happen from the use of this program.  Because it is
      a program to enhance basic programs it is freely
      distributable."
 * statline is a public domain C program by me that handles manipulation of the
   status line. https://www.cemetech.net/downloads/files/2600/x3320

depends on statline,flib2