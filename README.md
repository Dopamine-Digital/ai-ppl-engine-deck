# AI Pay-Per-Qualified-Call Engine — Pitch Deck

Public-facing pitch deck for the Dopamine Digital AI Pay-Per-Qualified-Call Engine.

**Live URL**: https://dopamine-digital.github.io/ai-ppl-engine-deck/
**Password**: protected via StatiCrypt (see Jordan)

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
