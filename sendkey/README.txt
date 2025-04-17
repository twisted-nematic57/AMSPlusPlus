/*** sendkey 1.0 **************************************************************\
 * Author:         twisted_nematic57                                          *
 * Special Thanks: Samuel Stearley (sstear70@calvin.edu)                      *
 * Date:           04/16/2025 [MM-DD-YYYY]                                    *
 * License:        Public Domain                                              *
 * Product Type:   Hybrid BASIC/ASM program                                   *
 * Platform:       All TI-68K calculators (?)                                 *
\******************************************************************************/

sendkey is a program that lets you send arbitrary keypress events to the AMS
interface from within your BASIC programs. It is incredibly versatile in the way
that it can literally do anything with non-menu, non-dialog UI elements in the
AMS.

You could make a program that copies the entire Home Screen history, including
answers, into a plaintext file; you could make a program that automates the
pasting of an expression from EQW into the Y= editor; the list of possible
applications goes on. As long as the UI you're trying to interact with doesn't
involve a menu/popup or dialog, it will work.

If key sending does not work outside of dialogs or popup menus, feel free to
email me at `twisted.nematic57@gmail.com`.


I. REQUIREMENTS

Please have baseconv from MathTools installed in your `mathtool` folder. It is
used to do dec->hex base conversions for the keycodes. The MathTools package is
included with sendkey because its license allows verbatim distribution.



II. USAGE

The syntax is:
  sendkey(int)
Where 0<int<=65535, and is a valid ASM keycode. The keycode will be sent in a
CM_KEY_PRESS event (0x710), and will be processed by the AMS accordingly.

Again, for some strange reason, the AMS doesn't react to this event when a menu,
popup, or dialog is active. I don't know why, and if you think you can fix this
issue then feel free to email me at the address listed earlier in this document.


III. MORE INFORMATION

Many thanks to Samuel Stearley for his "sendString" project. It contains an
included utility, "moveleft", that was used as the base of this tool. Basically,
it was hardcoded to send a left arrow keypress to the OS. I noticed that since
you could basically edit that to be any valid uint16 keycode, I realized that
you could use a bit of string manipulation and base conversion 

