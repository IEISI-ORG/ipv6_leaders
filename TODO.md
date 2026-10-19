# TODO

The full review with evidence is `plan/2026-10-19-review.md`. P0 and P1 items were turned into `plan/2026-10-19-repo-update-plan.md` (done, 2026-10-19) and `plan/2026-10-19-slide-update-work-plan.md` (done, 2026-10-19). What remains here is the P2 list, leftovers, and the reviewers' deferred minors.

## Content (owned by the slide update work plan where noted)

- [ ] **B8** Blog: cite OMB M-21-07 for the US federal IPv6-only mandate
- [ ] Pacific slide: column header "Carried by Starlink" means share of IPv6 samples, not share of users; consider "Share of IPv6 via Starlink"
- [ ] Pacific slide: New Caledonia (MLS ~50%, CANL ~20%) and French Polynesia (ONATI ~37%) have real domestic IPv6 and are not on the slide; "Fiji and PNG show it can be done" undersells the region
- [ ] Board "The IPv4 Market Is Closing": the IEISI projection "below $10 (2026–27)" sits beside an October 2026 actual of $14–37 with prices rising since August; revisit the projection
- [ ] Board "Typical Deployment Pathway": `images/ipv6_deployment.png` still says "By 2028, IPv4 costs exceed utility" without the "on current trends" qualifier
- [ ] Board "Why Adoption Stalls": Albarracín et al. cover health and environmental behaviour; applying them to IPv6 rollout is an extrapolation and should be worded as one
- [ ] `plan/tools/pacific_ipv6_by_network.py`: exclude non-access networks (Cloudflare AS13335, Kacific AS135409) from "domestic", fail when no rows parse, print sample sizes
- [ ] `ipv6-workshop-plan.md` Section 12 — reframe APNIC Academy as an external resource, not a host offering; add IPv6-first language to Section 9

## Repo and build

- [ ] **Theme is not applied.** Both decks declare `theme: academic` but neither the Makefile nor the CLAUDE.md build commands pass `--theme-set academic.css`, so Marp's default theme renders every slide and `academic.css` is unused. With the theme applied, board pages 10 and 12 overflow. Decide: drop `theme: academic` and the CSS, or adopt the theme and re-layout
- [ ] **A10** Decide whether to keep tracking the built HTML (it drifts with marp-core versions) or treat it like the PDFs
- [ ] **A13** `academic.css` loads Noto Sans JP and Source Code Pro from Google Fonts; offline venues fall back to system fonts
- [ ] `make clean-images` deletes the now-tracked `captures/`; redefine as `git checkout -- captures` or drop the target
- [ ] PDF/HTML targets depend only on the `.md` files; add `images/*` and `captures/*` as prerequisites so `make all` rebuilds after an image change
- [ ] `images/apac_logo.png` (324 KB) and `images/ipv6_deployment.png` (710 KB) are opaque PNGs; JPEG at q85 would be about 30 KB and 114 KB
- [ ] Board page 4: Huston chart x-axis label touches the page number
- [ ] Cookie-consent banners visible in the MDPI and infoblox captures (workshop pages 35, 51)
- [ ] Makefile `--user-agent` pins Chrome/130 for every capture; only MDPI needs it now that RFC 7381 comes from rfc-editor.org
