# Repo Update Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Make both decks build cleanly from a fresh clone with no blank slides, no network-fetched images, right-sized assets, and documentation that matches the repo.

**Architecture:** Marp Markdown sources build to HTML and PDF via the Makefile. All images become local files under `images/` (hand-made) or `captures/` (screenshots refreshed by `make images`). Build outputs stay as they are: HTML tracked, PDF ignored.

**Tech Stack:** marp-cli 4.2.3, Chromium headless, ImageMagick, GNU make, git.

**Spec:** `plan/2026-10-19-review.md` (findings A1–A13, C, D1–D7). Slide *content* changes are in `plan/2026-10-19-slide-update-work-plan.md`; this plan only touches what is needed to make the build correct.

## Global Constraints

- Never generate PPTX (`CLAUDE.md`).
- Build commands are exactly `marp --allow-local-files --html <file>.md` and `marp --allow-local-files --pdf <file>.md`.
- Footer stays `© 2026 IEISI: CC BY-NC-SA 4.0 | tcs@ieisi.org | www.ieisi.org`.
- One logical change per commit, Conventional Commits, commit to `main` (repo practice).
- No file over 1 MB added to `images/` after Task 6.

## Review Focus

1. Fresh clone + `make all` with network disabled must succeed with no "missing" warning (Task 7 pins this).
2. Every page of both PDFs must have visible content; the contact sheet check in each task catches blank pages.
3. No slide may draw text over the footer band (bottom 40 px). Slide 41 is the known case (slide plan Task W-8); the contact sheet check covers the rest.
4. `make images` must be re-runnable: it must overwrite files the deck references, not produce new names (Task 4).
5. Markdown that references a file must reference one that is tracked (Task 7's clone test).

## Verification harness

Used by every task. Run from the repo root.

```bash
make all 2>&1 | grep -E 'WARN|ERR' | grep -v 'Insecure local file'   # expect no output
grep -nE 'picsum|wikimedia|ipxo|un\.org' *.md                            # expect no output after Task 2
rm -rf /tmp/render && mkdir -p /tmp/render
pdftoppm -r 40 -png ipv6-board-briefing.pdf  /tmp/render/board
pdftoppm -r 40 -png ipv6-marp-slide-deck.pdf /tmp/render/ws
montage /tmp/render/board-*.png -tile 6x -geometry 400x225+4+4 /tmp/render/board-sheet.png
montage /tmp/render/ws-*.png    -tile 6x -geometry 400x225+4+4 /tmp/render/ws-sheet.png
```
Then open the two sheets and look for blank pages, overflow, and text in the footer band.

---

### Task 1: Remove the picsum placeholders (A2)

**Files:**
- Modify: `ipv6-board-briefing.md:25,216,318`
- Modify: `ipv6-marp-slide-deck.md:25,38`

- [ ] **Step 1:** Delete the five `![bg right:…](https://picsum.photos/…)` lines. Leave the slides text-only.
- [ ] **Step 2:** Run: `grep -n picsum *.md` — expect no output.
- [ ] **Step 3:** Run the harness; check board pages 2, 17, 24 and workshop pages 2, 3 render as text slides.
- [ ] **Step 4:** Commit: `fix(decks): remove picsum placeholder images`

### Task 2: Repair the broken and network-fetched images (A1, A6)

**Files:**
- Modify: `ipv6-marp-slide-deck.md:82,85,158,161,322-323`
- Modify: `ipv6-board-briefing.md:170`

Decisions:
- Wikimedia timeline (line 82): delete the line. The Huston chart on the next slide covers the point.
- Huston chart (line 85): use the local copy.
- ipxo chart slide (lines 156–158): delete the whole slide. The price trend is already on slide 14 and slide 17.
- `images/hilco.png` (line 161): delete the `![bg left…]` line; keep the headings.
- Rural case study (lines 322–323): use the existing uncropped capture; fix the heading URL.
- SDG tile (board line 170): delete the line. The SDG 9 bullet text stays. (UN icon usage by non-UN bodies needs permission; not worth it.)

- [ ] **Step 1:** Line 85 → `![w:800](images/huston_rir_exhaustion.png)` and add below it: `<small>_Source: Geoff Huston, APNIC — RIR IPv4 exhaustion projection (CC BY-SA, via Wikimedia Commons)_</small>`
- [ ] **Step 2:** Delete line 82.
- [ ] **Step 3:** Delete the slide at lines 156–158 (from its `---` to the next `---`).
- [ ] **Step 4:** Delete line 161.
- [ ] **Step 5:** Line 322 → `## Source: https://www.mdpi.com/2571-5577/3/1/4` and line 323 → `![h:420](captures/apnic_ipv6_rural.png)`
- [ ] **Step 6:** Delete `ipv6-board-briefing.md:170`.
- [ ] **Step 7:** Run: `grep -nE 'wikimedia|ipxo|un\.org|hilco|rural_cropped' *.md` — expect no output.
- [ ] **Step 8:** Run the harness — expect no "missing" warning; check workshop pages 7, 8, 16, 35 and board page 13.
- [ ] **Step 9:** Commit: `fix(decks): replace external and missing images with local files`

### Task 3: Fix image sizing and captions (A4, A5)

**Files:**
- Modify: `ipv6-marp-slide-deck.md` (the APNIC Labs screenshot slide, formerly line 229; the three caption slides, formerly lines 243–252)

- [ ] **Step 1:** `![60%](captures/apnic_labs.png)` → `![h:400](captures/apnic_labs.png)`
- [ ] **Step 2:** Heatmap slide: replace the slide body with
  ```markdown
  <!-- _header: "" -->
  ![bg](captures/apnic_labs_ipv6_heatmap.png)
  ```
  and delete its `<p align="right">` line.
- [ ] **Step 3:** World and Polynesia slides: delete the `<p align="right">…</p>` line and add a heading above the image: `## stats.labs.apnic.net/ipv6 — World` and `## stats.labs.apnic.net/ipv6/QS — Polynesia`.
- [ ] **Step 4:** Run: `grep -n 'align="right"' *.md` — expect no output.
- [ ] **Step 5:** Run the harness; check workshop pages 23–27: no overflow, no header over the screenshot title.
- [ ] **Step 6:** Commit: `fix(workshop): use Marp image sizing and heading captions`

### Task 4: Fix the Makefile screenshot recipe (A8, A9)

**Files:**
- Modify: `Makefile` (the `images:` target)
- Modify: `ipv6-marp-slide-deck.md` (references to `-0.jpg`)

- [ ] **Step 1:** Change the two `convert` lines to:
  ```make
  convert $(CAPTURES)/apnic_labs_ipv6_polynesia.png -crop 1025x575+0+0 +repage $(CAPTURES)/apnic_labs_ipv6_polynesia.jpg
  convert $(CAPTURES)/apnic_labs_ipv6_world.png -crop 1025x575+0+0 +repage $(CAPTURES)/apnic_labs_ipv6_world.jpg
  ```
- [ ] **Step 2:** Change the infoblox URL to `https://www.infoblox.com/blog/ipv6-coe/the-first-steps-in-ipv6-adoption-having-a-plan/`.
- [ ] **Step 3:** In the deck, `apnic_labs_ipv6_world-0.jpg` → `apnic_labs_ipv6_world.jpg` and `apnic_labs_ipv6_polynesia-0.jpg` → `apnic_labs_ipv6_polynesia.jpg`.
- [ ] **Step 4:** Run: `make clean-images && make images` — expect 13 PNGs and 2 JPGs in `captures/`, no `-0..-3` tiles. Run: `ls captures | wc -l` — expect 15.
- [ ] **Step 5:** Run the harness; check workshop pages 24–25 (world, Polynesia) show the crop, dated this month.
- [ ] **Step 6:** Commit: `build: fix screenshot crop recipe and moved infoblox URL`

### Task 5: Track captures so a fresh clone builds (A8)

**Files:**
- Modify: `.gitignore`
- Add: `captures/*.png`, `captures/*.jpg` (15 files, about 2.6 MB)

- [ ] **Step 1:** Remove the `captures/` line and its comment from `.gitignore`; replace with `# captures/ is tracked; refresh with \`make images\``.
- [ ] **Step 2:** Run: `git add captures .gitignore && git status --short | wc -l` — expect 16.
- [ ] **Step 3:** Commit: `build: track screenshot captures so fresh clones build`

### Task 6: Right-size the hand-made images (A7, A11, A12)

**Files:**
- Modify: `images/apac_logo.png`, `images/ipv6_deployment.png`
- Delete: `images/training_hubs.png`, `images/ipv6_risks.png`
- Modify: `ipv6-marp-slide-deck.md` (training hubs full-bleed slide, formerly lines 671–678)

- [ ] **Step 1:** Delete the training hubs slide (the `---` block containing `![bg](images/training_hubs.png)` and its three `_header/_footer/_paginate` directives).
- [ ] **Step 2:** Run:
  ```bash
  convert images/apac_logo.png -resize 512x512 -strip images/apac_logo.png
  convert images/ipv6_deployment.png -resize x1600 -strip images/ipv6_deployment.png
  git rm images/training_hubs.png images/ipv6_risks.png
  ```
- [ ] **Step 3:** Run: `du -ch images/* | tail -1` — expect under 1 MB total.
- [ ] **Step 4:** Run the harness; check the title slides (logo) and board page 21 (deployment graphic) look unchanged; `ls -la *.pdf` — expect both PDFs under 4 MB.
- [ ] **Step 5:** Commit: `chore(images): downscale assets and drop unused AI images`

### Task 7: Fresh-clone build test (Review Focus 1, 5)

- [ ] **Step 1:** Run:
  ```bash
  rm -rf /tmp/clonetest && git clone -q /home/terry/ipv6_leaders /tmp/clonetest && cd /tmp/clonetest && make all 2>&1 | grep -iE 'missing|error'
  ```
  Expected: no output. (Google Fonts may fail offline; that is cosmetic and acceptable.)
- [ ] **Step 2:** Run: `pdfinfo /tmp/clonetest/ipv6-marp-slide-deck.pdf | grep Pages` and compare with the repo build — expect equal.
- [ ] **Step 3:** No commit; this task gates Task 8.

### Task 8: Documentation and task list (D1, D3, D4, D5)

**Files:**
- Delete: `ipv6-workshop-detailed-plan.md`
- Modify: `README.md`, `TODO.md`, `STRATEGY.md`

- [ ] **Step 1:** `git rm ipv6-workshop-detailed-plan.md` (STRATEGY.md is the newer copy).
- [ ] **Step 2:** README Contents table: add rows for `ipv6-boardroom-blog.md` ("Blog: IPv6 in the Boardroom — GRC framing for technical staff briefing leadership"), `plan/` ("Review and update plans"), and `Makefile` targets `briefing`, `workshop`, `images`, `clean`. Remove the `TODO.md` row if Step 3 empties it.
- [ ] **Step 3:** Replace `TODO.md` body with: a pointer to `plan/2026-10-19-review.md`, and the P2 items from the review's sections A10, A13, B6–B8, C, D2, D6 as unchecked boxes. Delete all completed items.
- [ ] **Step 4:** STRATEGY.md: add a contact block under the title (Facilitator: Terry Sweetser, IEISI · tcs@ieisi.org · www.ieisi.org/training) and change "Slides N–M" references to section names only (the numbers no longer match).
- [ ] **Step 5:** Run: `grep -c 'Slide' STRATEGY.md` — expect 0; `ls *.md | wc -l` — expect 7.
- [ ] **Step 6:** Commit: `docs: merge plan docs, refresh README and TODO`

### Task 9: Rebuild and publish outputs

- [ ] **Step 1:** Run `make all` and the harness one final time. Both contact sheets: no blank pages.
- [ ] **Step 2:** Run: `git add *.html && git commit -m "build: regenerate HTML decks"` then `git push origin main`.

---

## Self-review notes

- Spec coverage: A1–A9, A11–A12 → Tasks 1–6; A10 (HTML tracking) → Task 9 keeps current practice; A13 (fonts) accepted as-is; D1, D3–D5 → Task 8; D2 and D6 are content work in the slide plan; D7 needs nothing.
- Task 2 removes three images rather than replacing them. That is deliberate: every removed image was either decorative, duplicated by a neighbouring slide, or a licence risk.
- Interfaces between tasks: Task 4 renames two capture files; Task 5 then tracks them. Run in order.
