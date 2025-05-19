/*** Spinner 1.0 **************************************************************\
 * Author:         twisted_nematic57                                          *
 * Date:           05/18/2025 [MM-DD-YYYY]                                    *
 * License:        Public Domain (unless otherwise stated)                    *
 * Product Type:   Hybrid BASIC/ASM program                                   *
 * Platform:       TI-89 Titanium - compatibility with other Motorola 68000   *
 *                 based TI calculators possible, not guaranteed.             *
\******************************************************************************/

Spinner is a program that enables you to rotate 3D graphs left or right (on the
θ-axis) without distorting the view. It also lets you type in custom values for
`eyeθ` (the viewing angle around the vertical axis) without having to switch to
the Window Editor.


I. INSTALLATION

Send spinner.89p to your calculator. Keep it in the `misc` folder; it should
also be archived.

Then send sendstr.89z and statline.89z from the "_deps" directory. They should
both be in the `misc` folder on-calc, and should be archived since there's no
reason for them not to be.

 * sendstr is a program by Samuel Stearley (sstear70@calvin.edu;
   http://www.geocities.com/sstear70/) that enables BASIC programs to send
   arbitrary strings to input boxes in the OS GUI. It is licensed as "freely
   distributable" as per Samuel. Original licensing statement:
    > "This program is freeware so Samuel Stearley is not
      responsible or liable for anything that might
      happen from the use of this program.  Because it is
      a program to enhance basic programs it is freely
      distributable."
 * statline is a public domain C program by me that enables BASIC programs to
   manipulate the status line.
   https://www.cemetech.net/downloads/files/2600/x3320


II. USAGE

It's recommended to launch Spinner as a keyboard program. (The included file
`kbdprgm5.89p` integrates Spinner and Quickzoom into one key combination.)

When Spinner is launched, it will switch to the Graph Screen and display the
current `eyeθ` value in the status line.

 * Pressing the [LEFT]/[RIGHT] arrow keys will rotate the graph left/right by 5
   degrees.
    - If one of these keys is held, the graph will be rotated faster, in
      increments of 10 degrees.
    - Pressing [2ND] + [LEFT]/[RIGHT] will rotate the graph in the respective
      direction by 20 degrees.

 * Typing any number or a negative sign will cause a dialog with an input box to
   pop up, and the character you typed will be inserted into the input box. The
   number you enter will be set as the new value for `eyeθ`.

 * Pressing [ESC] or [CLEAR] will exit the program and keep the graph screen
   visible. Pressing [HOME] will exit the program and return to the Home Screen.

NOTE: The calculator is not the fastest at rendering 3D graphs. It is also
impossible to use the double-buffering mechanism that the OS rotation routines
use from pure BASIC, so you will see the graph re-render itself every time you
rotate it.


III. CHANGELOG (LATEST-FIRST)

 * Spinner 1.0: initial release, basic rotation features implemented
    - DOC: create documentation
