# Slide Update Work Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Bring the content of both decks up to date and make every number and claim on them defensible in front of a Pacific board.

**Architecture:** Edits are to the two Marp sources only. Each task names the slide by its current heading, gives the exact replacement text where a value is pinned, and ends with a render check. Run after `plan/2026-10-19-repo-update-plan.md` Tasks 1–6 so line numbers and image paths are stable.

**Tech Stack:** Marp Markdown; APNIC Labs per-economy pages for data; Python 3 for the Pacific table.

**Spec:** `plan/2026-10-19-review.md` (findings B1–B8, C, D2, D6).

## Global Constraints

- Core message wording is exactly: **IPv4 slows down growth. IPv6 enables it.**
- No Western-centric analogies.
- Every statistic on a slide carries a source and a date on the same slide.
- Forecasts are labelled as projections.
- Keep slides to the existing density: 5–7 bullets, one blockquote.

## Review Focus

1. A board member checks a number on their phone during the talk: every figure must match the cited page on the build date (Task S-1, S-2 checks).
2. A domestic operator in the room says "our country is already at 50%": the Pacific slide must make the Starlink split explicit (Task S-2).
3. A security lead objects to "IPsec built in": Task W-2 removes it.
4. Someone asks "says who?" about 2028: Task B-3 labels it a projection with a market source.
5. The PDF is presented, not the HTML: no facilitator-only text may be a visible slide (Task W-7).

## Data refresh procedure (used by S-1 and S-2)

Economy-level figures: open `https://stats.labs.apnic.net/ipv6/XA`; the table lists World and each economy's "IPv6 Capable" over the last 30 days.

Per-network split for the Pacific (Starlink is AS14593). Save as `plan/tools/pacific_ipv6_by_network.py` in Task S-2 and run with `python3 -I`:

```python
import re, sys, urllib.request
PAT = re.compile(r'>(AS\d+)</a>","([^"]*)",\{v: ([0-9.]+), f:\'[0-9.]+%\'\},\{v: [0-9.]+, f: \'[0-9.]+%\'\},(\d+)\]')
for cc in sys.argv[1:]:
    html = urllib.request.urlopen(urllib.request.Request(
        f"https://stats.labs.apnic.net/ipv6/{cc}", headers={"User-Agent": "Mozilla/5.0"})).read().decode("utf-8", "ignore")
    rows = [(a, n, float(c), int(s)) for a, n, c, s in PAT.findall(html)]
    v6 = sum(s * c / 100 for _, _, c, s in rows) or 1
    sl = sum(s * c / 100 for a, _, c, s in rows if a == "AS14593")
    top = max((r for r in rows if r[0] != "AS14593"), key=lambda r: r[3] * r[2], default=None)
    domestic = f"{top[1].split(' - ')[-1]} {top[2]:.0f}% capable" if top else "none measured"
    print(f"{cc}: Starlink {100*sl/v6:.0f}% of IPv6 samples; largest domestic IPv6 network: {domestic}")
```
Run: `python3 -I plan/tools/pacific_ipv6_by_network.py KI NR TV CK FJ TO PG WS VU SB FM MH`

---

## Shared tasks (both decks)

### Task S-1: Refresh adoption statistics (B1)

**Files:**
- Modify: `ipv6-board-briefing.md` slide "Global Adoption Is Already Underway"
- Modify: `ipv6-marp-slide-deck.md` slide "Global and Regional Adoption Trends"

- [ ] **Step 1:** Read the live figures (procedure above). On 2026-10-17 they were: World 43.6, India 76.4, France 85.7, Germany 72.7, USA 62.1, Australia 47.6, New Zealand 33.0. Use the day-of-build values, rounded to whole numbers with `~`.
- [ ] **Step 2:** Board slide: replace the seven stat bullets' numbers; replace the source line with `<small>_Source: APNIC Labs, 30 days to <YYYY-MM-DD>. Google IPv6 statistics: <N>% (checked <date>)._</small>`. Check the Google figure by hand at google.com/intl/en/ipv6/statistics.html.
- [ ] **Step 3:** Workshop slide: same numbers; the "(APNIC Labs, March 2026)" tag → "(APNIC Labs, <Month YYYY>)".
- [ ] **Step 4:** Run `make images` so the five screenshot slides carry the same date.
- [ ] **Step 5:** Render board page 11 and workshop pages 24–30; dates on screenshots match the source line.
- [ ] **Step 6:** Commit: `content(decks): refresh APNIC Labs adoption statistics to <Month YYYY>`

