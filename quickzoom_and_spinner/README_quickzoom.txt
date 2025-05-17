/*** Quickzoom 1.0 ************************************************************\
 * Author:         twisted_nematic57                                          *
 * Date:           05/17/2025 [MM-DD-YYYY]                                    *
 * License:        Public Domain                                              *
 * Product Type:   Hybrid BASIC/ASM program                                   *
 * Platform:       TI-89 Titanium - can be ported to other Motorola 68000     *
 *                 based TI calculators with ease.                            *
\******************************************************************************/

Quickzoom is a BASIC program for the TI-89 Titanium that implements a box
zooming/panning mechanism which is much more intuitive than the built-in
ZoomBox.

The major benefits of using this program over the built-in graphical zooming
methods are:
 * It maintains the aspect ratio of the viewing window;
 * You can edit a zoom box after creating it;
 * You can store and recall zoom windows to 9 independent slots;
 * It does not modify your {xscl,yscl} at all;
 * This program makes it very easy to "pan" your viewing window instead of just 


depends on statline,flib2