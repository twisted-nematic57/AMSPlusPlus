Due to bugs in TIEdit's PDF renderer, Line 61 in neofetch.pdf is really messed
up and can't be fixed even by pushing it to the next page. So, here is the
correct Line 61, responsible for most of the GUI, in its entirety:

misc\flib("gray","plane:0","sprite:0,0,4,rsrc\ti0","plane:1","sprite:0,0,4,rsrc\ti1","drawstr:64,2,1,"&data[1],"plane:0","drawstr:64,8,1,---------------","plane:1","drawstr:64,14,1,OS: "&data[2],"drawstr:64,21,1,Resolution: "&data[3],"drawstr:64,28,1,CPU: "&data[4],"drawstr:64,35,1,RAM: "&data[5],"drawstr:64,42,1,Arc.: "&data[6],"drawstr:64,49,1,Battery Cycles: "&data[7],"drawstr:64,56,1,Folders: "&data[8],"drawstr:64,63,1,Variables: "&data[9],"plane:0","drawstr:64,14,OS:","drawstr:64,21,Resolution:","drawstr:64,28,CPU:","drawstr:64,35,1,RAM:","drawstr:64,42,1,Arc.:","drawstr:64,49,1,Battery Cycles:","drawstr:64,56,1,Folders:","drawstr:64,63,1,Variables:","rect:65,77,103,88","fillrect:76,79,83,86","fillrect:94,79,101,86","plane:1","fillrect:85,79,92,86","fillrect:94,79,101,86","rect:65,77,103,88","breakoff")

And here it is in a more easy-to-digest form:

misc\flib("gray",
"plane:0",
"sprite:0,0,4,rsrc\ti0",
"plane:1",
"sprite:0,0,4,rsrc\ti1",
"drawstr:64,2,1,"&data[1],"plane:0",
"drawstr:64,8,1,---------------",
"plane:1",
"drawstr:64,14,1,OS: "&data[2],
"drawstr:64,21,1,Resolution: "&data[3],
"drawstr:64,28,1,CPU: "&data[4],
"drawstr:64,35,1,RAM: "&data[5],
"drawstr:64,42,1,Arc.: "&data[6],
"drawstr:64,49,1,Battery Cycles: "&data[7],
"drawstr:64,56,1,Folders: "&data[8],
"drawstr:64,63,1,Variables: "&data[9],
"plane:0",
"drawstr:64,14,OS:",
"drawstr:64,21,Resolution:",
"drawstr:64,28,CPU:",
"drawstr:64,35,1,RAM:",
"drawstr:64,42,1,Arc.:",
"drawstr:64,49,1,Battery Cycles:",
"drawstr:64,56,1,Folders:",
"drawstr:64,63,1,Variables:",
"rect:65,77,103,88",
"fillrect:76,79,83,86",
"fillrect:94,79,101,86",
"plane:1",
"fillrect:85,79,92,86",
"fillrect:94,79,101,86",
"rect:65,77,103,88",
"breakoff")

I'll be using this document's line numbers to point to what I'm talking about.
Lines 9-13: setting up grayscale & displaying the TI logo
Lines 14-15: drawing the header with ID # and dashes
Lines 16-24: printing all the data in dark gray color
Lines 25-33: darkening all the data labels to black
Lines 34-40: drawing the "color" squares at the bottom of the screen
Line 41: supposedly improves grayscale performance a little

See Flib's documentation to make heads or tails of the individual draw commands.
