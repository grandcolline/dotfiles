#!/bin/bash

input=$(cat)
notification_type=$(echo "$input" | jq -r '.notification_type')

play_sound() {
  local sound="$1"
  afplay "/System/Library/Sounds/${sound}.aiff" &
}

case "${notification_type}" in
  "permission_prompt")
    play_sound "Ping"
    ;;
  "idle_prompt")
    play_sound "Purr"
    ;;
  "stop")
    play_sound "Glass"
    ;;
  *)
    play_sound "Pop"
    ;;
esac
