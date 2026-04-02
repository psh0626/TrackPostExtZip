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

set /a EDGE_TOTAL_COUNT=0
set /a EDGE_SUCCESS_COUNT=0
set /a EDGE_FAIL_COUNT=0

set /a CHROME_TOTAL_COUNT=0
set /a CHROME_SUCCESS_COUNT=0
set /a CHROME_FAIL_COUNT=0

goto MAIN


:run_reg_delete
set "REG_KEY=%~1"

echo !COLOR_INFO![삭제]!COLOR_RESET! !REG_KEY!
set /a REG_TOTAL_COUNT+=1
if /i "!CURRENT_TITLE!"=="EDGE" set /a EDGE_TOTAL_COUNT+=1
if /i "!CURRENT_TITLE!"=="CHROME" set /a CHROME_TOTAL_COUNT+=1
reg delete "%REG_KEY%" /f >nul 2>&1
if errorlevel 1 (
	set /a REG_FAIL_COUNT+=1
	if /i "!CURRENT_TITLE!"=="EDGE" set /a EDGE_FAIL_COUNT+=1
	if /i "!CURRENT_TITLE!"=="CHROME" set /a CHROME_FAIL_COUNT+=1
	echo !COLOR_FAIL![실패]!COLOR_RESET! !COLOR_BOLD!레지스트리 삭제에 실패했습니다.!COLOR_RESET!
	for /f "delims=" %%L in ('reg delete "%REG_KEY%" /f 2^>^&1') do echo !COLOR_WARN![원인]!COLOR_RESET! %%L
) else (
	set /a REG_SUCCESS_COUNT+=1
	if /i "!CURRENT_TITLE!"=="EDGE" set /a EDGE_SUCCESS_COUNT+=1
	if /i "!CURRENT_TITLE!"=="CHROME" set /a CHROME_SUCCESS_COUNT+=1
	echo !COLOR_OK![성공]!COLOR_RESET! !COLOR_BOLD!레지스트리 삭제를 완료했습니다.!COLOR_RESET!
)
exit /b

:MAIN

set "CURRENT_TITLE=EDGE"
echo !COLOR_TITLE!====엣지 설정 삭제 시작====!COLOR_RESET!
set "choice=Y"
set /p choice=엣지 TrackPost 설치 및 관련 설정 삭제를 진행하시겠습니까? (Y/N): 
if /i "%choice%"=="N" goto EDGE_END

echo.
set "KEY3=HKCU\Software\Policies\Microsoft\Edge"
call :run_reg_delete "%KEY3%"
echo.

:EDGE_END
echo !COLOR_TITLE!====엣지 설정 삭제 완료====!COLOR_RESET!
echo !COLOR_INFO![엣지 설정]!COLOR_RESET! !COLOR_BOLD!총 !EDGE_TOTAL_COUNT!건!COLOR_RESET! / !COLOR_OK!성공 !EDGE_SUCCESS_COUNT!건!COLOR_RESET! / !COLOR_FAIL!실패 !EDGE_FAIL_COUNT!건!COLOR_RESET!
echo.

set "CURRENT_TITLE=CHROME"
echo !COLOR_TITLE!====크롬 설정 삭제 시작====!COLOR_RESET!
set "choice=Y"
set /p choice=크롬 TrackPost 설치 및 관련 설정 삭제를 진행하시겠습니까? (Y/N): 
if /i "%choice%"=="N" goto CHROME_END

echo.
echo !COLOR_SECTION!--확장프로그램 설정--!COLOR_RESET!
set "KEY5=HKCU\Software\Policies\Google\Chrome"
call :run_reg_delete "%KEY5%"
echo.

:CHROME_END
echo !COLOR_TITLE!====크롬 설정 삭제 완료====!COLOR_RESET!
echo !COLOR_INFO![크롬 설정]!COLOR_RESET! !COLOR_BOLD!총 !CHROME_TOTAL_COUNT!건!COLOR_RESET! / !COLOR_OK!성공 !CHROME_SUCCESS_COUNT!건!COLOR_RESET! / !COLOR_FAIL!실패 !CHROME_FAIL_COUNT!건!COLOR_RESET!

echo.
echo !COLOR_TITLE!====전체 설정 삭제 완료====!COLOR_RESET!
echo !COLOR_INFO![전체 설정]!COLOR_RESET! !COLOR_BOLD!총 !REG_TOTAL_COUNT!건!COLOR_RESET! / !COLOR_OK!성공 !REG_SUCCESS_COUNT!건!COLOR_RESET! / !COLOR_FAIL!실패 !REG_FAIL_COUNT!건!COLOR_RESET!
echo !COLOR_TITLE!====================!COLOR_RESET!
echo.
echo 인터넷 브라우저/컴퓨터를 재시작하면 새로운 설정이 적용됩니다.
pause
endlocal
