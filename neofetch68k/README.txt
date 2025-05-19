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

It provides information about the ID # of your calc, the OS version & release
date, the screen resolution, the CPU and its frequency (if applicable),
free/total RAM, free/total Archive space, the number of cycles on the
rechargeable batteries (if applicable), the total number of folders, and the
total number of files/variables.

Due to the unique environment of the TI-68k platform, however, some things are a
little different from what you'd find on a typical Neofetch. There's no mention
of a kernel, installed packages, a shell, a WM, a terminal, nor a DE; however it
does mention how many total folders and variables you have present. Also the
platform logo is a 2bpp bitmap instead of a multicolor ASCII artwork.

I've developed this on a TI-89 Titanium and I cannot guarantee that it will work
flawlessly on every other platform such as V200 or TI-92.

Overall this is a great piece of semi-novelty software that provides both form
and function.


I. INSTALLATION

Send neofetch.89p to your calculator. It can be stored anywhere and should be
archived.

Then send the following dependencies from the "_deps" folder:
 * Send "ti0.89i" and "ti1.89i". They should be located in the `rsrc` folder
   on-calc, and should be archived. They're bitmaps that'll be used to display
   the TI logo, as any proper Neofetch clone displays its platform logo.
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


III. CODE MESSINESS

The code for neofetch68k is quite ugly. It was out of my control, however,
because of the limitations of Flib and AMS - I had to fit all the GUI code into
a single line, a single Flib call.



