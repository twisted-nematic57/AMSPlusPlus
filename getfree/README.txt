/*** getfree 1.0 **************************************************************\
 * Author:         twisted_nematic57                                          *
 * Date:           04/17/2025 [MM-DD-YYYY]                                    *
 * License:        Public Domain                                              *
 * Product Type:   BASIC program                                              *
 * Platform:       All Motorola 68000-based TI calculators with Flash memory  *
\******************************************************************************/

getfree is a very simple BASIC function that returns the total amount of free
RAM and Archive (Flash) space, in bytes, as a list.

Syntax:
  getfree() => {ram,arc}

  ram,arc are integers. ram represents the number of bytes of RAM that are
  available, and arc represents the same, but instead for the Flash space that
  can be used to store archived variables.
