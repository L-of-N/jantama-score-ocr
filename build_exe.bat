@echo off
cd /d "%~dp0"

set PYTHONUTF8=1
set PYTHONIOENCODING=utf-8

echo === Installing dependencies ===
python -m pip install -r requirements.txt
if errorlevel 1 goto error

echo.
echo === Building exe ===
python -m PyInstaller --noconfirm --clean --noconsole --onedir --name JantamaScore main.py
if errorlevel 1 goto error

echo.
echo === Preparing distribution folder ===
if not exist "dist\JantamaScore\images" mkdir "dist\JantamaScore\images"
if not exist "dist\JantamaScore\output" mkdir "dist\JantamaScore\output"
if exist "dist\JantamaScore\templates" rmdir /s /q "dist\JantamaScore\templates"
xcopy /E /I /Y "templates" "dist\JantamaScore\templates" > nul

echo.
echo Done.
echo Distribution folder: dist\JantamaScore
echo App: dist\JantamaScore\JantamaScore.exe
echo.
echo Note: Tesseract-OCR must also be installed on the target PC.
echo Default path: C:\Program Files\Tesseract-OCR\tesseract.exe
echo.
pause
exit /b 0

:error
echo.
echo Build failed. Check the log above.
pause
exit /b 1
