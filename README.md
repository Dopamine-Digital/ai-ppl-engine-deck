# AI Pay-Per-Qualified-Call Engine — Pitch Deck

Public-facing pitch deck for the Dopamine Digital AI Pay-Per-Qualified-Call Engine.

**Live URL**: https://dopamine-digital.github.io/ai-ppl-engine-deck/
**Password**: protected via StatiCrypt (see Jordan)

## Image policy (HARD)

Every image rendered by the deck must live inside this repo (`assets/` or `team-photos/`). No external `<img src>` URLs — no `img.youtube.com`, no Google Drive thumbnails, no third-party CDNs. External image hosts can vanish, get rate-limited, or change paths and silently break the deck.

Required assets (verify all present before encrypting):
- `assets/dd-logo.png` (also served as `favicon.png`)
- `assets/case-study-createstudio.jpg`
- `assets/case-study-ripple.jpg`
- `assets/case-study-goldphish.jpg`
- `team-photos/angela.png`, `team-photos/filip.png`, `team-photos/jordan.png`

If a new case study is added, mirror its YouTube `maxresdefault.jpg` into `assets/` first, then reference it locally:
```bash
curl -o assets/case-study-NEWCLIENT.jpg "https://img.youtube.com/vi/VIDEO_ID/maxresdefault.jpg"
```

## Editing

Source lives at `Dopamine-Digital/ops-playbook/templates/ppl-engine/growth-plan-generic.html` (private). To update:

1. Edit the source in `ops-playbook`
2. Copy to `.src.html` in this repo
3. Re-run StatiCrypt:
   ```bash
   cp .src.html /tmp/to-encrypt.html
   cd /tmp
   npx staticrypt to-encrypt.html -p "$PASSWORD" -d enc-out --short --remember 30 \
     --template-color-primary "#7c3aed" --template-color-secondary "#09090b"
   mv enc-out/to-encrypt.html ~/Dopamine-Digital/repos/ai-ppl-engine-deck/index.html
   ```
4. Commit and push the new encrypted `index.html`

`.src.html` is gitignored — only the encrypted version goes public.
