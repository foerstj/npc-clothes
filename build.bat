:: names
set mod=npc-clothes
set mod_cs=NPC Clothes

:: tank properties
set year=2026
set copyright=CC-BY-SA %year%
set author=Johannes Förstner
set title=%mod_cs%

:: path of Bits dir
set bits=%~dp0.
:: path of DS installation
set ds=%DungeonSiege%
:: path of TankCreator
set tc=%TankCreator%

:: param
set mode=%1
echo %mode%

:: Compile main resource file
rmdir /S /Q "%tmp%\Bits"
robocopy "%bits%\art" "%tmp%\Bits\art" /S /xd git-ignore /xf *.psd
robocopy "%bits%\world\contentdb\templates\%mod%" "%tmp%\Bits\world\contentdb\templates\%mod%" /S
"%tc%\RTC.exe" -source "%tmp%\Bits" -out "%ds%\DSLOA\%mod_cs%.dsres" -copyright "%copyright%" -title "%title%" -author "%author%"
if %errorlevel% neq 0 pause

:: Compile demo map file
rmdir /S /Q "%tmp%\Bits"
robocopy "%bits%\world\maps\%mod%-demo" "%tmp%\Bits\world\maps\%mod%-demo" /S
"%tc%\RTC.exe" -source "%tmp%\Bits" -out "%ds%\DSLOA\%mod_cs% Demo.dsmap" -copyright "%copyright%" -title "%title%" -author "%author%"
if %errorlevel% neq 0 pause
