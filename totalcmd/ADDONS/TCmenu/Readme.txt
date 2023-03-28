
-------------------------------------------------------------------------------
  TCMenu 2.0
-------------------------------------------------------------------------------
TCMenu is extension to the Buttonbar of Total Commander. TCMenu adds drop-down 
menu functionality to the TC Buttonbar.

-------------------------------------------------------------------------------
  Changes History
-------------------------------------------------------------------------------
Version 2.0 beta4

- Fixed bug with executing internal TC commands from default item.

- Changed Shift+click processing for defualt items. Now single click executes 
default item (if defined), otherwise shows menu as usual. Shift+click always 
opens menu.

Version 2.0 beta3

- Added right text alignment. "Tabulator" key allows to specify tabulator char.
If tabulator char is present in Tooltip field, then text before this char 
is left aligned and text after this char is right aligned. Is is not recommended
to use this feature in items for opening of nested menu, since Windows itself draws 
right-aligned nested menu sign in such items.


- Added menu shortcut support. 
Menu shortcut is single underlined symbol in menu text. Symbol underlined when 
preceded by "&" (i.e. "Win&Amp" item could be selected by letter "A").

- Added automatic column splitting for very long menus.
ColumnHeight key limits number of items in column. 
If key SkipEmptyBreak=0 not specidied, empty separators at begin and at end of 
columns are discarded.

- Added "default item" support.
When program started by Ctrl+click on button, selected item is remembered as 
"default item".
When program started by Shift+click on button, menu is not displayed and 
"default item" is executed.

- Fixed bug loading icons from 16-bit modules.


Version 2.0 beta2
- FlatMenu key is ignored under themed Windows XP.

Version 2.0 beta1

- Added file TCMenu.ini. 
This file should be in the same directory as TCMenu.exe 

- Added color themes support. 
Themes can be assigned for each menu/submenu separately. Settings in particular 
section overwrite settings in [Common] section. Section for particular menu 
should be named as corresponding .bar file without path. Color themes can be 
stored in separate sections and referenced by "Theme" key. "FlatMenu" key of 
main menu overwrites settings in child menu. See example of .ini file for full 
list color theme keys. 

- Added separators with text. 
If "Tooltip" field for separators is not empty its text will be visible in menu.

- Added multicolumn menu support. 
If "Tooltip" field contains tag "/BREAK" this item starts a new column in the menu.

- Added em_ commands support. 

- Added support for any size icons. 
Can be specified by "IconSize" key for each menu or as -$[nn] parameter for all menus.

- Added support for icon cashe files (.br2 files in TC 7). 
Using TC cashe speed up menu creation if up-to-date .br2 file is present. 
Controlled by "UseTCCache" key. Possible values are:
  0 - don't use TC cache
  2 - use TC cash if available. 
  1 - use TC cache only. If .br2 file is absent or outdated show menu without icons.
IMPORTANT NOTE. Using "Icon size" value other then actually size of icons stored in 
cashe cause to scaling, so these icons may looks ugly.

- Added support for run minimized\maximized checkbox.
"RunHidden" relates to "Run minimized" checkbox. Such programs launch in hidden mode 
instead of minimised. Of course it is true only for program supporting hidden mode 
running (i.e. cmd.exe)

- Extended "cd" support. 
"Parameters" field may contain S and/or T letters. 
  S - open directories in source/target panels.  
  T - open directories in new tabs

Version 1.9
- Fixed bug with drawing separators for Windows NT

Version 1.8
- Added support for nested .bar files. If choosen item contains in the command field .bar file name this bar will displayed instead of current menu. If parameter field contains word "menu", this .bar file will be attached to main menu as submenu.

Version 1.7
- If menu text for internal commands was not specified, TCmenu will take it from totalcmd.inc(wincmd.inc) file.
- Added support for CD command.
  Now you can define commands to change directories according to TC documentation. The only difference from TC behavior is that instead of settings directories on source/target panels TCmenu will set directories on left/right panels.

!!! WARNING !!! Using CD command in TCmenu was checked with TC 5.51 only and may not work with future TC versions.

Version 1.6
- Program renamed from WCmenu to TCmenu
- Program can be placed in any directory
- Improved internal command handling
- Fixed small bug related to Windows NT.

-------------------------------------------------------------------------------
  Usage
-------------------------------------------------------------------------------
1. Create a new button.
2. Assign TCMenu.exe to the button.
3. Fill the parameters field:
       Path to any Buttonbar file (.bar) to be used as menu configuration.
       List of parameters to be passed on execution of menu items. Each parameter is defined as 
       -x <string> , where
       "x" (any letter) specifies the corresponding TC parameter in buttonbar file (%x) which will be substituted with <string>. Usually <string> contains one of TC parameters(%p, %n, %l etc.) 


Example:
If you have defined button for notepad.exe in your MyEditors.bar file as
        Notepad.exe %p%n (that means full filename),

you can define parameters for TCmenu as:
        C:\Wincmd\MyEditors.bar -n %n -p %p
In this case %n parameter in "notepad definition" will be replaced with standard TC %n parameter and %p parameter in "notepad definition" will be replaced with standard TC %p parameter. 

On the other hand, you can make another definition with the same result. You can define parameters in MyEditors.bar as:
        Notepad.exe %A 

and define parameters for TCmenu as:
        C:\Wincmd\MyEditors.bar -A %p%n 

In this case %A parameter in "notepad definition" will be replaced with concatenation of standard TC %p and %n parameters.

-------------------------------------------------------------------------------
  Special parameters
-------------------------------------------------------------------------------
1. Small/Big icons parameter.
By default menu is displayed with big icons. To display small icons add -$ to parameters list.

2. User Input parameter.
You can use "?" parameter to get the opportunity to the user to modify command-line parameters before command execution. This parameter can be located at any place in parameter string (and even in environment variable!). The question marks located in strings enclosed in quotation marks are ignored. When dialog box for user input is displayed, cursor will be placed in the position corresponding to "?" position in the parameter string. You can place immediately after "?" some text (or text until space or text enclosed in quotation marks). This text will be used to prompt user about kind of input required. 

Examples:
    ?Year(00-99) 
or 
    ?"Would you be so kind to enter your birthday, sir?"

-------------------------------------------------------------------------------
  Environment Variables
-------------------------------------------------------------------------------
You can use environment variables (like %WinDir%) in the following fields:
1. Parameter field in TCmenu button definition. (p.e. -x %%OS%%)
2. Parameter field in subbar buttons definitions. (p.e. %%OS%%)
3. Command field in subbar buttons definitions. (p.e. %Windir%\notepad.exe)

Important! Variables in parameters fields should be enclosed in double percent signs.
If variable, specified in TCmenu button definition, will contain spaces after expansion, it will be enclosed in quotation marks.

-------------------------------------------------------------------------------
  Special Variables
-------------------------------------------------------------------------------
There are special variables available for using in subbars. These variables contain current time/date related information.

        %0 - hours
        %1 - minutes
        %2 - seconds
        %3 - day of month
        %4 - month
        %5 - year
        %6 - day of week
        %7 - month name

Example: cmd.exe /c md Backup_%3-%7-%5


-------------------------------------------------------------------------------
  Internal TC commands
-------------------------------------------------------------------------------
Displayed subbar can contain any internal TC command, except commands with parameters 
(i.e. cm_List <filename>).


-------------------------------------------------------------------------------
Author: MGP Software Ltd.
Email: support@mgpsoft.com