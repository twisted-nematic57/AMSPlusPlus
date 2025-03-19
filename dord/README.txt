/*** dord 1.0 *****************************************************************\
 * Author:       twisted_nematic57                                            *
 * Date:         03/18/2025 [MM-DD-YYYY]                                      *
 * License:      Public Domain                                                *
 * Product Type: BASIC program                                                *
 * Platform:     All Motorola 68000-based TI calculators (tested on AMS 3.10) *
\******************************************************************************/

dord is a very simple BASIC function that returns the ordinal date of its
argument, which is formatted like a getDate() result: {year,month,day}, where
all of the elements of the list are valid integers. It does not technically need
getDate() to run, which is why it should still be functional on the original
TI-92.

An ordinal date is like the "day number" - e.g., the 17th of January of any year
is the 17th day of that year. This program accounts for leap years. 

It does not have input validation, so beware of potentially wacky results if you
call it with weird input. I decided to make it take a list of 3 elements instead
of 3 independent args since that makes it work better with getDate().

Example: dord({2009,7,20}) -> 201 (July 20th, 2009 is the 201th day of that
year)
