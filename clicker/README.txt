/*** Clicker 3.4 **************************************************************\
 * Author:       twisted_nematic57                                            *
 * Date:         04/18/2025 [MM-DD-YYYY]                                      *
 * License:      Public Domain :)                                             *
 * Product Type: BASIC program                                                *
 * Platform:     TI-89 Titanium - can be ported to other Motorola 68000-based *
                                  TI calculators with ease.                   *
\******************************************************************************/

Clicker is a BASIC program that enables you to perform repetitive calculations
on your TI-89 Titanium much quicker than you can on the Home Screen. You can
even store and later access intermediate calculation results just as you'd be
able to do on the real Home Screen. It only has one C subprogram dependency.

It works on the basis of performing _iterations_: a user-defined operation works
on a user-defined starting value. Then, the output of the operation is used as
input for the next iteration.

The program works flawlessly on negative and complex numbers. It can operate on
entire lists or matrices. It can also be automated, running many iterations
internally. It has been tested on many hundreds of inputs, and produces expected
results every single time.

In summary, this program is one of the only and best dedicated recursive
function executors for the TI-89 Titanium. It is a stair step towards putting
your TI-89 Titanium right up there with Mathematica and MATLAB. As always, it's
up to you to harness its full potential.

  - created and refined with passion.


I. QUICK START

1. Install:
    - Transfer `clicker.89p`, `padstr.89f`, and `statline.89z` to your
      calculator. `statline` and `padstr` should be in the `misc` folder
      on-calc, but clicker can be anywhere.
    - Archive all of them for safety (optional but recommended).
2. Run:
    - On the Home Screen, type:
        `clicker(x,"operation","listname",auto_execute)`
        Example: `clicker(0,"x+1",0,0)`
    - Press [ENTER] to iterate (count up from 0 in steps of 1), and [CLEAR] or
      [HOME] to quit the program.
3. Results:
    - The last iteration's result is returned on the Home Screen when the
      program is terminated. A list of all iteration results is not created. No
      iterations are automatically computed.
    - For troubleshooting, ensure all inputs are properly formatted and make
      mathematical sense.

The sections below will take you through a more detailed, thorough explanation
of the program and its behavior.


II. INSTALLATION

Send `clicker.89p` to your calculator.
 It will be in its own folder "AAA" for quick access, but you can put it
   anywhere you like. It is folder-agnostic and can be called from anywhere.
 Keep it archived, there's no reason not to.

Send `padstr.89f` to your calculator.
 It *MUST* be stored in the `misc` folder. Keep it archived.
 Its job is to pad strings.
 https://www.cemetech.net/downloads/files/2618/x3360

Send `statline.89z` to your calculator.
 It *MUST* be stored in the `misc` folder. Keep it archived.
 Its job is to enable manipulation of the status line from BASIC.
 https://www.cemetech.net/downloads/files/2600/x3320


III. DETAILS

 * Clicker works by executing an operation using a starting value as initial
   input. Each time you "click" the [ENTER] key it performs a step.
    - Think of the operation as a function of `x`. `op(x)` = {your operation}
    - When you press [ENTER], your starting value is plugged into `op(x)`. The
      result is then stored to `x`, and displayed on the screen.
    - As you keep pressing [ENTER], `op(x)` will be executed and its result
      stored to `x`, over and over again. It's essentially recursively executing
      the operation with its own previous output every time you press [ENTER].

 * You may press [CLEAR] or [HOME] to exit the program and go back to the Home
   Screen at any time, except when Clicker is automatically executing iterations
   on its own.

 * Clicker will store your calculation history to a list or sequence of
   variables of your choice, if you tell it to do so.
    - Iteration numbers are 1-indexed both when saving to a list and to a series
      of variables.
    - Even if no data is to be saved to a list or sequence of variables, the
      last iteration's result is always stored to a variable `lastclic` for
      your convenience.

 * If any issues happen during execution of the program, the calculator's
   operating system will catch them and the program will stop.
    - If there is an error during calculation, then it is highly likely that the
      issue lies in your input. If you are positive that it's an issue in the
      program, feel free to reach out to the author: twisted.nematic57@gmail.com


