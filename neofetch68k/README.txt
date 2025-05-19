/*** neofetch68k 1.0 **********************************************************\
 * Author:         twisted_nematic57                                          *
 * Date:           05/18/2025 [MM-DD-YYYY]                                    *
 * License:        Public Domain                                              *
 * Product Type:   Hybrid BASIC/ASM program                                   *
 * Platform:       Works on TI-89 Titanium; may be compatible with other      *
 *                 Motorola 68000-based TI calculators                        *
\******************************************************************************/

neofetch68k is a Neofetch clone for TI calculators that run the Advanced
Mathematics Software OS.

It provides information about:
 * The calculator's unique ID;
 * The OS version & release date;
 * The screen resolution;
 * The CPU & frequency (if applicable);
 * Free/total RAM;
 * Free/total Archive space;
 * The number of cycles on the rechargeable batteries (if applicable);
 * The total number of folders in the AMS "filesystem";
 * The total number of variables/files in the "filesystem" across all folders.

Due to the unique environment of the TI-68k platform, however, some things are a
little different from what you'd find on a typical Neofetch. There's no mention
of a kernel, installed packages, a shell, a WM, a terminal, nor a DE; however it
does mention how many total folders and variables you have present. Also the
platform logo is a 2bpp bitmap instead of a multicolor ASCII artwork.

I've developed this on a TI-89 Titanium and I cannot guarantee that it will work
flawlessly on every other platform such as V200 or TI-92. The GUI layout in
particular will not look spectacular on the larger screens of those calcs.

Overall this is a semi-novelty tool that balances aesthetics with useful system
information.


I. INSTALLATION

Send neofetch.89p to your calculator. It can be stored anywhere and should be
archived.

Then send the following dependencies from the "_deps" folder:
 * Send ti0.89i and ti1.89i. They should be located in the `rsrc` folder
   on-calc, and should be archived. They're bitmaps that'll be used to display
   the TI logo, as is customary for Neofetch clones.
 * Send statline.89z. This is a public domain C program that handles status line
   manipulation. https://www.cemetech.net/downloads/files/2600/x3320

There's another dependency you'll have to download yourself, called Flib 3.2:
https://www.ticalc.org/pub/89/asm/libs/flib.zip
If the file is no longer available please email me at:
twisted.nematic57 {at} {Google's mail service}.com and I will send it to you. I
didn't include it with this package because then I'd have to make it
GPL-licensed, which I think is a bit overkill for a simple calculator program.
 * Both of the Flib binaries (ending in ".89z") should be in the `misc` folder
   on-calc and should be archived.


II. USAGE

Just launch the program from the home screen. I have it in my `misc` folder, so
I launch it with `misc\neofetch()`. You can also call it from within another
program, of course.

NOTE: The Archive memory indicator ("Arc.") shows *archive* space statistics,
not *flash* space stats in general. I.e., The figures do not include space taken
up by FlashApps or the OS itself. This is due to limitations in the `getConfg()`
function which is built into AMS BASIC.


III. INTEGRATIONS

Two of my other software tools can 'integrate' into neofetch68k's stats display.

 * CPU Frequency: If you measure your CPU's frequency with ti68k-clkfreq and
   leave the frequency in MHz in the variable `clk` (which that program does
   automatically), neofetch68k will show your m68k's frequency next to the
   "CPU:" indicator.
    - If you don't use this integration, neofetch68k will assume you're on a
      regular TI-89 Titanium and will assume a frequency of ~12.5 MHz.
    - If you don't already have it, grab this integration from:
      https://www.cemetech.net/downloads/files/2595/x3389

 * Battery Cycles: If you keep track of the number of cycles your rechargeable
   batteries have gone through with Battery Cycle Tracker (or if you use it to
   keep track of the number of disposable batteries you've gone through),
   neofetch68k will display the number of cycles next to the "Battery Cycles:"
   indicator. This data is stored by Battery Cycle Tracker in a list of strings
   at `mem\batt`, and `dim(mem\batt)` = the # of cycles.
    - If you don't use this integration, neofetch68k will just show "N/A" next
      to the "Battery Cycles:" indicator.
    - If you don't already have it, grab this integration from:
      https://www.cemetech.net/downloads/files/2654/x3431


IV. CODE MESSINESS

Half of the code for neofetch68k is quite ugly. In my defense, it was out of my
control because of the limitations imposed by Flib and AMS - I had to fit all
the GUI code into a single line, a single Flib call. Of course it's ugly.

See "_computer_readable/README_neofetch.txt" for more info about that.


V. CHANGELOG (LATEST-FIRST)

 * neofetch68k 1.0: initial release, two integrations implemented
