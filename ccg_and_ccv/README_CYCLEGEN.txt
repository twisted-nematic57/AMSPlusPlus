/*** CycleGen 2.1 *************************************************************\
 * Author:         twisted_nematic57                                          *
 * Special Thanks: Zeroko and Cemetech(.net)                                  *
 * Date:           04/18/2025 [MM-DD-YYYY]                                    *
 * License:        Public Domain :)                                           *
 * Product Type:   BASIC program                                              *
 * Platform:       TI-89 Titanium - can be ported to other Motorola 68000     *
                   based TI calculators with ease.                            *
\******************************************************************************/

CycleGen is a program for the TI-89 Titanium that can generate monochrome
animations of graphs. It's a great way to visualize how changing variables
dynamically affects graphs of functions, sort of like how you can use a slider
on Desmos to change a value and see the graph change with it.

Since the program is a ready-to-go script that can be modified just as flexibly
as any other TI-BASIC program, you can literally do anything within the main
loop that is run in between each frame render. You can do crazy things like
animating the presence of asymptotes by finding limits on each and every frame,
and even pre-rendering 3D graphs so that they may be viewed later with very
smooth framerate and zero stuttering.

A bundled program called CycleView allows you to play back the generated frames
as an animation, and scrub through individual frames. The AMS's built-in
CyclePic command can also be used, but it has some limitations. See
README_CYCLEVIEW.txt for more information and comparisons between CycleView and
CyclePic.

To handle file saving and memory management, all you have to do is set a couple
of flags (or leave the default ones alone) and let the program's internal code
do the rest! Options include changing file/folder names and precise management
of the limited-capacity RAM and limited-write Flash chip. Thanks to new features
in Version 2.0, you can also choose to render as many frames as will fit in
either or both forms of memory.

Error message dialogs are designed to be as user-friendly and descriptive as
possible. In fact, they are not even called errors; instead they are called
Oopsies, since that word is less intimidating to the average person and people
will therefore try with a little more determination to fix their own issues.
(Kids these days, man.) See Section IV for documentation on the various causes
and solutions of each Oopsie situation.

As you may know, TI calculators are not the fastest at graphing, so the typical
run of this program may take a couple of minutes or several hours depending on
various factors like the number of dimensions in the graph, computational
complexity in the main loop, and the number of frames to be rendered.

But even bearing a few computational limitations, I hope you'll find some good
use of this program and discover new things about graphs of functions on the
tried and true TI-68k platform with CycleGen.

 - created and refined with passion.


I. INSTALLATION

All files being referred to in this section are in the "distribution" folder.
For info on how to install and use CycleView, refer to README_CYCLEVIEW.txt.

Send "ccg.89p" to your calculator with your favorite linking software. It should
 be archived.
It will be in its own folder `AAA` so that you can access it quickly from the
 VAR-LINK menu, but it's fine to store it anywhere.

Send "getfree.89f" to your calculator too. It must be in the `misc` folder
 on-calc, and should be archived. It is used to get free memory data.
 https://www.cemetech.net/downloads/files/2634/x3393

Send "statline.89z" to your calculator. It should be in the `misc` folder
 on-calc, and should be archived. It is used to manipulate the status line.
 https://www.cemetech.net/downloads/files/2600/x3320

Send "apdreset.89z" to your calculator. It should be in the `misc` folder
 on-calc, and should be archived. It is used to prevent the calc from sleeping.
 https://www.cemetech.net/downloads/files/2599/x3321


II. PROGRAM FLOW

