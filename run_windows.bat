@echo off
cd /d "%~dp0"
if not exist config.env copy config.env.example config.env >nul
python -m pip install -q -r requirements.txt
start "" http://localhost:5050
python app.py
pause
