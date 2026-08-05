#!/bin/sh
input=$(cat)

[ "${CLAUDE_STATUSLINE_DEBUG:-0}" = "1" ] && printf 'DEBUG JSON: %s\n' "$input" >&2

model=$(echo "$input" | jq -r '.model.display_name // "Unknown"')
ctx_used=$(echo "$input" | jq -r '.context_window.used_percentage // "0"')
five_pct=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
five_reset=$(echo "$input" | jq -r '.rate_limits.five_hour.reset_time // .rate_limits.five_hour.resets_at // .rate_limits.five_hour.reset_at // empty')
week_pct=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')
week_reset=$(echo "$input" | jq -r '.rate_limits.seven_day.reset_time // .rate_limits.seven_day.resets_at // .rate_limits.seven_day.reset_at // empty')

# Portable date helpers: GNU coreutils vs BSD date.
if date --version >/dev/null 2>&1; then
  iso_to_epoch() { date -u -d "$1" '+%s' 2>/dev/null; }
  ymd_to_abbr() { date -d "$1" '+%a' 2>/dev/null; }
  fmt_epoch() { date -d "@$1" "+$2" 2>/dev/null; }
else
  iso_to_epoch() { TZ=UTC date -j -f '%Y-%m-%dT%H:%M:%SZ' "$1" '+%s' 2>/dev/null; }
  ymd_to_abbr() { date -j -f '%Y-%m-%d' "$1" '+%a' 2>/dev/null; }
  fmt_epoch() { date -r "$1" "+$2" 2>/dev/null; }
fi

# Current directory (abbreviated)
cwd=$(pwd | sed "s|$HOME|~|")

# Git branch
if git rev-parse --git-dir > /dev/null 2>&1; then
  branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
else
  branch="no git"
fi

# Color code based on percentage (light green to dark red)
color_pct() {
  pct="$1"
  if [ -z "$pct" ]; then
    printf "--"
    return
  fi
  pct_int=$(printf "%.0f" "$pct" 2>/dev/null || echo "0")

  # ANSI color codes: 38;5;N is 256-color foreground
  if [ "$pct_int" -lt 25 ]; then
    # Light green
    printf "\033[38;5;46m%d%%\033[0m" "$pct_int"
  elif [ "$pct_int" -lt 50 ]; then
    # Yellow-green
    printf "\033[38;5;226m%d%%\033[0m" "$pct_int"
  elif [ "$pct_int" -lt 75 ]; then
    # Orange
    printf "\033[38;5;208m%d%%\033[0m" "$pct_int"
  else
    # Dark red
    printf "\033[38;5;196m%d%%\033[0m" "$pct_int"
  fi
}

make_bar() {
  pct="$1"
  if [ -z "$pct" ]; then
    printf "[----------] --"
    return
  fi
  pct_int=$(printf "%.0f" "$pct" 2>/dev/null || echo "0")
  [ "$pct_int" -gt 100 ] && pct_int=100
  filled=$((pct_int / 10))
  empty=$((10 - filled))

  bar="["
  i=0
  while [ $i -lt $filled ]; do bar="${bar}█"; i=$((i+1)); done
  i=0
  while [ $i -lt $empty ]; do bar="${bar}░"; i=$((i+1)); done
  bar="${bar}]"

  # Color the percentage
  if [ "$pct_int" -lt 25 ]; then
    printf "%s \033[38;5;46m%d%%\033[0m" "$bar" "$pct_int"
  elif [ "$pct_int" -lt 50 ]; then
    printf "%s \033[38;5;226m%d%%\033[0m" "$bar" "$pct_int"
  elif [ "$pct_int" -lt 75 ]; then
    printf "%s \033[38;5;208m%d%%\033[0m" "$bar" "$pct_int"
  else
    printf "%s \033[38;5;196m%d%%\033[0m" "$bar" "$pct_int"
  fi
}

ctx_bar=$(make_bar "$ctx_used")
five_color=$(color_pct "$five_pct")
week_color=$(color_pct "$week_pct")

# Extract reset times - handle different formats
five_time=""
if [ -n "$five_reset" ]; then
  # Try to extract HH:MM from ISO format (2025-06-25T14:32:45Z)
  if echo "$five_reset" | grep -q 'T'; then
    _epoch=$(iso_to_epoch "$five_reset")
    five_time=$(fmt_epoch "$_epoch" '%H:%M' || echo "$five_reset" | cut -d'T' -f2 | cut -d':' -f1-2)
  # Try to convert from seconds since epoch
  elif echo "$five_reset" | grep -qE '^[0-9]+$'; then
    five_time=$(fmt_epoch "$five_reset" '%H:%M' || echo "$five_reset")
  else
    five_time="$five_reset"
  fi
fi

week_time=""
if [ -n "$week_reset" ]; then
  # Just an hour (like "22")
  if echo "$week_reset" | grep -qE '^[0-9]{1,2}$'; then
    formatted_time=$(printf "%02d:00" "$week_reset")
    week_time="Today $formatted_time"
  # Try to extract day+time from ISO format
  elif echo "$week_reset" | grep -q 'T'; then
    # Get the date part to check if it's today
    _epoch=$(iso_to_epoch "$week_reset")
    reset_date=$(fmt_epoch "$_epoch" '%Y-%m-%d' || echo "$week_reset" | cut -d'T' -f1)
    today=$(date '+%Y-%m-%d')
    time_part=$(fmt_epoch "$_epoch" '%H:%M' || echo "$week_reset" | cut -d'T' -f2 | cut -d':' -f1-2)

    if [ "$reset_date" = "$today" ]; then
      week_time="Today $time_part"
    else
      day_abbr=$(ymd_to_abbr "$reset_date" || echo "")
      if [ -n "$day_abbr" ]; then
        week_time="$day_abbr $time_part"
      else
        week_time="$time_part"
      fi
    fi
  # Try to convert from seconds since epoch
  elif echo "$week_reset" | grep -qE '^[0-9]+$'; then
    today=$(date '+%Y-%m-%d')
    reset_date=$(fmt_epoch "$week_reset" '%Y-%m-%d')
    time_part=$(fmt_epoch "$week_reset" '%H:%M')

    if [ "$reset_date" = "$today" ]; then
      week_time="Today $time_part"
    else
      day_abbr=$(fmt_epoch "$week_reset" '%a')
      week_time="$day_abbr $time_part"
    fi
  else
    week_time="$week_reset"
  fi
fi

printf "\033[38;5;141m%s\033[0m | %s | %s | ctx: %s | 5h: %s [%s] | 7d: %s [%s]" "$model" "$cwd" "$branch" "$ctx_bar" "$five_color" "$five_time" "$week_color" "$week_time"
