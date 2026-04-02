@echo off

echo 알림 센터 켜기
set "KEY1=HKCU\Software\Policies\Microsoft\Windows\Explorer"
reg add "%KEY1%" /v DisableNotificationCenter /t REG_DWORD /d 0 /f
echo 알림 센터 켜기 완료
echo.

echo PushNotifications 관련 설정
set "KEY2=HKCU\Software\Policies\Microsoft\Windows\CurrentVersion\PushNotifications"
reg add "%KEY2%" /v NoTileApplicationNotification /t REG_DWORD /d 0 /f
reg add "%KEY2%" /v NoToastApplicationNotification /t REG_DWORD /d 0 /f
reg add "%KEY2%" /v NoToastApplicationNotificationOnLockScreen /t REG_DWORD /d 0 /f
echo PushNotifications 관련 설정 완료
echo.

echo ====엣지 설정 시작====
echo 항상 활성화 사이트 설정
set "KEY3=HKCU\Software\Policies\Microsoft\Edge\SleepingTabsBlockedForUrls"
reg add "%KEY3%" /v 1 /t REG_SZ /d "https://gcss.ipc.be" /f
reg add "%KEY3%" /v 2 /t REG_SZ /d "https://gcss-uat.ipc.be" /f
reg add "%KEY3%" /v 3 /t REG_SZ /d "https://icare.post" /f
reg add "%KEY3%" /v 4 /t REG_SZ /d "https://kmmbox.korea.kr" /f
reg add "%KEY3%" /v 5 /t REG_SZ /d "https://mail.posa.or.kr" /f
echo 항상 활성화 사이트 설정 완료
echo.

echo 확장프로그램 설정
set "KEY4=HKCU\Software\Policies\Microsoft\Edge"
reg add "%KEY4%\ExtensionInstallAllowlist" /v 1 /t REG_SZ /d "ceaglmnlneffokklakakncncaholckem" /f
reg add "%KEY4%\ExtensionInstallForcelist" /v 1 /t REG_SZ /d "ceaglmnlneffokklakakncncaholckem;https://raw.githubusercontent.com/psh0626/TrackPostExtZip/main/updateManifest.xml" /f
reg add "%KEY4%\ExtensionSettings\ceaglmnlneffokklakakncncaholckem" /v toolbar_state /t REG_SZ /d "force_shown" /f
reg add "%KEY4%\ExtensionSettings\ceaglmnlneffokklakakncncaholckem" /v sidebar_auto_open_blocked /t REG_SZ /d "false" /f
echo 확장프로그램 설정 완료
echo ====엣지 설정 완료====
echo.

echo 엣지를 재시작하세요.
pause
