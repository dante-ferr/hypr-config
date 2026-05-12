#!/bin/bash

# Define a temporary file for the screenshot
temp_img="/tmp/ocr_snapshot.png"

# 1. Select area and save to temp file
# 2. Use Tesseract to extract text to stdout
# 3. Copy result to clipboard and notify
if slurp | grim -g - "$temp_img"; then
    tesseract "$temp_img" - -l eng | wl-copy
    notify-send "OCR Complete" "Text copied to clipboard."
    rm "$temp_img"
else
    notify-send "OCR Cancelled" "No area selected."
fi