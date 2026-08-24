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

No backend required — state lives in the browser's `localStorage`
(`osth-office-3d-v1`). Use the **Export JSON** / **Export SQL** buttons in the
header to snapshot the current layout to `data/`.

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
