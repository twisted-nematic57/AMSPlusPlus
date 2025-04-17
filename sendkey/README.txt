/*** sendkey 1.0 **************************************************************\
 * Author:         twisted_nematic57                                          *
 * Special Thanks: Samuel Stearley (sstear70@calvin.edu) and Zeroko           *
 * Date:           04/16/2025 [MM-DD-YYYY]                                    *
 * License:        Public Domain (unless if otherwise stated)                 *
 *                   - Legal gray areas addressed in IV. LEGAL GRAY AREA      *
 *                   - Final summary in V. LICENSING SUMMARY                  *
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

sendkey's functionality was largely made possible by the work of Samuel
Stearley, who licensed his work as freeware, which led to a very strange legal
gray area. Please see IV. LEGAL GRAY AREA for more information. The author of
this program does not have the intention of stealing Samuel's work at all.

This package also includes Samuel's sendstr program, which is 100% unmodified
and is licensed as freeware (freely distribute; do not modify).

TL;DR: `sendkey` lets you simulate key presses on your TI-68k calc using BASIC.
You pass it a keycode and it sends it to the OS. Works great with non-menu,
non-dialog UI. Use `sendkeyh` if you hate dependencies and love torture. Also
use sendstr to send entire strings instead of just individual keypresses.



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
(Warning: It's easier to screw up your calc with this version. Be sure to
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

DISCLAIMER: The author(s) of this program do not claim responsibility for any
damages that may arise as the result of the transmission, execution, archival,
or compression of this program. It has not caused any damage to any of the
calculators it's been tested on, but do not blame us if you suffer from any
issues. You have been warned.


III. THE DEVELOPMENT PROCESS

Many thanks to Samuel Stearley for his "sendString" project. It contains an
included utility, "moveleft", that was used as the base of this tool. Basically,
it was hardcoded to send a left arrow keypress to the OS. Surely I could figure
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


IV. LEGAL GRAY AREA

Samuel Stearley put this text under the label "Legal Stuff" in the readme for
sendstr, which also had the moveleft program bundled with it:
"This program is freeware so Samuel Stearley is not responsible or liable for
anything that might happen from the use of this program. Because it is a program
to enhance basic programs it is freely distributable."

He declares that sendstr is freeware and is freely distributable, but does not
say that it may be modified. I distribute a completely unmodified version of
sendstr with this package, so we can safely just focus on moveleft. If you read
the legal text again closely, you'll see that Samuel doesn't mention moveleft at
all - he only talks about sendstr, as indicated by the use of "this program" and
"it" instead of "these programs" and "they". You can see the entire readme in
"stearley.txt" for more context if you wish to see it.

I will be defending my use of moveleft and will be arguing in favor of the
legality of my incorporation of moveleft into sendkey, aka my program.

The way that moveleft works is rather trivial - it sets up an event structure to
send to the OS and sets its type as "CM_KEY_PRESS", which is a completely
standard, simple, and extremely common type of event, as detailed by the GCC4TI
documentation:
https://debrouxl.github.io/gcc4ti/events.html#EventIDs
With this in consideration, taking another look at the source code, it's clear
that moveleft does not explicitly incorporate some sort of copyrightable,
creative, non-bog-standard way of emulating a key press. It simply hardcodes the
event structure necessary to send a keypress, specifies that the event should be
sent to the currently active app, and jumps to an OS function that handles the
event sending. That's it.

In short, moveleft is functionally perfect and can't be modified in a way that
would keep its functionality the same while assembling it off a noticeably
different codebase. It's impossible.

moveleft is not patented and is too simple and lacking creativity to be
copyrightable. Therefore, it is public domain and *cannot* be copyrighted due to
the basic requirement that it should be minimally creative, which it's not.

Besides, in the calculator programming community there is only so much example
code, and, well... a little machine code funnybusiness is bound to happen from
time to time.


V. LICENSING SUMMARY

Every piece of software in this package, except sendstr and MathTools, is under
the public domain.

sendstr is unmodified, has its source included under "asm_src/", and is
freeware. Do not modify, only use and distribute.

MathTools has a license of "distribute verbatim (mostly), get permission for
anything else." See MathTools.pdf inside "_dependencies/mathtools.zip" for more
info.
