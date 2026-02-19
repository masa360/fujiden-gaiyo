@echo off
chcp 65001 >nul
echo 簡易サーバーを起動してブラウザで開きます…
echo.
cd /d "%~dp0"
start "" "http://localhost:8080"
python -m http.server 8080
pause