IV. USAGE

 * At the Home Screen, invoke Clicker with 4 arguments, in this order:

    - `x`: An expression that will be initially plugged into op(x). Can be
           any kind of number (positive, negative, complex, etc.), or a
           matrix/list.

    - `op`: A string containing any function of `x`.
             ~ Other variables may be included in the function. If they are not
               defined beforehand, they will be treated as algebraic expressions
               just as they would on the Home Screen.
             ~ You can chain commands using the `:` character! You can issue
               almost any sequence of regular BASIC commands before including
               your equation. The only requirements are that the last command in
               the string must be the recursive function, and it must not end
               with a store (->) operation.

    - `calclist`: A string containing the name of the list that the calculation
                  history should be stored to upon exit.
                   ~ If set to 0 or an empty string (`""`), only the last result
                     of the final iteration is stored to a variable named
                     `lastclic` in the current folder. Every iteration result
                     that is computed before will be discarded.
                   ~ The list's name must not start with a number, it must not
                     contain a space character, and its length must be between 1
                     and 8.
                   ~ Recording data to a list can be especially slow after
                     a couple dozen iterations. Do not use this feature in
                     performance-critical scenarios.
                      ~ Due to the inherent loss of performance caused by the
                        list-building routines, there is a QoL feature only
                        active in list-saving mode that displays the current
                        iteration number in the status line. This feature was
                        technically too slow to implement in non-list-saving
                        mode, but it really didn't hurt this one where
                        operations are already slower than instantaneous.
                   ~ If `x` or `op` contains a list or matrix in itself, the
                     calculation history cannot be stored to a list. Instead, it
                     will be stored to a series of variables with a prefix
                     matching the first 4 characters of the `calclist` string
                     followed by a fixed-length, 4-digit, base-10 integer
                     denoting the iteration number.
                      ~ For example, assuming `x` or `op` contain lists within
                        themselves, and `calclist` is set to "history", then the
                        result of the first iteration will be stored to
                        `clkrvars\hist0001`, the second to `clkrvars\hist0002`,
                        etc. Each of these variables are of the list data type,
                        since `x` or `op` cannot be represented with another
                        type.
                      ~ If the calculator runs out of RAM while doing
                        iterations when saving to individual variables, the
                        program will not catch this error and you will need to
                        terminate it by pressing the [ON] key. However, if you
                        archive the old iterations, set your `x` to the result
                        of the last iteration, and change some part of
                        `calclist`, you could essentially continue from where
                        you left when RAM ran out.

    - `autoexec`: A real integer >= 0 that denotes how many iterations the
                  program should do immediately after starting. If this is > 0,
                  then there will be no opportunity to interact with the program
                  during execution, and it will exit as soon as all iterations
                  have been computed.
                   ~ If `autoexec`>0, you can only forcibly quit the program by
                     pressing [ON].
                   ~ If the program is supposed to save intermediate results to
                     a list, it will respect that and act accordingly. If not,
                     then only the last result will be saved to `lastclic`, as
                     usual.

 * The calc will switch to the PrgmIO screen and display "Ready.", and tell you
   about what kind of data it will store upon termination. Now, whenever you
   press [ENTER], the current value of `x` will be plugged into the operation
   you specified, and its result will be stored back to `x`.
   
 * Upon pressing [CLEAR] or [HOME], the program will return to the Home Screen,
   manage the storage of computed data if requested, and terminate.

DISCLAIMER: Using the program in ways that deviate from the specification above
may cause unexpected and erratic behavior. No damage should ever occur to your
calculator by using this program, but the author(s) of this program do not claim
liability for ANYTHING should undesirable events occur as a result of the
distribution, storage, compression, or execution of this program.


V. EXAMPLES

1. clicker(0,"x+1",0,0)
The first press of [ENTER] will display a 1. Pressing it repeatedly will count
upwards. The calculation history will be discarded upon program termination.

2. clicker(2,"x^2","pow2",0)
The first press of [ENTER] will display a 4. Pressing it repeatedly will display
successively larger powers of 2. The calculation history will be stored to a
list named `pow2`.

3. clicker(0,"x^2+c","mandel",0)
Repeatedly pressing [ENTER] will quickly reveal if the complex number in `c` is
part of the Mandelbrot Set. Calculation history will be stored to a list named
`mandel`.

4. clicker({2/3,3,5,7},"root(x,3)","cbrts",0)
Recursively gets the cube roots of 2/3, 3, 5, and 7; stores the results of each
iteration to a series of variables in the folder "clkrvars". The resulting
individual list variables will contain multiple outputs (a list), since the
input has multiple inputs in the form of a list.

5. clicker([[5,3][8,2]],"x^4","mat",0)
Gets the 4th power of the matrix, and stores the results of each iteration to a
series of variables in the folder "clkrvars". Again, each iteration is stored as
its own variable of the matrix type.

