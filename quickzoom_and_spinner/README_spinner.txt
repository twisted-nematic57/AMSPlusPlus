/*** Spinner 1.0 **************************************************************\
 * Author:         twisted_nematic57                                          *
 * Date:           05/17/2025 [MM-DD-YYYY]                                    *
 * License:        Public Domain (unless otherwise stated)                    *
 * Product Type:   Hybrid BASIC/ASM program                                   *
 * Platform:       TI-89 Titanium - can be ported to other Motorola 68000     *
 *                 based TI calculators with ease.                            *
\******************************************************************************/

Spinner is 


I. INSTALLATION

Send spinner.89p to your calculator. Keep it in any folder and archived.

Then send sendstr.89z and statline.89z from the "_deps" directory. They should
both be in the `misc` folder on-calc, and should be archived since there's no
reason for them not to be.

 * sendstr is a program by Samuel Stearley (sstear70@calvin.edu;
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


II. USAGE

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


III. CHANGELOG (LATEST-FIRST)

 * Spinner 1.0: initial release, basic panning features implemented
