/*** padstr 1.0 ***************************************************************\
 * Author:       twisted_nematic57                                            *
 * Date:         03/20/2025 [MM-DD-YYYY]                                      *
 * License:      Public Domain                                                *
 * Product Type: BASIC function                                               *
 * Platform:     All Motorola 68000-based TI calculators (tested on AMS 3.10) *
\******************************************************************************/

padstr is a very simple BASIC function that pads a string to a certain number of
characters using a specified padding character, from either the start or the end
of the string. It can also be used for truncation to a specific number of chars.

Syntax:
  padstr(str,chr,n,dir) => string

  {str,chr} are strings (chr should only be 1 char)
  {n,dir} are integers. (technically dir can be a float, but it'd be better
                        practice to strictly keep it between [-1,1].)

 * str is your input string that should be padded or truncated.
 * chr is the character with which the string will be padded, if applicable. It
   should be a single character string.
    - NOTE: this should always be set to a character regardless of if the
            function is being used for truncation or padding for safety.
 * n is the number of characters the string should be padded/truncated to.
 * dir is a number that indicates the direction from which the function should
   pad/truncate the input string. If it is any greater than 0, the function will
   insert padding characters/cut off characters starting at the "right side" of
   the string. Else, it will do so from the "left"/beginning of the string.

Examples:  padstr("hello","0",8,1)  => "hello000"
           padstr("hello","0",8,-1) => "000hello"
           padstr("hello","0",8,0)  => "000hello"
           padstr("hello","0",3,1)  => "hel"
           padstr("hello","0",3,-1) => "llo"
