/*** sendkey 1.0 **************************************************************\
 * Author:         twisted_nematic57                                          *
 * Special Thanks: Samuel Stearley (sstear70@calvin.edu) and Zeroko           *
 * Date:           04/16/2025 [MM-DD-YYYY]                                    *
 * License:        Public Domain                                              *
 * Product Type:   Hybrid BASIC/ASM program                                   *
 * Platform:       All TI-68k calculators (?)                                 *
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


I. REQUIREMENTS

All dependencies are located in the "_dependencies" folder.

Please have baseconv from MathTools installed in your `mathtool` folder. It is
used to do dec->hex base conversions for the keycodes. The MathTools package is
included with sendkey because its license allows verbatim distribution - grab it
from there if it's not already on your calc.

Also keep padstr in your `misc` folder. It's used to pad the hexadecimal number
to 4 digits if it can be represented with <4 digits, because machine code is
really picky. This is also included in the "_dependencies" folder.

If you want to use a version of the program that has no dependencies, then use
sendkeyh. It takes a string argument containing a capitalized hexadecimal number
that is your desired keycode. Otherwise it works the same as the normal version.
(Warning: It's easer to screw up your calc with this version. Be sure to
validate your input before passing it to sendkeyh.)


II. USAGE

(The information below is for sendkey; the information just above this is for
sendkeyh.)

The syntax is:
  sendkey(int)
Where 0<int<=65535, and is a valid ASM keycode. The keycode will be sent in a
CM_KEY_PRESS event (0x710), and will be processed by the AMS accordingly.

Again, for some strange reason, the AMS doesn't react to this event when a menu,
popup, or dialog is active. I don't know why, and if you think you can fix this
issue then feel free to email me at `twisted.nematic57@gmail.com`.


III. MORE INFORMATION

Many thanks to Samuel Stearley for his "sendString" project. It contains an
included utility, "moveleft", that was used as the base of this tool. Basically,
it was hardcoded to send a left arrow keypress to the OS. Surely I had to figure
out a way to extend it to press any key, it couldn't possibly be that hard...

I am scared of coding my own assembly and possibly screwing up a $160 device, so
I decided to take the weak route and find a way to extend the assembly program
through BASIC. So I took a look at the machine code, stripped it down into
something that could be used as an Exec string (thanks to Zeroko's help), and
located the two bytes where the keycode was stored.

From there on out it was pretty easy - all I had to do was get the hexadecimal
form of the keycode argument passed to the BASIC program, pad it to 4 digits,
and insert it in the part of the Exec string where the keycode is stored. And it
worked.

Theoretically this should work on any TI-68k calculator, but the keycodes for
vastly different models will obviously be different and the slightly differing
RAM across different AMS versions might make sendkey unusable on certain calcs.
I dunno, try it for yourself to be sure.


DISCLAIMER: The author(s) of this program do not claim responsibility for any
damages that may arise as the result of the transmission, execution, archival,
or compression of this program. It has not caused any damage to any of the
calculators it's been tested on, but do not blame us if you suffer from any
issues. You have been warned.
