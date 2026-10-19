# TODO

The full review with evidence is `plan/2026-10-19-review.md`. P0 and P1 items were turned into `plan/2026-10-19-repo-update-plan.md` (done, 2026-10-19) and `plan/2026-10-19-slide-update-work-plan.md` (content changes, not yet started). What remains here is the P2 list and leftovers.

## Content (owned by the slide update work plan where noted)

- [ ] **B6** Transition mechanisms slide still lists deprecated 6to4/6in4/6rd — slide plan Task W-4
- [ ] **B7** Board slide "NIST, ISO 27001, CIS — requires firewalls" overstates ISO 27001; use the blog's wording — slide plan Task B-2
- [ ] **B8** Unsourced forward claims (mid-2040s projection; "147 meta-analyses"; US IPv6-only mandate in the blog) — slide plan Task B-3
- [ ] **C** Core message missing from the workshop title and closing slides; running header shows on title slides — slide plan Task S-3
- [ ] **C** Workshop agenda slides hardcode PacIGF 2025 session times — slide plan Task W-1
- [ ] **D6** Add a credits/attribution slide for third-party screenshots and the Huston chart — slide plan Task W-6
- [ ] **A3** Known blockquote/footer overlap on the "Why This Matters to Leaders" slide (workshop page 40) — slide plan Task W-8
- [ ] `ipv6-workshop-plan.md` Section 12 — reframe APNIC Academy as an external resource, not a host offering; add IPv6-first language to Section 9

## Repo and build

- [ ] **A10** Decide whether to keep tracking the built HTML (it drifts with marp-core versions) or treat it like the PDFs
- [ ] **A13** `academic.css` loads Noto Sans JP and Source Code Pro from Google Fonts; offline venues fall back to system fonts
- [ ] **D2** `STRATEGY.md` "Key Visuals to Develop" list is undeveloped; build the visuals or cut the list
- [ ] `make clean-images` deletes the now-tracked `captures/`; redefine as `git checkout -- captures` or drop the target
- [ ] PDF/HTML targets depend only on the `.md` files; add `images/*` and `captures/*` as prerequisites so `make all` rebuilds after an image change
- [ ] `images/apac_logo.png` (324 KB) and `images/ipv6_deployment.png` (710 KB) are opaque PNGs; JPEG at q85 would be about 30 KB and 114 KB
- [ ] Board page 4: Huston chart x-axis label touches the page number
- [ ] Cookie-consent banners visible in the MDPI and infoblox captures (workshop pages 35, 51)
- [ ] Makefile `--user-agent` pins Chrome/130 for every capture; only MDPI needs it now that RFC 7381 comes from rfc-editor.org
