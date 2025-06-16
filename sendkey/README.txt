/*** sendkey 1.0.1 ************************************************************\
 * Author:         twisted_nematic57                                          *
 * Special Thanks: Samuel Stearley (samuel@stearley.org) and Zeroko           *
 * Date:           06/16/2025 [MM-DD-YYYY]                                    *
 * License:        Public Domain (unless if otherwise stated)                 *
 * Product Type:   Hybrid BASIC/ASM program                                   *
 * Platform:       All TI-68k calculators (?)                                 *
\******************************************************************************/

sendkey is a program that lets you send arbitrary keypress events to the AMS
interface from within your BASIC programs. It is incredibly versatile in the way
that it can literally do anything with non-menu, non-dialog UI elements in the
AMS.

As a bonus, this package also includes the freeware program "sendstr" by Samuel
Stearley. It lets you send entire strings of input at a time instead of
individual keypresses. Its filename is "sendstr.89z", and its original README is
"stearley.txt". For legal reasons, it *also* includes clrhm, which clears the
Home Screen.

You could make a program that copies the entire Home Screen history, including
answers, into a plaintext file; you could make a program that automates the
pasting of an expression from EQW into the Y= editor; the list of possible
applications goes on. As long as the UI you're trying to interact with doesn't
involve a menu/popup or dialog, it will work.

TL;DR: `sendkey` lets you simulate key presses on your TI-68k calc using BASIC.
You pass it a keycode and it sends it to the OS. Works great with non-menu,
non-dialog UI. Use `sendkeyh` if you hate dependencies and love torture. Also
use sendstr to send entire strings instead of just individual keypresses.


I. REQUIREMENTS

All dependencies are located in the "_deps" folder.

Please have baseconv from MathTools installed in your `mathtool` folder on-calc.
It is used to do dec->hex base conversions for the keycodes. The MathTools
package is included with sendkey because its license allows verbatim
distribution - grab it from _deps/mathtools.zip if it's not already on your
calc.

Also keep padstr in your `misc` folder. It's used to pad the hexadecimal number
to 4 digits if it can be represented with <4 digits, because machine code is
really picky. This is also included in the "_deps" folder.

If you want to use a version of the program that has no dependencies, then use
sendkeyh. It takes a string argument containing a capitalized 4-digit
hexadecimal number that is your desired keycode. Otherwise it works the same as
the normal version. (Warning: It's easier to screw up your calc with this
version. Be sure to validate your input before passing it to sendkeyh.)


II. USAGE

(The information below is for sendkey; the information just above this is for
sendkeyh.)

The syntax is:
  sendkey(int)
Where 0<int<=65535, and is a valid ASM keycode. The keycode will be sent in a
CM_KEY_PRESS event (0x710), and will be processed by the AMS accordingly.

Again, for some strange reason, the AMS doesn't react to this event when a menu,
popup, or dialog is active. I don't know why, and if you think you can fix this
issue then feel free to email me at:
  `twisted.nematic57 [at] [Google's mail service].com`.

DISCLAIMER: The author(s) of this program do not claim responsibility for any
damages that may arise as the result of the transmission, execution, archival,
or compression of this program. It has not caused any damage to any of the
calculators it's been tested on, but do not blame us if you suffer from any
issues. You have been warned.


III. THE DEVELOPMENT PROCESS

Many thanks to Samuel Stearley for his "sendString" project. It contains a bonus
program, "moveleft", that was used as the base of this tool. Basically, it was
hardcoded to send a left arrow keypress to the OS. Surely I could figure out a
way to extend it to press any key, it couldn't possibly be that hard...

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


IV. LICENSING

sendkey's functionality was largely made possible by the work of Samuel Stearley
(samuel@stearley.org, or @Nyall on cemetech.net). This package includes Samuel's
sendstr program, at _deps/sendstr.89z, which is 100% unmodified and is licensed
as freeware - freely distribute, do not modify. The same goes for clrhm. This
package also includes a version of moveleft, another one of Samuel's programs,
that's embedded in the source code of sendkey and sendkeyh. I got special
permission to do whatever I want with that embedded code as per this reply:
  https://www.cemetech.net/forum/viewtopic.php?p=311665#311665

Every piece of software in this package, except sendstr, clrhm, and MathTools,
is under the public domain.

sendstr is unmodified, has its source included under "asm_src/", and is
freeware. Do not modify, only use and distribute. Same for clrhm.

MathTools has a license of "distribute verbatim (mostly), get permission for
anything else." See the last page of MathTools.pdf inside "_deps/mathtools.zip"
for more licensing info for MathTools.
