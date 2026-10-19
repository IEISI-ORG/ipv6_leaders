# IPv6 for Leaders

Training and briefing materials for IPv6 adoption, aimed at senior leaders, managers, and board members.

Developed and maintained by **Terry Sweetser**, Founder & Principal Consultant, [IEISI](https://www.ieisi.org).
Contact: terry@ieisi.org | Training: ieisi.org/training

---

## Contents

| File | Description |
|---|---|
| `ipv6-board-briefing.md` | 20-minute Board/CEO briefing deck |
| `ipv6-marp-slide-deck.md` | Full-day IPv6 for Leaders workshop deck |
| `ipv6-boardroom-blog.md` | Blog: IPv6 in the Boardroom — GRC framing for technical staff briefing leadership |
| `STRATEGY.md` | Detailed workshop schedule and slide design recommendations |
| `ipv6-workshop-plan.md` | High-level 12-section workshop outline |
| `TODO.md` | Outstanding tasks and known issues |
| `plan/` | Review and update plans (2026-10-19 review, repo update plan, slide update work plan) |
| `Makefile` | Build targets: `all`, `briefing`, `workshop`, `images`, `clean` |
| `ieisi.css` | IEISI Marp theme (navy/blue/red, Roboto Flex), built from the www.ieisi.org look |

---

## Building

Requires `marp-cli`, `chromium`, and `imagemagick`.

```bash
# Build everything (HTML + PDF for both decks)
make all

# Build one deck
make briefing      # ipv6-board-briefing.html + .pdf
make workshop      # ipv6-marp-slide-deck.html + .pdf

# Force a rebuild after changing images (targets depend only on the .md files)
make -B all

# Refresh the screenshots in captures/ (requires Chromium and network)
make images

# Remove build outputs
make clean
```

`captures/` is tracked in git so a fresh clone builds offline. After `make images`, open every changed capture before committing: some sites serve block or consent pages to headless browsers.

---

## Further Reading

- [IPv4 is Technical Debt](https://medium.com/@terrysweetser_90287/ipv4-is-technical-debt-fa6449dc06d4)
- [IPv4 Address Sale Price Trends](https://medium.com/@terrysweetser_90287/ipv4-address-sale-price-trends-abf45620d34f)
- [IPv6 Mandatory, IPv4 Optional](https://medium.com/@terrysweetser_90287/ipv6-mandatory-ipv4-optional-rethinking-address-policy-for-equity-and-sustainability-e698d4973459)

---

## License

© 2026 IEISI. CC BY-NC-SA 4.0
