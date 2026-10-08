#!/bin/sh
cd "$(dirname "$0")"
[ -f config.env ] || cp config.env.example config.env
python3 -m pip install -q -r requirements.txt
( sleep 2; (open http://localhost:5050 2>/dev/null || xdg-open http://localhost:5050 2>/dev/null) ) &
python3 app.py