### Task S-2: Add the Pacific per-network slide and sharpen the Pacific line (B2)

**Files:**
- Create: `plan/tools/pacific_ipv6_by_network.py` (script above)
- Modify: both decks, immediately after the global adoption slide

- [ ] **Step 1:** Save the script; run it; keep the output for the source line.
- [ ] **Step 2:** In both decks change `Pacific Islands: early stage — a **first-mover opportunity**` to `Pacific Islands: domestic operators at an early stage — a **first domestic-mover opportunity**`.
- [ ] **Step 3:** Insert this slide after the global adoption slide in both decks (values from Step 1; the ones below are from 2026-10-17):

```markdown
---

## Pacific IPv6 Today: Who Is Delivering It?

<style scoped>
table { font-size: 0.72em; }
blockquote { font-size: 0.8em; }
</style>

| Economy | IPv6-capable users | Carried by Starlink | Domestic operators |
|---|---|---|---|
| Kiribati, Nauru, Tuvalu | 50–57% | ~100% | 0% |
| Cook Islands, Samoa, FSM, Vanuatu | 9–41% | ~100% | 0% |
| Solomon Islands, Marshall Islands | 15–29% | ~96% | SATSOL 18%; others 0% |
| Tonga | 31% | ~48% | Tonga Communications 29% |
| PNG | 27% | ~12% | Digitec 51% |
| Fiji | 41% | ~5% | Vodafone Fiji 60% |

> Starlink delivers IPv6 to your citizens today. Most domestic operators deliver none. Fiji and PNG show it can be done.
> **IPv4 slows down growth. IPv6 enables it.**

<small>_Source: APNIC Labs per-network data, 30 days to <YYYY-MM-DD>; Starlink = AS14593. Small samples for Vanuatu, Nauru, Tuvalu._</small>
```
- [ ] **Step 4:** Render the new page in both decks; table fits above the blockquote, blockquote clear of the footer. If not, drop the `<small>` line into the blockquote.
- [ ] **Step 5:** Commit: `content(decks): add Pacific per-network IPv6 slide; sharpen Pacific framing`

### Task S-3: Put the core message on the workshop title and closing slides (C)

**Files:**
- Modify: `ipv6-marp-slide-deck.md` title slide and "Thank You!" slide

- [ ] **Step 1:** Title slide: `### A Strategic Guide for Decision Makers` → `### IPv4 slows down growth. IPv6 enables it.`
- [ ] **Step 2:** "Thank You!" slide: add `> **IPv4 slows down growth. IPv6 enables it.**` above the contact line.
- [ ] **Step 3:** Add `<!-- _header: "" -->` as the first line of both decks' title slides.
- [ ] **Step 4:** Render pages 1 and the last page of each deck.
- [ ] **Step 5:** Commit: `content(workshop): core message on title and closing; no header on title slides`

---

## Board briefing tasks (`ipv6-board-briefing.md`)

### Task B-1: Label IPv4 price forecasts as projections and add the 2026 actual (B4)

**Slides:** "The Cost of Inaction — Operations", "The IPv4 Market Is Closing", "Typical Deployment Pathway"

- [ ] **Step 1:** Check a current per-address price by hand (IPv4.Global price report or Hilco Streambank auction results). Record value and date.
- [ ] **Step 2:** "The IPv4 Market Is Closing" first bullet → `**IEISI projection:** $60+ (2022) → ~$20 (2025) → below $10 (2026–27) → economically worthless (2028)`; add a second bullet `**<Month YYYY> actual:** ~$<N> per address (<source>)`.
- [ ] **Step 3:** Same slide, bullet "Dual-stack operational costs will exceed IPv4 utility by **2028**" → `On current trends, dual-stack operational costs exceed IPv4 utility by **2028**`.
- [ ] **Step 4:** Source line → `<small>_Sources: <broker>, <date>; [IPv4 Address Sale Price Trends](…) — Terry Sweetser, IEISI_</small>`
- [ ] **Step 5:** "Typical Deployment Pathway" blockquote second line → `On current trends, by 2028 IPv4 operational costs exceed utility. Organisations not yet on this pathway will be managing a crisis, not a project.`
- [ ] **Step 6:** Render pages 8, 10, 21.
- [ ] **Step 7:** Commit: `content(board): label price forecasts as projections; add current price`

