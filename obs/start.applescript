activate application "OBS"
tell application "System Events" to tell process "OBS"
    click button "Start Streaming" of window 1
    click button "Start Recording" of window 1
end tell
