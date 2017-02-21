
"use strict";

const bitmapManipulation = require("mono-bitmap");//bitmap_manipulation");

// Create bitmap
let bitmap = new bitmapManipulation.Bitmap(400, 300);

// Draw rectangle with border
bitmap.drawFilledRect(10, 10, 100, 50, 0x00, 0xff);

// Draw another bitmap with some source pixels in a specific color handled as transparent
let overlayBitmap = Bitmap.fromFile("overlayBitmap.bmp");
bitmap.drawBitmap(overlayBitmap, 200, 0, overlayBitmap.getPalette().indexOf(0xff00ff/*magenta*/));

// Draw text
let font = new bitmapManipulation.Font("P:\\ath\\to\\Font.json");
font.setSize(20);
bitmap.drawText(font, "Hello World!", 10, 100);

// The raw pixel data can also be processed in a user-specific way
let bitmapData = bitmap.data();  // Return a Node.js Buffer