6. clicker(0,"x^2+c","mandel2",50)
An automated version of Example 3. Instead of you having to manually keep
stimulating progress in finding out if `c` is part of the Mandelbrot Set or not,
this version will automatically do 50 iterations and store the calculation
results to `mandel2`. If the last number in that list is gigantic, infinity, or
undefined, then `c` is not part of the set.


VI. CHANGELOG (LATEST-FIRST)

 * Clicker 3.4: Changed license to public domain, speed improvements, minor code
                deduplication, migrate away from Flib
    - CODE: use statline instead of flib for status line messages
    - CODE: use padstr for string padding, simplify some internals
    - LEGAL: Change license to public domain
    - DOC: minor insignificant formatting changes
    - DOC: clarify some wording and features

 * Clicker 3.3: Removes unnecessary flib calls, optimizes list saving routine
    - CODE: remove stray flib calls that have no noticeable effect
    - CODE: stop using `augment(` for list appending - it's slow because it
            returns an entire list, whereas just storing the next element in the
            next slot is much faster and modifies the original list directly
    - CODE: change keycode hint formatting in comments
    - DOC: change wording in §IV. USAGE.
    - MISC: stop providing plaintext source, instead provide a PDF because it
            has syntax highlighting

 * Clicker 3.2: Removes input validation, removes false showings of the "PAUSE"
                indicator in the status bar, clarify which mode the program is
                in at launch, replace separate triple dots with one logical
                triple-dot character, increase performance, decrease memory
                consumption, map [HOME] to [CLEAR], fix list-compatibility
                checking bug.
    - CODE: revise main while loop, change from while active=1 to while true:
            considerably increases performance?
       ~ also no need to store active variable, possible memory optimization
    - CODE: remove unnecessary recursive variable resetting lines
    - CODE: fix list-compatibility checking bug
       ~ When commands are chained, the old method would assume the results
         wouldn't stay in a list even though they actually could. Changed method
         to work around this issue: k serves as a temporary storage for x's
         initial value, then the op is evaluated as-is and x itself is checked
         for list compatibility.
    - CODE: (aesthetic) change distinct triple dots into a single logical
            triple-dot character (chars menu -> 3 -> E instead of just "...")
    - DOC: clarify some operational details (relating to error handling)
    - MISC: add plaintext source for curious people without access to AMS

 * Clicker 3.1: Adds ability to automatically compute a set number of
                iterations; Enables chaining of commands with BASIC syntax;
                Improves built-in documentation accessible via F1 in the Catalog
    - CODE: rename altloop to seqloop for clarity
    - CODE: change expression execution code to support chaining of commands
    - CODE: add ability to execute iterations automatically
    - CODE: change a cryptic variable name to something more understandable
    - CODE: change contents of the first comment to make the F1 help dialog more
            useful
    - DOC: reflect changes in code above
    - DOC: remove screen recording examples
    - DOC: enhance formatting of Examples section

 * Clicker 3.0: Guarantees ability to work with lists and matrices; Takes
                advantage of the status line; Adds input validation; Many
                documentation improvements; Change license to GPLv3
    - CODE: Add descriptive error dialogs to indicate invalid input.
    - CODE: More intuitive handling of error dialog input
    - CODE: Leverage the status bar to display relevant information (requiring
            use of flib)
       ~ Unfortunately BASIC is too slow to show the current iteration number in
         the status line in a performant manner. For this reason it is only
         implemented in the data-recording mode, as that is already slow to
         begin with.
    - CODE/DOC: Guarantee support for calculation involving lists and matrices
    - LEGAL: Change license to GPLv3
    - DOC: Add more information about handling of `op` and `x`
    - DOC: Improve formatting, break up text walls into digestible paragraphs
       ~ Not perfect, but I tried :/
    - DOC: Add a "QUICK START" section for newbies
    - DOC: Add more examples involving lists and matrices
    - DOC: Number the examples, add screen recordings

 * Clicker 2.0: Adds ability to save calculation history to a list
    - CODE: Add functionality to keep track of clicking history in a list
       ~ Due to the (relatively) performance-critical nature of this code, some
         code duplication has taken place to enhance processing speed during
         execution of the program.
    - DOC: Reformat header, clarify some minor details
    - DOC: Update documentation to reflect changes in the code
    - DOC: Add one more example and update previous ones to align with the new
           version of the program's requirements

 * Clicker 1.0: Initial release just has the ability to recursively perform an
                operation on a variable and discard everything at termination.