### Task B-2: Soften the security-framework claim (B7)

**Slide:** "NAT Is Not Security"

- [ ] **Step 1:** Bullet `**Every serious security framework — NIST, ISO 27001, CIS — requires firewalls, not NAT**` → `**NIST, ISO 27001 and CIS all require you to govern what is on your network — NAT does not do that; firewalls and policy do**`
- [ ] **Step 2:** Render page 16; commit: `content(board): accurate wording for security frameworks`

### Task B-3: Source the forward claims (B8)

**Slides:** "Global Adoption Is Already Underway", "Why Adoption Stalls"

- [ ] **Step 1:** "mid-2040s" bullet → append ` (APNIC Labs trend; see Huston, "IPv6 in 2024")` or the specific APNIC blog post you rely on.
- [ ] **Step 2:** "Why Adoption Stalls" source line: append `; primary: Albarracín et al., Nature Reviews Psychology, 2024`.
- [ ] **Step 3:** Render pages 11, 19; commit: `content(board): add sources for adoption projection and meta-analysis claim`

---

## Workshop deck tasks (`ipv6-marp-slide-deck.md`)

### Task W-1: Agenda times (C)

**Slides:** "Workshop Agenda (1)", "(2)"

- [ ] **Step 1:** `### Session One (11:45 AM - 1:15 PM)` → `### Session One (90 minutes)`; `### Session Two (2:00 PM - 3:30 PM)` → `### Session Two (90 minutes)`.
- [ ] **Step 2:** Commit: `content(workshop): remove event-specific times from agenda`

### Task W-2: Remove "Built-in security with IPsec" (B3)

**Slide:** "Key Differences That Matter to Leaders"

- [ ] **Step 1:** Bullet `Built-in security with IPsec` → `Same security tools apply — firewalls, TLS, IPsec — no protocol is "secure by default"`
- [ ] **Step 2:** Render page 8; commit: `content(workshop): remove IPsec built-in security claim`

### Task W-3: Replace the IoT figure (B5)

**Slide:** "IoT and Massive Scaling"

- [ ] **Step 1:** `Projected: 75 billion IoT devices by 2030` → `Tens of billions of connected devices by 2030 — more than IPv4 can ever address` and add `<small>_Source: IoT Analytics, State of IoT <year>_</small>` with the figure you take from that report, or leave the bullet unnumbered.
- [ ] **Step 2:** Commit: `content(workshop): replace superseded IoT projection`

### Task W-4: Modernise the transition mechanisms slide (B6)

**Slide:** "Transition Mechanisms"

- [ ] **Step 1:** Replace the bullet list with:
  ```markdown
  - **Dual-stack** — run both; the common first step, not the destination
  - **IPv6-mostly** — IPv6 by default, IPv4 only for devices that ask (RFC 8925)
  - **IPv6-only with translation** — NAT64/DNS64 and 464XLAT for legacy IPv4 services
  - Selection criteria: what your users' devices support, what your vendors support, how you will retire IPv4
  ```
- [ ] **Step 2:** Render the page; commit: `content(workshop): drop deprecated tunnelling, add IPv6-mostly`

### Task W-5: Fix the IPv4 pricing line to match the board deck (B4)

**Slide:** "The Growth Problem"

- [ ] **Step 1:** Bullet `IPv4 address prices: **$60+ (2022 peak) → ~$20 (2025)** — and still falling` → `IPv4 address prices: **$60+ (2022 peak) → ~$<N> (<Month YYYY>)** — and still falling` using the Task B-1 value.
- [ ] **Step 2:** Commit: `content(workshop): current IPv4 price`

### Task W-6: Add a credits slide (D6)

**Slide:** new, before "Thank You!"

