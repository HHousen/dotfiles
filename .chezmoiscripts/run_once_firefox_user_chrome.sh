#!/bin/bash

PROFILES_PATH="$HOME/.mozilla/firefox"
PROFILES_INI="$PROFILES_PATH/profiles.ini"

# First try to get the Default profile from Install section
DEFAULT_PROFILE=$(grep -A1 "Install" "$PROFILES_INI" | grep "Default=" | cut -d= -f2)

# If that didn't work, try Profile0
if [ -z "$DEFAULT_PROFILE" ]; then
  DEFAULT_PROFILE=$(grep -A3 "Profile0" "$PROFILES_INI" | grep "Path=" | cut -d= -f2)
fi

# Check if the path is relative or absolute
IS_RELATIVE=$(grep -A3 "Profile0" "$PROFILES_INI" | grep "IsRelative=" | cut -d= -f2)

if [ "$IS_RELATIVE" = "1" ]; then
  # Path is relative to the profiles directory
  FIREFOX_PROFILE="$PROFILES_PATH/$DEFAULT_PROFILE"
else
  # Path is absolute
  FIREFOX_PROFILE="$DEFAULT_PROFILE"
fi

mkdir -p "$FIREFOX_PROFILE/chrome"

rm "$FIREFOX_PROFILE/chrome/userChrome.css"

ln -sf ~/.firefoxUserChrome.css "$FIREFOX_PROFILE/chrome/userChrome.css"