The program is centered around interpolating a variable between two endpoints
and producing images of graphs at every keyframe.

 * At the start of the script, you define _flags_. Flags change the behavior of
   script by telling it how it should manage memory, format output, etc. You
   also define global variables used in your own calculations.
 * The user-defined "looping code" is a chunk of TI-BASIC code that is executed
   once per cycle before graphing begins. ANYTHING that can be done in a
   standalone BASIC script can be done in this loop, as long as it does not
   modify CycleGen's internal variables. (See line 212 of this document.)
 * After the user-defined looping code is done running, CycleGen makes the
   calculator regenerate the graph and save a screenshot.
 * The screenshots are saved in the format that animation player programs
   expect: a string prefix, followed by an integer that denotes the frame number
   (to signify the screenshot's "place" in the animation).


III. USAGE

 * Make a copy of the `ccg` program. Ensure the copy is not archived.

 * Open the newly copied file with the Program Editor.

 * The script's flag definitions will appear. These are settings that are
   accounted for in the script's internal code to alter its behavior. Modify
   them as needed.

    - `outfldr`: A 1 - 8 character string that specifies the name of the folder
                 that the frames should be saved to. Your global variables will
                 be stored here and looping code will be run in this folder.

    - `varprfx`: A 1 - 5 character string that specifies the prefix of the saved
                 pictures' names. E.g., a `varprfx` of "pic" will cause the
                 output sequence of frames to be named "pic1", "pic2", "pic3",
                 etc.

    - `ovrwprev`: If set to 1, this allows the script to overwrite pre-existing
                  frames, if there are any. If set to 0 and there are frames
                  with names that match the ones that need to be saved, the
                  script will exit with Oopsie #3.

    - `allowarc`: If set to 1, allows the script to write frames to Flash memory
                  if available RAM is insufficient. If set to 0, then the script
                  will never write anything to the Flash memory.
                   - The Flash chip in the TI-89 Titanium is SLC, meaning it
                     should endure at least 100,000 writes to each cell.
                     However, keep in mind that if you tell CycleGen to archive
                     lots of frames very frequently (~a few times daily), your
                     Flash chip could be worn out in a few short years.
                   - Within reason, you should be able to safely set this flag
                     to 1 for tens of thousands of runs; but ALWAYS CONSIDER
                     setting it to 0 if it is feasible to do so.

    - `forcearc`: If set to 1, makes the script write frames to Flash memory
                  regardless of the amount of available RAM. Takes precedence
                  over `allowarc`.
                   - This flag should only be set to 1 when there is very little
                     RAM free, or if it absolutely must be preserved for another
                     use. Remember, Flash memory can wear out from too many
                     writes.

    - `fillmem`: If set to 1, this flag makes the script fill available memory
                 with as many frames as will fit. `allowarc` and `forcearc` are
                 accounted for; therefore this flag can let CycleGen fill up
                 RAM, Flash/Archive, or both.
                  - This flag assumes that all images will have a size of 1547
                    bytes, which is true on the TI-89 Titanium in full-screen
                    mode. This value is hardcoded in the script; it is not
                    designed to be used in split-screen modes, as that would
                    mean a much smaller (<1547 B) picture size.

    - `memthres`: A positive integer (>= 8192) that denotes the minimum amount
                  of RAM, in bytes, that CycleGen must leave free after
                  terminating. As a general rule of thumb, one should have at
                  least 8192 bytes free to avoid running out of memory when
                  saving frames or calculating points on the graph(s).
                   - Keep in mind that generated frames are always saved to RAM
                     first, and then they're archived if needed. This is just
                     due to limitations in the calculator's OS - you can't save
                     a picture directly to Flash without having it in RAM first.
                   - Because the CycleGen program takes up some RAM on its own
                     while executing, there will be ~4 KB + `memthres` RAM left
                     free in practice after it terminates. During execution,
                     though, the amount of free RAM may have been getting close
                     to `memthres`.

    - `arcthres`: Basically `memthres` but for Archive/Flash space, with one
                  exception: this flag is ignored when `fillmem` is set to 0.

    - `maxsteps`: A positive integer between 1 and 999 that signifies the number
                  of frames CycleGen should generate.
                  - If `fillmem` is set to 1, this flag has no effect as it is
                    automatically calculated later.
                  - If you somehow manage to have so much free memory that the
                    `fillmem` handling code determines you can store >999
                    pictures, maxsteps will simply be set back to 999.

 * Below the first block of flag definitions, you'll find settings for the
   `start`, `step`, and `end` flags. These control the behavior of the animation
   variable, which progresses from the starting value to the ending value in
   increments of `step`. Modify them as needed.
    - `start`: A number that is the starting value for the animation variable.
    - `step`: A number that is the interpolation step.
    - `end`: A number that is the ending value of the animation variable.

    - You may leave ONE of the above flags undefined by commenting out the line
      it was defined on, and CycleGen will automatically calculate the missing
      piece.
    - It is YOUR job to increment/decrement/whatever the animation variable in
      your looping code. So for example if I was coding the animation of a graph
      as variable `q` varied from 1 to 10, the first thing I'd do in my looping
      code is `q+step→q" to increment it first. Actually displaying the graph
      (`DispG`) is taken care of by the internals.
    - The above flags are there only to make the script easier to use for you.
      You still have the freedom to manipulate your own variables however you
      like in your looping code. (See line 212 of this document to get to know
      the few variable-related restrictions you have.)
    - The animation variable on the first frame should equal `start` + `step`
      (but not `start` itself) because incrementation always occurs before
      graphing. However, it should equal `end` at the last frame.

 * A couple of lines below the small chunk of code under the flag definitions,
   you will find an area where you can define your global variables.
    - The global variables defined here will be stored and operated on in the
      dedicated folder you specified with the `outfldr` flag. That is, the
      currently active folder will have been switched to `#(outfldr)` here.
    - The block of code in which you're supposed to define global variables is
      only run once: at the start of the script.
    - Just like the looping code, this is a regular block of TI-BASIC. You can
      change graphing behavior, set modes, define equations to be graphed,
      change visual styles, etc.

 * A few lines below the global variable definition area, you will find a
   comment that says "Looping code goes here". Under that comment and before the
   next chunk of code, you can place arbitrary TI-BASIC code that will be run on
   each cycle.
    - Do not modify the variables `mem`, `maxsteps`, `recur`, `varprfx`,
      `memthres`, `allowarc`, `forcearc`, or `err`.
       ~ If any of the above are modified, the program may behave erratically.
         It can result in anything from weird-looking output to crashes.
         However, no serious damage should occur to the calculator's OS or
         filesystem.
       ~ Maybe, just maybe if you've read the source code of the internals and
         fully know what you're doing, you could ignore this and do something
         out of the box...

 * Go back to the Home Screen and execute the modified version of CycleGen you
   just closed. CycleGen will take a second to fully initialize, and promptly
   begin rendering cycles.
    - The status bar will contain information about the number of frames that
      have already been generated out of how many it will generate in total.

 * After CycleGen has finished generating frames, the calculator will return to
   the Home Screen.

 * To view the rendered frames as an animation, refer to README_CYCLEVIEW.txt
   for information on how to use CycleView or consult the TI-89 Titanium User
   Manual for documentation on the CyclePic instruction.

DISCLAIMER: Using the program in ways that deviate from the specification above
may cause unexpected and erratic behavior. No damage should ever occur to your
calculator by using this program, but the author(s) of this program do not claim
liability for ANYTHING should undesirable events occur as a result of the
distribution, storage, compression, or execution of this program.


IV. OOPSIE DOCUMENTATION

Oopsies are displayed in dialogs that detail what went wrong, and include an
error number. All possible errors are listed below.

Each cause/fix pair is matched by numbering. For Oopsies that only have one
reasonable cause, there may be multiple independent fixes, and vice versa.

 * #1 and #5: Not enough RAM is free in the system.
    - CAUSE: 1) you may have too many variables unarchived; 2) too many Flash
             applications installed; 3) something may have sprung a memory leak.
    - FIX: 1) Archive some variables; 2) uninstall some Flash applications; 3)
           reset the calculator's RAM after archiving the script.

 * #2: `maxsteps` flag is <= 1.
    - CAUSE: 1) you manually set it too low; 2) there was not enough RAM or
             Flash space to store more than 1 frame.
    - FIX: 1) manually set the variable to a higher value; 2) free up some RAM
           and/or Flash space, depending on the values of `allowarc`/`forcearc`.

 * #3: newly generated frames cannot be saved due to a variable name clash.
    - CAUSE: some variables under the exact same name and folder already exist
             in the calculator's filesystem, and `ovrwprev`=0, disallowing the
             script from removing them.
    - FIX: manually delete the old variables OR change `varprfx` OR change
           `outfldr` OR set `ovrwprev` to 1.

 * #4 and #6: a frame could not be archived.
    - CAUSE: 1) there is not enough Flash space to save the frame; 2) the
             calculator's batteries are too low to complete a Flash write.
    - FIX: 1) free up some Flash space; 2) replace or charge the batteries.


