# IPv6 for Leaders

Training and briefing materials for IPv6 adoption, aimed at senior leaders, managers, and board members.

Developed and maintained by **Terry Sweetser**, Founder & Principal Consultant, [IEISI](https://www.ieisi.org).
Contact: tcs@ieisi.org | Training: www.ieisi.org/training

---

## Contents

| File | Description |
|---|---|
| `ipv6-board-briefing.md` | 20-minute Board/CEO briefing deck |
| `ipv6-marp-slide-deck.md` | Full-day IPv6 for Leaders workshop deck |
| `STRATEGY.md` | Detailed workshop schedule and slide design recommendations |
| `ipv6-workshop-plan.md` | High-level 12-section workshop outline |
| `TODO.md` | Outstanding tasks and known issues |
| `academic.css` | Custom MARP theme (based on Gaia) |

---

## Building

Requires `marp-cli`, `chromium`, and `imagemagick`.

```bash
# Build everything (HTML + PDF for both decks)
make all

# Build individual outputs
make ipv6-board-briefing.html
make ipv6-board-briefing.pdf
make ipv6-marp-slide-deck.html
make ipv6-marp-slide-deck.pdf

# Refresh screenshot images (requires Chromium)
make images
```

---

## Further Reading

- [IPv4 is Technical Debt](https://medium.com/@terrysweetser_90287/ipv4-is-technical-debt-fa6449dc06d4)
- [IPv4 Address Sale Price Trends](https://medium.com/@terrysweetser_90287/ipv4-address-sale-price-trends-abf45620d34f)
- [IPv6 Mandatory, IPv4 Optional](https://medium.com/@terrysweetser_90287/ipv6-mandatory-ipv4-optional-rethinking-address-policy-for-equity-and-sustainability-e698d4973459)

---

## License

© 2026 IEISI. CC BY-NC-SA 4.0
