/*** idbd 1.0 *****************************************************************\
 * Author:       twisted_nematic57                                            *
 * Date:         03/??/2025 [MM-DD-YYYY]                                      *
 * License:      Public Domain                                                *
 * Product Type: BASIC function                                               *
 * Platform:     All Motorola 68000-based TI calculators (tested on AMS 3.10) *
\******************************************************************************/

idbd is a BASIC function that returns the number of days between two ISO 8601
formatted dates. idbd(YYYYMMDD,YYYYMMDD) => int

idbd requires dord and padstr to function. (dord is used to get ordinal dates;
padstr is used to pad strings to a certain # of chars.) For your convenience
(and because they are public domain), I have included both in the `_deps`
folder. You can also grab them here:
 * dord: https://www.cemetech.net/downloads/files/2616/x3358
 * padstr: {INSERT HERE BEFORE RELEASE!!!!}
The dependencies are also located in the AMSPlusPlus Git repository.
The dependencies must be located in the `misc` folder on-calc. However, there is
nothing stopping you from editing idbd and changing the folder it looks for dord
and padstr in.

This function has been tested extensively with the included `testing.py` script.
There has been no attempt at optimization of any of the routines in this
function. However, they should be reasonably fast when doing calculations
involving <100 years of time.

There is ZERO input validation! The first date MUST occur before the second one,
or the function may output a very wrong result, go into a really long loop, or
even crash. However, the solution to all of that is to either fix your input or
press [ON]/[ESC]. BASIC cannot do anything too wrong to the calc, after all.
