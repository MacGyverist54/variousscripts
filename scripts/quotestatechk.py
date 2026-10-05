sudo python3 - <<'PY'
from pathlib import Path

lines = Path("/etc/zipit/zip.env").read_text().splitlines()

inside = False

for n, line in enumerate(lines, 1):
    escaped = False
    toggled = False

    for ch in line:
        if escaped:
            escaped = False
            continue
        if ch == "\\":
            escaped = True
            continue
        if ch == '"':
            inside = not inside
            toggled = True

    if toggled:
        left = line.split("=", 1)[0].strip()
        if left.startswith("export "):
            left = left[7:].strip()
        print(f"line {n}: {left or '(non-assignment)'} -> quote state: {'OPEN' if inside else 'CLOSED'}")

print("\nFinal double-quote state:", "OPEN/BROKEN" if inside else "CLOSED/OK")
PY

