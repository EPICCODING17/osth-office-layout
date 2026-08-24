# OSTH Office Layout — 3D LAN/TEL/POWER/FAX Planner

**Live:** https://epiccoding17.github.io/osth-office-layout/ (public GitHub
Pages — contains real employee names + phone extensions, confirmed OK to
publish 2026-08-24)

Single-page 3D visual planner for OSTH's office cabling layout (LAN, telephone,
power, fax) across 3 floors. Built with Three.js (loaded from CDN via import
map — no build step, no dependencies to install).

## Run it

Just open `index.html` in a browser, or serve the folder statically:

```sh
npx serve .
# or
python -m http.server 8000
```

No backend required. State lives in the browser's `localStorage`
(`osth-office-3d-v1`) as a fast local cache, but the durable copy is
`data/osth-office-layout.json` on GitHub — see **GitHub auto-sync** below.
Use the **Export JSON** / **Export SQL** buttons in the header to
download a snapshot any time.

## GitHub auto-sync

Click **GitHub** in the header once to paste a Personal Access Token —
after that, edits (drag/rename/add/delete) push to
`data/osth-office-layout.json` on GitHub automatically, ~4s after you stop
editing (debounced, so a drag doesn't spam commits). Any browser/device that
opens the live site loads the latest data from GitHub on start.

**Setting it up (Pong, do this once per browser you edit from):**
1. Create a token at https://github.com/settings/personal-access-tokens/new
   — **fine-grained**, repository access limited to just `osth-office-layout`,
   permission **Contents: Read and write** only. Give it an expiry (e.g. 90 days).
2. Click **GitHub** in the app header, paste the token, **บันทึก**.
3. Watch the status pill next to it: gray = not connected, pulsing amber =
   saving, green = saved (with a timestamp), red = error (hover/toast shows why).

The token is stored only in that browser's `localStorage` and is sent only to
`api.github.com` directly — nothing else sees it. Anyone with access to that
browser could read it out of localStorage, so keep the token scoped to just
this one repo as above, and re-generate/revoke it from GitHub settings if a
machine you used it on is ever compromised.

A browser with no token configured is read-only: it always loads the latest
GitHub data but never pushes.

## Multi-select

- **Shift + click** an item — toggles it in/out of the current selection
  (click a few items one at a time to build up a group).
- **Shift + drag** on empty floor — rubber-band select everything inside the
  box.
- Drag any item that's part of the current selection — the whole group
  moves together, keeping their relative positions.
- With 2+ items selected, the right panel switches to bulk actions: rotate
  all 45° (each in place, not around a shared pivot), duplicate all, delete
  all. The same keyboard shortcuts (R, Ctrl+D, Delete) act on the group too.

## Structure

- `index.html` — the app (UI + Three.js scene + all logic, single file)
- `data/osth-office-layout.json` — latest exported snapshot (JSON)
- `data/osth-office-layout.sql` — latest exported snapshot (SQLite-flavored SQL)
- `reference/OSTH LAN TEL POWER 2026.08.14.xlsx` — original source spreadsheet
  the seed data was built from (item list + service counts on sheet `Sheet1`;
  sheets `ผัง` / `ผัง (ไล)` are a colored-cell visual sketch of the floor
  layout, no extractable text data)

## Data model

Each item: `type`, `name`, `floor` (1/2/3), `x`/`z` position (meters),
`rot` (degrees), `lan`/`tel`/`power`/`fax` (cable counts), `ext` (phone
extension), `lanNo`/`telNo` (cable-run labels), `note`.

The in-app **รีเซ็ต** button restores the hardcoded `seedItems()` list in
`index.html` (not the Excel file directly — the seed is a manual transcription
of the spreadsheet).

## Known-good vs. source spreadsheet

Verified 2026-08-24: every row in `reference/*.xlsx` → `Sheet1` was cross-checked
against `seedItems()` (floor, lan/tel/power/fax counts, ext). Totals match
exactly (LAN 30, POWER 28, TEL 24, FAX 1). Two mismatches found in the
previous seed were corrected:

- **Meeting 1 VIP** — was floor 1 with `fax:1`; spreadsheet says floor **2**
  with `tel:1`. Fixed.
- **Old Fuji Xerox ช่าง** (the technician-zone printer) — was floor 2 with
  `tel:1`; spreadsheet says floor **1** with `fax:1`. Fixed.

Floor 3 has no entries in the source spreadsheet — its rack/panel are
infrastructure items added directly in the app, not sourced from Excel.

## TODO / ideas

- (nothing queued yet — add features/bugs here as they come up)

## Changelog

- **2026-08-24** — GitHub auto-sync (PAT token, debounced push, load-on-open);
  multi-select (Shift+click / Shift+drag, group move, bulk rotate/duplicate/
  delete); two new furniture types (L-shape workstation, L-shape empty desk);
  fixed the workstation chair facing away from the desk (affected the
  original `workstation()` builder too, not just the new L-shape one).
