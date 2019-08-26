@echo off
    :: Terminal color
    color 1F

    :: Seperation line
    set sepLine=echo ------------------------------------------------------------------

    :restartProgram
    :: Fetch SSID
    echo A list of currently known network names (SSID) & echo.
    %sepLine%
    netsh wlan show profile | find "All User Profile" & %sepLine% & echo.

    :: input variable for the SSID name
    set /p input="Enter the WiFi SSID/name you wish to fetch the password from: "

    :: WiFi data
    set networkContent=netsh wlan show profile %input% key=clear
    set WiFiKeyContent=%networkContent% ^| find "Key Content"
    set WiFiSSIDName=%networkContent% ^| find "SSID name"

    :: Data storage file
    set keyStorageFile=WiFi_Key_Content.txt

    :: Store WiFi key and SSID in the programs allocated spot
    date /t >> %keyStorageFile%
    %WiFiSSIDName% >> %keyStorageFile%
    %WiFiKeyContent% >> %keyStorageFile%
    %sepLine% >> %keyStorageFile%

    :: DEVELOPER OPTION - Prevent data storage file from saving
    :: del %keyStorageFile%
    cls

    :: Help text for non-technical users
    echo The WiFi password is written after the colon of the Key Content & echo.
    %sepLine%

    :: Print network information on command propmpt
    %WiFiSSIDName%
    %WiFiKeyContent%
    %sepLine% & echo.
    pause
    cls

:: Ask if the user want to exit the program
set /p areYouSure="Do you wish to exit the program? (Y/[N])"
if /I "%areYouSure%" neq "y" goto end
exit
:end

:: Returns to the top of the program
cls
goto restartProgram
