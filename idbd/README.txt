/*** idbd 1.0 *****************************************************************\
 * Author:       twisted_nematic57                                            *
 * Date:         03/20/2025 [MM-DD-YYYY]                                      *
 * License:      Public Domain                                                *
 * Product Type: BASIC function                                               *
 * Platform:     All Motorola 68000-based TI calculators (tested on AMS 3.10) *
\******************************************************************************/

idbd is a BASIC function that returns the number of days between two ISO 8601
formatted dates. idbd(YYYYMMDD,YYYYMMDD) => int

idbd requires dord and padstr to function. (dord is used to get ordinal dates;
padstr is used to pad strings to a certain # of chars.) For your convenience
(and because they are public domain), I have included both in the `_deps`
folder. You can also grab them on the Cemetech.net Archives or the AMSPlusPlus
Git repository, at https://github.com/ardent-development/AMSPlusPlus.git

The dependencies must be located in the `misc` folder on-calc. However, there is
nothing stopping you from editing idbd and changing the folder it looks for dord
and padstr in. All the dependencies are written in pure BASIC.

This function has been tested extensively with the included `testing.py` script.
There has been no attempt at optimization of any of the routines in this
function. However, they should be reasonably fast when doing calculations
involving <50 years of time.

There is ZERO input validation! If anything goes wrong, just press [ON] and 
[ESC], then check your input for issues. If the calculator got busy for more
than 10 seconds while running the function, you most likely just inputted a
gigantic date range. The more years it has to account for, the longer the
calculation will take.
