# TODO

## Board Briefing (`ipv6-board-briefing.md`)

- [ ] **#1** Replace `picsum.photos` placeholder images on pages 2, 4, 6, 17, 23
- [x] **#2** Fix "NAT Is Not Security" heading: H1 → H2
- [x] **#3** Remove stale `<!-- _class: lead -->` directive from "From Scarcity to Abundance" table slide
- [ ] **#16** `academic.css` — blockquote absolute positioning may overlap `<small>` citation lines on some slides

## Workshop Deck (`ipv6-marp-slide-deck.md`)

- [x] **#4** Update footer year: 2025 → 2026
- [x] **#5** Replace APNIC logo (`APNIC-Formal-Logo_web.jpg`) with `images/apac_logo.png` (circular crop, matching board briefing)
- [x] **#6** Update stale adoption stats: global ~40% → ~43%, IPv4 prices $50–60 → ~$20
- [ ] **#7** Verify image files exist — missing: `images/headers.gif`, `images/hilco.png`, `images/apnic_ipv6_rural_cropped.png`; captures require `make images`
- [x] **#8** Add IEISI contact and resources to closing slide (tcs@ieisi.org, www.ieisi.org/training, Medium articles)
- [x] **#9** Incorporate Medium article insights: IPv4 price trajectory, "laziness tax", IPv6-mandatory policy direction

## Supporting Docs

- [ ] **#15** `ipv6-workshop-plan.md` / `ipv6-workshop-detailed-plan.md` / `STRATEGY.md` — update APNIC→IEISI facilitator branding where appropriate, add contact info, add IPv6-first language to Section 9

## APNIC References to Fix

- [x] `ipv6-marp-slide-deck.md` line 14 — `APNIC-Formal-Logo_web.jpg` on title slide (covered by #5)
- [x] `ipv6-marp-slide-deck.md` lines 622–634 — "APNIC and NGO Resources" slide: reframe APNIC training as an external resource, not host offering
- [x] `ipv6-marp-slide-deck.md` line 669 — "APNIC IPv6 Program" only resource link: add IEISI training reference
- [ ] `ipv6-workshop-plan.md` line 83 — "Maximizing value from APNIC training resources" → reframe as external resource

## Completed

- [x] **#12** `.gitignore` rewritten; `images/apac_logo.png` and `images/apnic_ipv6.png` committed
- [x] **#13** Makefile: fixed missing space in `--hide-scrollbars --run-all-compositor-stages-before-draw`
- [x] **#14** Makefile overhauled: `clean`/`clean-images` targets, `briefing`/`workshop` groups, no pptx, `$(CAPTURES)` variable
- [x] **#11** `README.md` rewritten as proper project README
- [x] `STRATEGY.md` created from old README content
- [x] `CLAUDE.md` created with standing orders
- [x] `LICENSE.md` — replaced CC0 with CC BY-NC-SA 4.0, APNIC attribution added
- [x] `images/` and `captures/` directory structure established
- [x] Board briefing footer updated to © 2026 IEISI
- [x] All image refs updated: `images/` for committed assets, `captures/` for screenshots
