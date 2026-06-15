#!/usr/bin/env bash
#
# status.sh — at-a-glance enhancement board for the terminal.
#
# Renders ENHANCEMENTS.md (the single source of truth Claude maintains each
# session) as a colored board grouped by status: open work on top, completed
# collapsed at the bottom. Read-only — it never edits anything.
#
# Reading ENHANCEMENTS.md rather than re-scanning each plan.md is deliberate:
# there is one maintained source of truth, so the board can never drift from it.
#
# Usage:  ./status.sh        (run from anywhere; it finds its own folder)
#         bash status.sh
#
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FILE="$DIR/ENHANCEMENTS.md"

if [ ! -f "$FILE" ]; then
  echo "status.sh: no ENHANCEMENTS.md found next to this script ($FILE)" >&2
  exit 1
fi

# Colors, disabled when output is not a terminal (e.g. piped to a file).
if [ -t 1 ]; then
  use_color=1
else
  use_color=0
fi

awk -v color="$use_color" '
function trim(s) { gsub(/^[ \t]+|[ \t]+$/, "", s); return s }
BEGIN {
  if (color) {
    B="\033[1m"; D="\033[2m"; R="\033[0m";
    GREEN="\033[32m"; YELLOW="\033[33m"; BLUE="\033[34m"; MAGENTA="\033[35m"; CYAN="\033[36m";
  }
  FS="|";
}
# Only table rows: start with "|", and not the header / separator.
/^\|/ {
  if ($0 ~ /^\|[ \t]*#/ || $0 ~ /^\|[ \t]*-/) next;
  num    = trim($2);
  name   = trim($3);
  status = trim($4);
  notes  = trim($6);
  if (name == "" && status == "") next;
  # Skip promoted/superseded ideas kept only for history (struck through).
  if (name ~ /~~/) next;

  label = (num != "" && num != "—") ? (num " — " name) : name;

  if (index(status, "🔄"))      { ip[++nip] = label "\t" notes }
  else if (index(status, "🔵")) { ns[++nns] = label "\t" notes }
  else if (index(status, "🟣")) { sp[++nsp] = label "\t" notes }
  else if (index(status, "💡")) { id[++nid] = name }
  else if (index(status, "✅")) { done[++ndone] = (num != "" && num != "—") ? num : name }
}
END {
  printf "\n%s%sEnhancement Board%s   %s(from ENHANCEMENTS.md)%s\n\n", B, CYAN, R, D, R;

  section(YELLOW,  "🔄 In Progress", ip,  nip);
  section(BLUE,    "🔵 Not Started", ns,  nns);
  section(MAGENTA, "🟣 Split",       sp,  nsp);

  if (nid > 0) {
    printf "%s%s💡 Ideas (%d)%s\n   ", B, GREEN, nid, R;
    for (i = 1; i <= nid; i++) printf "%s%s", id[i], (i < nid ? ", " : "");
    printf "\n\n";
  }

  if (ndone > 0) {
    printf "%s%s✅ Complete (%d)%s\n   ", B, GREEN, ndone, R;
    for (i = 1; i <= ndone; i++) printf "%s ", done[i];
    printf "\n\n";
  }
}
# Print a status section, one enhancement per line, with trimmed notes.
function section(c, title, arr, n,   i, label, note, p) {
  if (n == 0) return;
  printf "%s%s%s (%d)%s\n", B, c, title, n, R;
  for (i = 1; i <= n; i++) {
    p = index(arr[i], "\t");
    label = substr(arr[i], 1, p - 1);
    note  = substr(arr[i], p + 1);
    if (length(note) > 70) note = substr(note, 1, 69) "…";
    if (note == "") printf "   %s\n", label;
    else            printf "   %-30s %s%s%s\n", label, D, note, R;
  }
  printf "\n";
}
' "$FILE"
