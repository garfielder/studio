echo ............ Cleaning IE home page ...........
reg delete "HKEY_USERS\S-1-5-21-2268651786-297324788-490044653-1000\Software\Microsoft\Internet Explorer\Main" /v Default_Page_URL /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\MAIN" /v Default_Page_URL /f

reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\MAIN" /v "First Home Page" /f

reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\MAIN" /v "Start Page" /f

