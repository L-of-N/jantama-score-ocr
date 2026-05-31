@echo off
chcp 65001 > nul
set PYTHONUTF8=1
set PYTHONIOENCODING=utf-8
echo jantamascore を起動しています...
python -X utf8 main.py
pause
