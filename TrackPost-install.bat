chcp 65001 >nul
@echo off
setlocal EnableDelayedExpansion

for /f %%E in ('echo prompt $E^| cmd') do set "ESC=%%E"
set "COLOR_TITLE=%ESC%[1;93m"
set "COLOR_BOLD=%ESC%[1;97m"
set "COLOR_SECTION=%ESC%[1;94m"
set "COLOR_INFO=%ESC%[1;96m"
set "COLOR_WARN=%ESC%[1;93m"
set "COLOR_OK=%ESC%[1;92m"
set "COLOR_FAIL=%ESC%[1;91m"
set "COLOR_RESET=%ESC%[0m"

set /a REG_TOTAL_COUNT=0
set /a REG_SUCCESS_COUNT=0
set /a REG_FAIL_COUNT=0
set /a WINDOWS_TOTAL_COUNT=0
set /a WINDOWS_SUCCESS_COUNT=0
set /a WINDOWS_FAIL_COUNT=0
set /a EDGE_TOTAL_COUNT=0
set /a EDGE_SUCCESS_COUNT=0
set /a EDGE_FAIL_COUNT=0
set /a CHROME_TOTAL_COUNT=0
set /a CHROME_SUCCESS_COUNT=0
set /a CHROME_FAIL_COUNT=0

goto MAIN

