@echo off
    :: Fetch network names
    echo A list of currently known network names (SSID) &echo.
    netsh wlan show profile | find "All User Profile"
    echo.

    :: Userinput variable SSID name
    set /p input="Type the network SSID/name you wish to fetch the password from: "
    set networkContent=netsh wlan show profile %input% key=clear
    set sepLine=echo ------------------------------------------------------------------

    :: Save network information in file
    %networkContent% | find "Key Content" > WiFi_Key_Content.txt
    cls

    :: Inform about network encryption key location
    echo The password to the network is after the colon of the Key Content & echo.
    %sepLine%

    :: Print network information on command propmpt
    %networkContent% |  find "Key Content"
    %sepLine% & echo.
pause
