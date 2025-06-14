/*** Battery Cycle Tracker 1.3 ************************************************\
 * Author:         twisted_nematic57                                          *
 * Date:           06/14/2025 [MM-DD-YYYY]                                    *
 * Special Thanks: Val Trubachev (vetruvet@gmail.com)                         *
 * License:        Public Domain (except when otherwise stated)               *
 * Product Type:   BASIC program                                              *
 * Platform:       All Motorola 68000-based TI calculators with RTC features  *
\******************************************************************************/

Battery Cycle Tracker is a tool that lets you easily record and visualize your
calculator's battery consumption over time. It's designed for use with a single
set of rechargeable batteries, but you can also use it with alkalines if you
just want to visualize how often you change batteries.

Also included is a utility that tells you how approximately much voltage is left
in the batteries. The details are a bit complicated, so see III. BATTERY SENSOR
INFORMATION for more info. However, it can still be generally useful to know if
your batteries are on their last legs without needing to pull out a multimeter.

This tool has been very useful to me because I use it to track how many cycles
are on my NiMH cells. However, keep in mind it's not designed to work with
multiple independent packs; I personally only use one pack of four batteries so
I never had a compelling reason to implement support for multiple independent
packs. You can do this if you wish.

I have not tested this on physical TI-92 Plus/V200 units because I do not own
any. I especially cannot guarantee this program will work flawlessly on those
models.

Environmental Notice: If you still use disposable batteries with your TI-68k
calculators, please consider switching over to rechargeable ones. They're better
in basically every noticeable way.


I. INSTALLATION

Send `battcycl.89p` to your calculator. This is the main program.
 This can be stored in any folder on-calc, but `misc` is what I use. Archival is
 recommended.

All of the below should be stored in the `misc` folder on-calc. It's recommended
to keep them archived.

Now go to the "deps" directory. Send the files starting with "dord", "idbd", and
 "padstr". Then, enter the folder that best matches the calculator model you
 have. Then send all files in that folder to your calc.

Information about dependencies:
 - `statline`: Manipulates the status line.
     https://www.cemetech.net/downloads/files/2600/x3320
 - `idbd`: Calculates date differences. Depends on `dord` and `padstr`.
     https://www.cemetech.net/downloads/files/2619/x3361
 - `dord`: Converts ISO dates to ordinal dates.
     https://www.cemetech.net/downloads/files/2616/x3358
 - `padstr`: Pads/truncates strings.
     https://www.cemetech.net/downloads/files/2618/x3360
 - `batteryb`: Returns a general idea of present battery voltage. See section
   III. BATTERY SENSOR INFORMATION for more info.
     https://www.ticalc.org/archives/files/fileinfo/388/38883.html


II. USAGE

It's recommended to map this program to a keyboard shortcut, but you can use it
any way you like.

When you launch the program, it'll show a three-item menu.

 * Record New Cycle: after your batteries are finished charging and you set the
   time and date on your calc, you can use this to record a new cycle into the
   database (a simple list) located at `mem\batt`.
    - You should avoid editing `mem\batt` manually unless you are fixing a
      mistake as a result of recording a cycle before setting your clock.
    - The documentation for the format of `mem\batt` can be found in IV. DATA
      STORAGE FORMAT.
    - Don't attempt using the below options if you haven't recorded a single
      cycle yet.

 * Plot all cycles: This option will plot all battery cycles. This is helpful to
   visualize the long-term rate at which your calc is consuming batteries.
    - The x-axis is in units of days. The first data point's x=0, which is the
      day that you recorded the first cycle. All successive points' x-values are
      the number of days between their recording and the first data point. The
      y-axis is in units of recharge cycles, and each successive data point's
      y-value increases by 1.
    - Press any key except [STO>] to exit. The graph will then be restored to
      the state it was in before you launched the program.
    - If you want to analyze the data a bit more on your own, you can press
      [STO>]. This will make the program save two lists to your `mem` folder
      which were used to create the plot, leave the original graph state saved
      in a GDB `ΦΦΦbak` in the current folder, and exit. The battery cycle plot
      will still be visible. Then you can use F3 (Trace) to examine the data
      points graphically or do something with the numerical data in the `mem`
      folder.

 * Recover graph: This option will recover the state of the graph that was
   present before you used the cycle visualization feature, delete the two lists
   in the `mem` folder, and disable Plot #9, which is used by the program.
    - The variables to be deleted are `mem\xplot`, `mem\yplot`, and `ΦΦΦbak`.
      The plot lists are created when [STO>] is pressed while the program is
      displaying a visualization.
    - Plot #9 is disabled separately as plots are not influenced by nor saved in
      GDBs.


III. BATTERY SENSOR INFORMATION

"batteryb.{89,9x,v2}z" is a program that, when executed, will measure the
batteries' approximate voltage using the built-in voltmeter connected to the
battery terminals and store it in a variable called `battst` in the current
folder. The number will range from 0-7 and indicates the relative current charge
level of the batteries.

There are two main problems:
 * The hardware voltmeter is very poorly documented and I don't know the exact
   voltage ranges that trigger it to fall above or below the thresholds that
   cause the integer reading to change. However, I know for sure that voltages
   >(1.10*4)V will definitely return a 7. By the time your batteries reach 1.10V
   each, it is about time to start worrying about their remaining life, alkaline
   or not.
 * A NiMH battery, the most common chemistry of rechargeable AAA battery, has an
   extremely flat discharge voltage curve (compared to alkalines) that hovers at
   ~1.28-1.22V for most of its usable life. This means that if you get a 6 or
   below from the reading, your NiMH batteries are on their last legs.

Despite these problems, I still included batteryb with this program because I
thought it would be convenient to be able to see your batteries' approximate
voltage without having to pull out a multimeter. It will likely be much more
useful for those using alkaline batteries, but I strongly discourage use of
those due to the environmental and economic concerns of alkaline waste.

Also, permission to use batteryb was given to me specially by the author. See
"deps/batteryb_redistribution_permission.eml" for more info.
 * I, the author of Battery Cycle Tracker, am "welcome to use this program
   [batteryb] as I see fit."
 * Technically the author's response did not grant me redistribution rights.
   However, given that:
    - They had lost the source code;
    - They granted me the right to reverse-engineer the binary;
    - They had entirely forgotten that they had published it in the first place;
    - batteryb does a relatively simple action that nobody can reasonably make
      any money off of;
    - batteryb is written for a platform that has been forgotten by the world; 
   I think it is reasonable to conclude that batteryb can be redistributed by
   me with my program. However I do not think it's legally sound to assume that
   you're allowed to do that too. [I am not a lawyer and none of this is legal
   advice.]


IV. DATA STORAGE FORMAT

The only "file" that's used by the program to store battery cycle data is a list
of strings at `mem\batt`. Each string is formatted as such:
 "MM/DD/YY @ [H]H:MM [AM/PM]"
   - "MM/DD/YY" is the basic date format that the calculator will return from
     the getDtStr(1)` function.
   - "[H]H" is the hou om


V. CHANGELOG

 * Battery Cycle Tracker v1.3: some documentation additions and bug fixes
    - CODE: make getDtStr() always return MM/DD/YY (bugfix for those who use
            different date formats)
    - DOC: add documentation for the format of `mem\batt`

 * Battery Cycle Tracker v1.2.1: sets the status bar's activity indicator to
   "PAUSE" when visualizing cycle data

 * Battery Cycle Tracker v1.2: adds support for visualizing cycle data
    - DOC: create documentation

v1.0 and v1.1 were private versions that never made it off my computer.