V. CHANGELOG (LATEST-FIRST)

 * CycleGen 2.1: Bugfixes + intuitiveness bump
    - CODE: make it possible to leave `maxsteps` undefined if `fillmem`=1
    - CODE: outsource free memory detection routine to external program; reduces
            code duplication in case other programs use this functionality
    - CODE: handle edge case where if the user has >1.5 MB to store frames and
            maxsteps is being auto-calc'd, prevent it from going >999
    - CODE: ClrDraw before starting in case CycleView was used and not cleared
            before (this can happen commonly apparently)
    - CODE: ensure that the calc NEVER goes to sleep while rendering frames
    - CODE: use statline instead of flib for status line messages
             ~ yippee, this can finally be non-GPL and a little bit faster
    - CODE: remove local definitions of unused variables
    - DOC: minor insignificant formatting changes
    - DOC: clarify some wording and features
    - MISC: instead of plaintext source, provide well-formatted PDF source

 * CycleGen 2.0: Can take full advantage of all available memory; More
                 case-specific messages in status bar after imperfect
                 termination; Bundles CycleView
    - CODE: add fillmem flag, add code to handle it
    - CODE: introduce arcthres flag
       ~ does not have an effect when fillmem=0, it's just illogical
    - CODE: add error-specific messages to status bar after imperfect (not
            normal) exit
    - CODE/DOC: fix issue showing recommended free RAM values to be 1024x their
                true size
    - DOC: reword some phrases for more clarity
    - DOC: remove examples, too tedious
    - MISC: add plaintext form of source code for curious people without TI-89Ts
            or emulators

 * CycleGen 1.1: Bugfixes
    - CODE [#1]: Rework the core `for(` loop to work on internally defined
                 integers instead of user-defined floats.
    - DOC: Revise formatting and informational errors in documentation (mostly
           relating to the header and `memthres` flag's behavior)
    - DOC: Add more info about `start`,`step`,`end` flags and clarify their
           behavior
    - CODE: Automatically delete `start`,`step`,`end` flags upon initialization
            (fixes issues with re-runs after incomplete runs)

 * CycleGen 1.0: Initial release