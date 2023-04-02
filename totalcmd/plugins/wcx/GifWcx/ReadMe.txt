----- GIFWCX - GIF Extension plugin for Total Commander -----
Version 1.3:
- 64 bit support
- Fix background not repainting when encoding transparent gifs

Version 1.2:
- Added pluginst.inf file for automatic installation
- Rebuild against more current CxImage library
- Updated contact information in plugin and readme.txt file

Version 1.1:
- Minor bugfixes

Version 1.0:
- Initial Release

-----


Reads and Writes (animated) GIF (Graphics Interchange Format) Image files.


1. Installation

- unzip the gifwcx.wcx to your Total Commander installation directory
- choose the menu configuration - options
- choose the packer tab
- click the configure packer extension dlls button
- type gif as new extension
- click new type, and select gifwcx.wcx
- click ok
- select an *.gif file and press CTRL+PAGEDOWN to browse the file, extract, delete, or add frames
- select a set of single gif, bitmap, jpeg or png files and press Alt+F5. Select gif (click on configure) and start to encode the gif file



2. Extracting

Enter a GIF file by pressing CTRL+PAGEDOWN
- All frames of the gif file, if animated, are represented as single gif files, ready to extract.


3. Encoding

You can select a bunch of images stored on your harddrive and pack it into an animated gif file.
- Click on the configure button in the pack dialog to show some options
- All the files are added in the order, you have selected them in the almighty Total Commander (from top to bottom). By changing the sort order in TC, the order of the files changes.
- GIF files may contain their own "frame delay". This is the time in the animated gif file, until the next frame comes up. BMP files does not contain it. However, the delay value can be overwritten in the configuration dialog.
- You can choose the compression algorithm of all gif images in the configuration dialog.
- You can add images to an already existing gif file. 
- You can delete frames of an existing file.


4. Be aware of

- An animated gif file only has one color palette. If the first file has a palette, it is adopted.
- The color depth of all images is reduced to 8 bit, if neccessary. If done, the image gets a default palette (you should do it yourself, if you use a specialized palette).
- All your images to encode should have the same dimension. It works fine without but some other programs might have problems.
- PNG files can be encoded. If the first pixel (at pos (0,0)) is transparent, the palette index of that color gets the transparent one. All other pixels get fully opaque.
- This plugin cannot handle all types of gifs out there correctly, especially optimised ones
  (sometimes transparency problems, sometimes palette problems, etc). Try it yourself and don't blame me for anything! 


5. Contact

You will find this plugin on the Total Commanders website: http://www.ghisler.com or on my homepage.

E-Mail: mail@saschahlusiak.de
Homepage: http://www.saschahlusiak.de


This plugin is based on the CxImage library for handling all the gfx-formats. Thanks! 
Visit http://www.codeproject.com/KB/graphics/cximage.aspx for more information.



--------------------------------


NOTE: This plugin is freeware for private use. Companies, who use this plugin commercially, please inform me first.  



Thank you for trying my plugin. =)


This plugin was created by Sascha Hlusiak (April, 2004-2010).











42