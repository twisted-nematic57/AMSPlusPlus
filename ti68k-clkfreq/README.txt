/*** ti68k-clkfreq 1.2.1 ******************************************************\
 * Author:         twisted_nematic57                                          *
 * Special Thanks: Gérard P. Michon (http://www.numericana.com)               *
 * Date:           04/16/2025 [MM-DD-YYYY]                                    *
 * License:        Public Domain (except when otherwise stated)               *
 * Product Type:   Hybrid BASIC/ASM program                                   *
 * Platform:       TI-89 Titanium; (maybe) TI Voyage 200                      *
\******************************************************************************/

ti68k-clkfreq does exactly what its name suggests: it measures the clock
frequency of your TI-89 Titanium's CPU. The result, in MHz, is shown in a neat
dialog and stored to a global variable `clk`.

This tool is great for overclockers. The author of this program has overclocked
their TI-89 Titanium's 68K to ~25.0 MHz, and everything is stable, though
battery life is greatly reduced. Please get NiMH rechargeables to be more
environmentally friendly, especially if you'll be overclocking your calcs.

This tool can now measure the CPU's clock frequency using a far more precise
timer than before (0.05s resolution instead of 1s), but that will only work on a
TI-89 Titanium as the more precise timing utility is not available for the
Voyage 200. Also, I do not have a physical Voyage 200, so I cannot say with
complete certainty if this program will function correctly on that or not.

New in Version 1.2: More precise measurement available if MathTools FlashApp is
installed; simplified initial startup dialog

Version 1.2.1 was released because I'm a dumbo who forgot to include
mathtools.zip in release 1.2.


I. INSTALLATION

Send "clkfreq.89p" to your calculator. Store it anywhere you want; it is
recommended to keep it archived.

Also send "statline.89z" or "statline.v2z" depending on which calculator you're
using. (".89z" = TI-89 Titanium, ".v2z" = Voyage 200.) It should be archived in
the `misc` folder. statline is used to display information in the status line.
More about statline: https://www.cemetech.net/downloads/files/2600/x3320

TI-89 Titanium only:
If you'd like to have more precise clock frequency measurements, also send
"cfasm.89z". Make sure it's archived in the `misc` folder on-calc. Then, extract
"mathtools.zip", and send "MATHTOOL.89k" to your calculator if it's not already
installed.
NOTE: "mathtool.zip" is not public domain and is subject to its own licensing
terms detailed in the section "Copyright notice and disclaimer" in MathTools.pdf
located in the archive.

If you really don't want to install the FlashApp for whatever reason then you
can grab the Timing tool individually from:
http://www.technicalc.org/packages/utilities/Timing.htm
and then modify the first line starting with "mathtool" in the BASIC code to
make it use the independent utility to time the execution.


II. AUTOMATION

If you'd like to measure the CPU's clock frequency in one of your own programs,
you an use this one as a dependency. Just set the variable `automeas` in the
current folder to `true`, call the program, and read from `clk` to get a float
that describes the frequency in MHz. (`automeas` will also be deleted after this
program finishes execution.)


III. FURTHER INFORMATION

Thanks to Gérard P. Michon for his short and simple Exec string that does most
of the heavylifting in the program. It's just so simple and easy to use, I
wonder why I didn't come up with it before seeing it on his website. (It just
sets d0 to $34FB5E2, subtracts 1 from it a gazillion times, and exits when d0 =
0.) If you measure the amount of time that takes to finish executing in seconds
(Δt), the frequency of the 68K in MHz is given by the equation (1/Δt)*1000. I do
not fully understand how the equation is derived, but I understand the
principle. I assume the equation also accounts for background interrupts (except
USB ones), since I overclocked my calculator to about twice the original speed,
and everything does happen about twice as fast as it used to.

Due to the blunt simplicity of the bytecode behind this, I have deemed it
uncopyrightable.

"cfasm.89z" is basically a version of the bytecode that's been translated into a
proper independent program. This exists because the mathtool.timing utility
doesn't like Exec strings.

DISCLAIMER: The author(s) of this program do not claim responsibility for any
damages that may arise as the result of the transmission, execution,
compression, or archival of this program. It has not caused any damage to any of
the calculators it's been tested on, but do not blame us if you suffer from any
issues. You have been warned.
