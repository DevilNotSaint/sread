#!/usr/bin/env bash
# speedcat — чтение файлов по методу RSVP через speedread
# Зависимости: speedread (pip install speedread)

[[ $# -ge 1 ]] || { echo "Использование: speedcat ФАЙЛ [-r N] [-w WPM]"; exit 1; }
file="$1"; shift

state_dir="$HOME/.cache/speedcat"
mkdir -p "$state_dir"
state="$state_dir/$(readlink -f "$file" | md5sum | cut -d' ' -f1)"

extra=()
if [[ -s "$state" ]]; then
    saved=$(<"$state")
    read -rp "Продолжить с -r $saved? [Y/n]: " ans
    [[ "$ans" =~ ^[Nn] ]] || extra=(-r "$saved")
fi

read -rp "Скорость [120]: " speed
speed="${speed:-120}"

tmp=$(mktemp)
trap 'rm -f "$tmp"' EXIT
speedread -w "$speed" "$@" "${extra[@]}" < "$file" 2>&1 \
    | { trap '' INT; tee "$tmp"; }

num=$(grep -oP 'argument -r \K[0-9]+' "$tmp" | tail -1)
if [[ -n "$num" ]]; then
    echo "$num" > "$state"
    echo "Запомнил точку возобновления: -r $num"
else
    rm -f "$state"
fi
