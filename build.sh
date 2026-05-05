#!/bin/bash
# Build the encrypted index.html from .src.html.
# StatiCrypt's gate page has no favicon and a generic title by default,
# so we post-process to inject branding into the gate <head>.

set -euo pipefail

REPO="$(cd "$(dirname "$0")" && pwd)"
PASSWORD="${DECK_PASSWORD:-dopamine}"
TITLE="AI Pay-Per-Qualified-Call Engine | Dopamine Digital"

cp "$REPO/.src.html" /tmp/to-encrypt.html
cd /tmp
rm -rf enc-out
npx --yes staticrypt to-encrypt.html \
  -p "$PASSWORD" \
  -d enc-out \
  --short \
  --remember 30 \
  --template-color-primary "#7c3aed" \
  --template-color-secondary "#09090b"

OUT="$REPO/index.html"
mv enc-out/to-encrypt.html "$OUT"

# Inject favicon + branded title into the gate <head>
python3 - "$OUT" "$TITLE" <<'PY'
import re, sys, pathlib
path = pathlib.Path(sys.argv[1])
title = sys.argv[2]
html = path.read_text()
# Replace the generic title
html = html.replace("<title>Protected Page</title>", f"<title>{title}</title>", 1)
# Inject favicon links right after <meta charset>
favicon = (
    '\n        <link rel="icon" type="image/png" href="favicon.png">'
    '\n        <link rel="shortcut icon" type="image/png" href="favicon.png">'
    '\n        <link rel="apple-touch-icon" href="favicon.png">'
)
html = re.sub(r'(<meta charset="utf-8" ?/?>)', r'\1' + favicon, html, count=1)
path.write_text(html)
PY

echo "Built $OUT"
