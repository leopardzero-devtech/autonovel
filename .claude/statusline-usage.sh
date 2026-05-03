#!/usr/bin/env bash
set -u

input="$(cat)"

jq_value() {
  printf '%s' "$input" | jq -r "$1 // empty"
}

cwd="$(jq_value '.workspace.current_dir // .cwd')"
model="$(jq_value '.model.display_name')"
remaining_context="$(jq_value '.context_window.remaining_percentage')"
used_context="$(jq_value '.context_window.used_percentage')"

if [ -z "$remaining_context" ] && [ -n "$used_context" ]; then
  remaining_context="$(awk -v used="$used_context" 'BEGIN { printf "%.0f", 100 - used }')"
fi

five_hour_used="$(jq_value '.rate_limits.five_hour.used_percentage // .rate_limits."5_hour".used_percentage // .rate_limits["5h"].used_percentage')"
seven_day_used="$(jq_value '.rate_limits.seven_day.used_percentage // .rate_limits."7_day".used_percentage // .rate_limits["7d"].used_percentage')"

short_dir="$(printf '%s' "$cwd" | awk -F/ '{ if (NF > 2) print "..." $(NF-1) "/" $NF; else print $0 }')"
out="$(printf '\033[0;36m%s\033[0m' "$short_dir")"

if [ -n "$model" ]; then
  out="$out $(printf '\033[0;35m%s\033[0m' "$model")"
fi

if [ -n "$remaining_context" ]; then
  remaining_context_int="$(printf '%.0f' "$remaining_context")"
  if [ "$remaining_context_int" -le 20 ]; then
    color='\033[0;31m'
  elif [ "$remaining_context_int" -le 50 ]; then
    color='\033[0;33m'
  else
    color='\033[0;32m'
  fi
  bar="$(awk -v pct="$remaining_context_int" 'BEGIN {
    filled = int((pct + 5) / 10)
    if (filled > 10) filled = 10
    if (filled < 0) filled = 0
    for (i = 0; i < filled; i++) printf "#"
    for (i = filled; i < 10; i++) printf "-"
  }')"
  out="$out $(printf "${color}context left [%s] %d%%\033[0m" "$bar" "$remaining_context_int")"
fi

if [ -n "$five_hour_used" ]; then
  five_hour_left="$(awk -v used="$five_hour_used" 'BEGIN { printf "%.0f", 100 - used }')"
  out="$out $(printf '\033[0;90m5h left:%s%%\033[0m' "$five_hour_left")"
fi

if [ -n "$seven_day_used" ]; then
  seven_day_left="$(awk -v used="$seven_day_used" 'BEGIN { printf "%.0f", 100 - used }')"
  out="$out $(printf '\033[0;90m7d left:%s%%\033[0m' "$seven_day_left")"
fi

printf '%s' "$out"
