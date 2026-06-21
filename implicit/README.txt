/*** implicit 1.0 *************************************************************\
 * Author:         twisted_nematic57                                          *
 * Date:           06/20/2026 [MM-DD-YYYY]                                    *
 * License:        Public Domain                                              *
 * Product Type:   Hybrid BASIC/ASM programs                                  *
 * Platform:       TI-89 Titanium - can be ported to other Motorola 68000     *
 *                 based TI calculators with ease.                            *
\******************************************************************************/

One graphing capability that old graphing calculators sorely lack compared to
modern graphing applications like Desmos is the ability to graph arbitrary
relations in two dimensions.

This suite of programs solves that problem for the TI-89 Titanium.
* Using `implicit`, you can graph implicit relations in ultra-high precision, at
  the expense of each graph taking many minutes to render at the least.
* Using `impl_rt`, you can graph implicit relations in progressively higher
  resolutions. This works akin to how some Internet graphics initially appear
  pixelated, giving you a general idea of what they look like, before sharpening
  and revealing many more small details.

Note that this suite of programs uses a Marching Squares-based algorithm to
render curves. Therefore, it will not produce results as accurate as those made
by programs that do use interval arithmetic-based algorithms, like GrafEq.
However, for most use cases, this will not matter much. (Hopefully.)

Overclocking your machine is strongly recommended before you use these programs.
The implementation of the graphing algorithm is naive-at-best.


I. INSTALLATION

Place all files ending in ".89p" except "kbdprgm7.89p" into a folder called
`ζimpprgm` on your calculator. Archive each of them. (That "ζ" is a lowercase
Greek zeta.)

Then place "kbdprgm7.89p" in your `main` folder on-calc. Archive it.
To be able to use "kbdprgm7.89p", you can either install AMS Extender:
https://www.ticalc.org/archives/files/fileinfo/430/43017.html
or you can change the "7" to a number that's not 7, 8 or 9. Whenever you need to
run this program, you'll have to use the keyboard shortcut Diamond+{the number
at the end of the filename}, by default 7. The rest of this document will assume
7, but you can mentally substitute your new number if you changed the number in
the filename of `kbdprgm7`.

Then send "statline.89z" and "apdreset.89z" from the "_deps" directory. They
should be in the `misc` folder on-calc, and should be archived.

 * statline is a public domain C program by me that enables BASIC programs to
   efficiently manipulate the status line.
   https://www.cemetech.net/downloads/files/2600/x3320
 * apdreset is a tiny program by me that resets the calculator's sleep timer.
   https://www.cemetech.net/downloads/files/2599/x3321


II. USAGE

Both `implicit` and `impl_rt`, the curve-rendering programs, use a fairly naive
implementation of the Marching Squares algorithm to determine if pixels/regions
should be shaded or not. It *is not always 100% accurate* for certain graphs due
to the fact that it uses this algorithm; however, this issue can be avoided by
increasing the quality level at which `implicit` renders graphs.
See http://www.peda.com/grafeq/gallery/rogue.html for examples of graphs that
implicit will not render correctly. Keep in mind that it will handle _most_
graphs perfectly fine!

`impl_rt`, on the other hand, is for situations where you quickly need to get a
glance at the general form of an implicit curve. Rather than linearly rendering
the entire graph at once in a relatively high quality level, `impl_rt` will
split the entire Graph Screen into large subdivisions and perform the Marching
Squares algorithm on those large regions. This ends up producing an image much
faster at the expense of visual quality. When a certain quality level finishes
rendering in `impl_rt`, it will be re-rendered in double the current resolution,
and this will repeat forever.
`impl_rt`'s algorithm was inspired by Progressive JPEG.

`kbdprgm7` is a program launched via a keyboard shortcut Diamond+7 that you will
ALWAYS need to launch after `implicit` and `impl_rt` finish or are interrupted.
See below for details.

* If you want an accurate-looking graph at the expense of time, use `implicit`.
   - `implicit` takes two arguments in this order:
      > eqn: a mathematical equation in terms of x, y, and constants
      > detail: a real integer >= 1 that controls the level of detail at which
        the graph is rendered. Specifically, detail^2 will be the number of
        pixels that each physical pixel is split up into while the graphing
        algorithm is running. Increasing this number is only recommended for
        relations in which there is extremely frequent oscillation or tightly
        packed curves that may otherwise be missed.
   - Because runs of `implicit` may take a very long time, especially when using
     detail levels >1, pause/resume support is included.
      > To pause a running render, press [ON] while `implicit` is running. Then,
        press Diamond+7 and select Archive. Do this as soon as possible to
        minimize inaccuracies in runtime measurement, if you care about that.
      > To resume a render, just re-launch `implicit` with exactly the same
        arguments that you originally launched it with.
      > To cancel a render, use the "Delete" option in the menu popped up by
        `kbdprgm7`. This will irreversibly delete all saved state data about
        your last render.
      > Regardless of whether or not you're using the pause/resume functionality
        you have to make sure to use `kbdprgm7`'s "Delete" option when you want
        to begin a fresh new render.
   - Example: ζimpprgm\implicit(e^(sin(x)+cos(y))=sin(e^(x+y)),16)

* If you want a general idea of what a curve looks like ASAP at the expense of
  graphical quality, use `impl_rt`.
   - `impl_rt` takes two arguments in this order:
      > eqn: a mathematical equation in terms of x, y, and constants
      > pass: a real integer >= 2 which specifies the detail level to begin
        rendering at. The screen will be split into pass^2 subdivisions and the
        Marching Squares algorithm will be run on it. When a certain pass
        finishes rendering, it is doubled and a new higher-resolution rendering
        of the graph overlays itself above the previous pass as it rendersf from
        top-to-bottom.
   - After you quit `impl_rt`, make sure to launch `kbdprgm7` by pressing
     Diamond+7 to clear cached data.
   - Example: ζimpprgm\impl_rt(y^4-4*y^2=x^4-9*x^2,2)


III. CHANGELOG

 * implicit 1.0: Initial public release
    - CODE: add `implicit`, `impl_rt` and `kbdprgm7`
    - DOC: create documentation

Trust me, there were a *lot* of internal revisions!