:run_reg_add
set "REG_KEY=%~1"
set "REG_VALUE=%~2"
set "REG_TYPE=%~3"
set "REG_DATA=%~4"
for %%A in ("%REG_KEY%") do set "REG_KEY_LAST=%%~nxA"
set "REG_DISPLAY=!REG_VALUE!=!REG_DATA!"
echo(!REG_VALUE!| findstr /r "^[0-9][0-9]*$" >nul
if not errorlevel 1 set "REG_DISPLAY=!REG_DATA!"

echo !COLOR_INFO![등록]!COLOR_RESET! !REG_KEY_LAST!: !REG_DISPLAY!
set /a REG_TOTAL_COUNT+=1
if /i "!CURRENT_TITLE!"=="WINDOWS" set /a WINDOWS_TOTAL_COUNT+=1
if /i "!CURRENT_TITLE!"=="EDGE" set /a EDGE_TOTAL_COUNT+=1
if /i "!CURRENT_TITLE!"=="CHROME" set /a CHROME_TOTAL_COUNT+=1
reg add "%REG_KEY%" /v "%REG_VALUE%" /t "%REG_TYPE%" /d "%REG_DATA%" /f >nul 2>&1
if errorlevel 1 (
	set /a REG_FAIL_COUNT+=1
	if /i "!CURRENT_TITLE!"=="WINDOWS" set /a WINDOWS_FAIL_COUNT+=1
	if /i "!CURRENT_TITLE!"=="EDGE" set /a EDGE_FAIL_COUNT+=1
	if /i "!CURRENT_TITLE!"=="CHROME" set /a CHROME_FAIL_COUNT+=1
	echo !COLOR_FAIL![실패]!COLOR_RESET! !COLOR_BOLD!레지스트리 등록에 실패했습니다.!COLOR_RESET!
	for /f "delims=" %%L in ('reg add "%REG_KEY%" /v "%REG_VALUE%" /t "%REG_TYPE%" /d "%REG_DATA%" /f 2^>^&1') do echo !COLOR_WARN![원인]!COLOR_RESET! %%L
) else (
	set /a REG_SUCCESS_COUNT+=1
	if /i "!CURRENT_TITLE!"=="WINDOWS" set /a WINDOWS_SUCCESS_COUNT+=1
	if /i "!CURRENT_TITLE!"=="EDGE" set /a EDGE_SUCCESS_COUNT+=1
	if /i "!CURRENT_TITLE!"=="CHROME" set /a CHROME_SUCCESS_COUNT+=1
	echo !COLOR_OK![성공]!COLOR_RESET! !COLOR_BOLD!레지스트리 등록을 완료했습니다.!COLOR_RESET!
)
exit /b

:MAIN
set "CURRENT_TITLE=WINDOWS"
echo !COLOR_TITLE!====윈도우 설정 시작====!COLOR_RESET!
set "choice=Y"
set /p choice=윈도우 알림 및 편의 기능 설정을 진행하시겠습니까? (Y/N): 
if /i "%choice%"=="N" goto WINDOWS_END

echo.
echo !COLOR_SECTION!--알림 센터 켜기--!COLOR_RESET!
set "KEY1=HKCU\Software\Policies\Microsoft\Windows\Explorer"
call :run_reg_add "%KEY1%" "DisableNotificationCenter" "REG_DWORD" "0"
echo !COLOR_SECTION!--알림 센터 켜기 완료--!COLOR_RESET!

echo.
echo !COLOR_SECTION!--알림 메시지 관련 설정--!COLOR_RESET!
set "KEY2=HKCU\Software\Policies\Microsoft\Windows\CurrentVersion\PushNotifications"
call :run_reg_add "%KEY2%" "NoTileApplicationNotification" "REG_DWORD" "0"
echo.
call :run_reg_add "%KEY2%" "NoToastApplicationNotification" "REG_DWORD" "0"
echo.
call :run_reg_add "%KEY2%" "NoToastApplicationNotificationOnLockScreen" "REG_DWORD" "0"
echo !COLOR_SECTION!--알림 메시지 관련 설정 완료--!COLOR_RESET!

echo.
echo !COLOR_SECTION!--빙 검색 기능 끄기--!COLOR_RESET!
call :run_reg_add "%KEY1%" "DisableSearchBoxSuggestions" "REG_DWORD" "1"
echo !COLOR_SECTION!--빙 검색 기능 끄기 완료--!COLOR_RESET!

echo.
echo !COLOR_SECTION!--오류 보고 기능 끄기--!COLOR_RESET!
call :run_reg_add "HKCU\Software\Policies\Microsoft\Windows\Windows Error Reporting" "DisableSearchBoxSuggestions" "REG_DWORD" "1"
echo !COLOR_SECTION!--오류 보고 기능 끄기 완료--!COLOR_RESET!
echo.

:WINDOWS_END
echo !COLOR_TITLE!====윈도우 설정 완료====!COLOR_RESET!
echo !COLOR_INFO![윈도우 설정]!COLOR_RESET! !COLOR_BOLD!총 !WINDOWS_TOTAL_COUNT!건!COLOR_RESET! / !COLOR_OK!성공 !WINDOWS_SUCCESS_COUNT!건!COLOR_RESET! / !COLOR_FAIL!실패 !WINDOWS_FAIL_COUNT!건!COLOR_RESET!
echo.

set "CURRENT_TITLE=EDGE"
echo !COLOR_TITLE!====엣지 설정 시작====!COLOR_RESET!
set "choice=Y"
set /p choice=엣지 TrackPost 설치 및 관련 설정을 진행하시겠습니까? (Y/N): 
if /i "%choice%"=="N" goto EDGE_END

echo.
echo !COLOR_SECTION!--확장프로그램 설정--!COLOR_RESET!
set "KEY3=HKCU\Software\Policies\Microsoft\Edge"
call :run_reg_add "%KEY3%\ExtensionInstallAllowlist" "1" "REG_SZ" "ceaglmnlneffokklakakncncaholckem"
echo.
call :run_reg_add "%KEY3%\ExtensionInstallForcelist" "1" "REG_SZ" "ceaglmnlneffokklakakncncaholckem;https://raw.githubusercontent.com/psh0626/TrackPostExtZip/main/updateManifest.xml"
echo.
call :run_reg_add "%KEY3%\ExtensionSettings\ceaglmnlneffokklakakncncaholckem" "toolbar_state" "REG_SZ" "force_shown"
echo.
call :run_reg_add "%KEY3%\ExtensionSettings\ceaglmnlneffokklakakncncaholckem" "sidebar_auto_open_blocked" "REG_SZ" "false"
echo !COLOR_SECTION!--확장프로그램 설정 완료--!COLOR_RESET!

echo.
echo !COLOR_SECTION!--기본 검색 엔진 설정--!COLOR_RESET!
call :run_reg_add "%KEY3%" "DefaultSearchProviderEnabled" "REG_DWORD" "1"
echo.
call :run_reg_add "%KEY3%" "DefaultSearchProviderName" "REG_SZ" "Google"
echo.
call :run_reg_add "%KEY3%" "DefaultSearchProviderSearchURL" "REG_SZ" "{google:baseURL}search?q={searchTerms}&{google:RLZ}{google:originalQueryForSuggestion}{google:assistedQueryStats}{google:searchFieldtrialParameter}{google:searchClient}{google:sourceId}ie={inputEncoding}"
echo.
call :run_reg_add "%KEY3%" "DefaultSearchProviderSuggestURL" "REG_SZ" "{google:baseURL}complete/search?output=chrome&q={searchTerms}"
echo !COLOR_SECTION!--기본 검색 엔진 설정 완료--!COLOR_RESET!

echo.
echo !COLOR_SECTION!--항상 활성화 사이트 설정--!COLOR_RESET!
set "KEY4=HKCU\Software\Policies\Microsoft\Edge\SleepingTabsBlockedForUrls"
call :run_reg_add "%KEY4%" "1" "REG_SZ" "https://gcss.ipc.be"
echo.
call :run_reg_add "%KEY4%" "2" "REG_SZ" "https://gcss-uat.ipc.be"
echo.
call :run_reg_add "%KEY4%" "3" "REG_SZ" "https://icare.post"
echo.
call :run_reg_add "%KEY4%" "4" "REG_SZ" "https://kmmbox.korea.kr"
echo.
call :run_reg_add "%KEY4%" "5" "REG_SZ" "https://mail.posa.or.kr"
echo !COLOR_SECTION!--항상 활성화 사이트 설정 완료--!COLOR_RESET!
echo.

:EDGE_END
echo !COLOR_TITLE!====엣지 설정 완료====!COLOR_RESET!
echo !COLOR_INFO![엣지 설정]!COLOR_RESET! !COLOR_BOLD!총 !EDGE_TOTAL_COUNT!건!COLOR_RESET! / !COLOR_OK!성공 !EDGE_SUCCESS_COUNT!건!COLOR_RESET! / !COLOR_FAIL!실패 !EDGE_FAIL_COUNT!건!COLOR_RESET!
echo.

set "CURRENT_TITLE=CHROME"
echo !COLOR_TITLE!====크롬 설정 시작====!COLOR_RESET!
set "choice=Y"
set /p choice=크롬 TrackPost 설치 및 관련 설정을 진행하시겠습니까? (Y/N): 
if /i "%choice%"=="N" goto CHROME_END

echo.
echo !COLOR_SECTION!--확장프로그램 설정--!COLOR_RESET!
set "KEY5=HKCU\Software\Policies\Google\Chrome"
call :run_reg_add "%KEY5%\ExtensionInstallAllowlist" "1" "REG_SZ" "ceaglmnlneffokklakakncncaholckem"
echo.
call :run_reg_add "%KEY5%\ExtensionInstallForcelist" "1" "REG_SZ" "ceaglmnlneffokklakakncncaholckem;https://raw.githubusercontent.com/psh0626/TrackPostExtZip/main/updateManifest.xml"
echo.
call :run_reg_add "%KEY5%\ExtensionSettings\ceaglmnlneffokklakakncncaholckem" "toolbar_pin" "REG_SZ" "force_pinned"
echo !COLOR_SECTION!--확장프로그램 설정 완료--!COLOR_RESET!

echo.
echo !COLOR_SECTION!--항상 활성화 사이트 설정--!COLOR_RESET!
set "KEY6=HKCU\Software\Policies\Google\Chrome\TabDiscardingExceptions"
call :run_reg_add "%KEY6%" "1" "REG_SZ" "https://gcss.ipc.be"
echo.
call :run_reg_add "%KEY6%" "2" "REG_SZ" "https://gcss-uat.ipc.be"
echo.
call :run_reg_add "%KEY6%" "3" "REG_SZ" "https://icare.post"
echo.
call :run_reg_add "%KEY6%" "4" "REG_SZ" "https://kmmbox.korea.kr"
echo.
call :run_reg_add "%KEY6%" "5" "REG_SZ" "https://mail.posa.or.kr"
echo !COLOR_SECTION!--항상 활성화 사이트 설정 완료--!COLOR_RESET!
echo.

:CHROME_END
echo !COLOR_TITLE!====크롬 설정 완료====!COLOR_RESET!
echo !COLOR_INFO![크롬 설정]!COLOR_RESET! !COLOR_BOLD!총 !CHROME_TOTAL_COUNT!건!COLOR_RESET! / !COLOR_OK!성공 !CHROME_SUCCESS_COUNT!건!COLOR_RESET! / !COLOR_FAIL!실패 !CHROME_FAIL_COUNT!건!COLOR_RESET!

echo.
echo !COLOR_TITLE!====전체 설정 완료====!COLOR_RESET!
echo !COLOR_INFO![전체 설정]!COLOR_RESET! !COLOR_BOLD!총 !REG_TOTAL_COUNT!건!COLOR_RESET! / !COLOR_OK!성공 !REG_SUCCESS_COUNT!건!COLOR_RESET! / !COLOR_FAIL!실패 !REG_FAIL_COUNT!건!COLOR_RESET!
echo !COLOR_TITLE!====================!COLOR_RESET!
echo.
echo 인터넷 브라우저/컴퓨터를 재시작하면 새로운 설정이 적용됩니다.
pause
endlocal
