@echo off
	:: Fetch network names
	echo A list of currently known network names (SSID) &echo.
    netsh wlan show profile | find "All User Profile"
    echo.

    :: Userinput variable SSID name
	set /p input="Type the network SSID/name you wish to fetch the password from: "

	:: Save network information in file
	netsh wlan show profile %input% key=clear | find "Key Content" > school_project.txt

	:: Clears the command prompt
	cls

	:: Inform about network encryption key location
	echo The password to the network is after the colon of the Key Content & echo.
	echo ------------------------------------------------------------------

	:: Print network information on command propmpt
	netsh wlan show profile %input% key=clear | find "Key Content"
	echo ------------------------------------------------------------------
	echo.
pause