- [ ] **Step 1:** Insert:
  ```markdown
  ---

  ## Credits and Sources

  <style scoped> li { font-size: 0.75em; } </style>

  - APNIC Labs measurements — stats.labs.apnic.net (screenshots reproduced with attribution)
  - Google IPv6 statistics — google.com/intl/en/ipv6/statistics.html
  - Geoff Huston, APNIC — RIR IPv4 exhaustion projection (CC BY-SA)
  - IETF RFC 7381 — Enterprise IPv6 Deployment Guidelines
  - Infoblox IPv6 CoE — "The First Steps in IPv6 Adoption: Having a Plan"
  - APNIC Blog — "The realities of building an IPv6-only city" (2024)
  - MDPI Applied System Innovation 3(1):4 — rural IPv6 case study
  - Internet Society Pulse — "Why IPv6 Adoption Is Stalled" (2025)
  - Theme: academic (kaisugi, MIT)

  Screenshots are reproduced for commentary; their copyright remains with the sources. This deck's CC BY-NC-SA licence covers IEISI's own content.
  ```
- [ ] **Step 2:** Render; commit: `content(workshop): add credits slide`

### Task W-7: Move the facilitator note into presenter notes (C)

**Slides:** "What is IPv6?" and the following facilitator-note slide

- [ ] **Step 1:** Delete the facilitator-note slide (the block with `<!-- _class: lead -->`).
- [ ] **Step 2:** At the end of the "What is IPv6?" slide add:
  ```markdown
  <!--
  Facilitator note: keep technical detail out of this workshop. The audience are managers and leaders, not engineers. For protocol mechanics, point them to the technical track: github.com/IEISI-ORG/ipv6_training
  -->
  ```
- [ ] **Step 3:** Run: `marp --allow-local-files --pdf --pdf-notes ipv6-marp-slide-deck.md -o /tmp/notes.pdf && pdftotext /tmp/notes.pdf - | grep -c 'Facilitator note'` — expect 1. Then `make workshop`; page count drops by one.
- [ ] **Step 4:** Commit: `content(workshop): facilitator note becomes presenter note`

### Task W-8: Split the governance slide so the call to action is visible (A3)

**Slide:** "Why This Matters to Leaders"

- [ ] **Step 1:** Keep the first five bullets (policy, voice, sovereignty, governance issue, APNIC membership) on this slide with the blockquote `> The organisations setting Internet rules are accessible. The question is whether you are at the table.`
- [ ] **Step 2:** New slide `## Get to the Table` with the PICISOC bullet, the Pacific IGF bullet, and `> **Action: Attend the next Pacific IGF. Register at [picisoc.org](https://picisoc.org/)**`.
- [ ] **Step 3:** Render both pages; the Action line is visible and clear of the footer.
- [ ] **Step 4:** Commit: `fix(workshop): split governance slide so the Pacific IGF action is visible`

### Task W-9: Reconcile STRATEGY.md with the deck (D2)

**Files:** `STRATEGY.md`, `ipv6-marp-slide-deck.md`

- [ ] **Step 1:** Delete the "Key Visuals to Develop" section from STRATEGY.md, or keep only the items you intend to build before the next delivery.
- [ ] **Step 2:** Delete the 25 `<!-- [IMAGE PLACEHOLDER: …] -->` comments from the deck (`grep -c 'IMAGE PLACEHOLDER'` → 0), or convert the ones you will build into TODO items.
- [ ] **Step 3:** Commit: `docs: reconcile STRATEGY with the deck`

---

## Order of work

1. Repo plan Tasks 1–6 (build is clean).
2. S-1, S-2 (data), then B-1/W-5 (price), since both need a hand check on the day.
3. W-2, W-3, W-4, B-2, B-3 (wording).
4. W-7, W-8, S-3, W-1, W-6 (structure).
5. W-9, then repo plan Tasks 7–9 (clone test, docs, rebuild, push).

## Self-review notes

- Spec coverage: B1 → S-1; B2 → S-2; B3 → W-2; B4 → B-1, W-5; B5 → W-3; B6 → W-4; B7 → B-2; B8 → B-3; C → S-3, W-1, W-7; A3 → W-8; D2 → W-9; D6 → W-6.
- Values left open on purpose: the day-of-build statistics and the current IPv4 price. Each task says where to get them.
- Not planned: the eight "Key Visuals" in STRATEGY.md. W-9 cuts the list unless a date is booked.
