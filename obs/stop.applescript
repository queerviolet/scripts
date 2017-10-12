activate application "OBS"
tell application "System Events" to tell process "OBS"
    click button "Stop Streaming" of window 1
    click button "Stop Recording" of window 1
end tell
