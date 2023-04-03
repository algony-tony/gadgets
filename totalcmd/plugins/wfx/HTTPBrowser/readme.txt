HTTP Browser 1.2 plugin for Total Commander

Initial developer and sources: Fabio Chelly:
fabio@chelly.net
Website:	http://totalcommander.free.fr/fabio
Download link:	http://totalcommander.free.fr/fabio/hbrowser.zip


HTTP Browser is a plugin for Total Commander. It allows users to
connect to websites via Total Commander and see links, pictures
or any downloadable links as files.

Icons is Snipicons iconset.

______________________________

        INSTALLATION
______________________________

1. Enter to archive with plugin and TC will ask you to install plugin 
   automatically. Or install it manually (see instructins below).

2. Copy the content of the archive httpbrowser.zip in a folder of your
   choice. I suggest to install it in a subfolder of your TotalCommander
   folder: for instance, C:\totalcmd\plugins\WFX\HTTPBrowser\

3. Enter the menu      : Configuration > Options
   Select the tab      : Operation
   Click on the button : FS-Plugins (a dialog will appear)
   Click on the button : Add
   Choose the file     : httpbrowser.wfx (in the folder where you
			 unpacked the archive)
   Click on OK (3 times)

4. The HTTP Browser plugin in installed.


______________________________

        HOW TO USE IT
______________________________

1. Under Total Commander, access 'My Network places'
2. Double click on 'HTTP Browser'
3. Click on 'Connect'
4. Enter the URL you want to browse and ENTER
5. The content of the page appears as a list of files
   - You can follow a link with a double click on it
   - You can download files with F5
   - you can preview pictures or pages with F3
4. SSL and HTTPS. For work with https pages plugin need libcrypto-3.dll and libssl-3.dll.
   Put these files to appropriate subdirs in plugin main directory:
   x64_ssl_dll\ for 64-bit dll's and x86_ssl_dll\ for 32-bit dlls.
   PATH to dll's can be set in httpbrowser.ini: SslDllPath_x64= and SslDllPath_x86=.
   Known working dll's can be downloaded from http://wiki.overbyte.eu/wiki/index.php/ICS_Download#Download_OpenSSL_Binaries_.28required_for_SSL-enabled_components.29
   From other sources dll's will be accepted to but keep naming like from download page above.
   SLL 3.0 from ICS component authors included (signed, link above).


© 2003 Fabio Chelly (fabio@chelly.net).

© 2016-2022 ProgMan13 (progman13@mail.ru)