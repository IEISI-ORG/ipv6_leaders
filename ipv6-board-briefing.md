---
marp: true
theme: academic
paginate: true
header: "IPv6: Board & Executive Briefing"
footer: "© 2026 IEISI: CC BY-NC-SA 4.0 | tcs@ieisi.org | www.ieisi.org"
---

<!-- 
MARP Slide Deck: IPv6 Board & Executive Briefing
20-minute presentation for senior leaders, board members, and C-suite executives
Designed for strategic decision-making, not technical deep-dives
-->
<style scoped>
h1, h3 { margin-left: 240px; }
img.logo { position: absolute; left: 40px; top: 50%; transform: translateY(-50%); width: 180px; height: 180px; object-fit: cover; border-radius: 50%; }
</style>

<img class="logo" src="images/apac_logo.png">

# IPv6: A Board Briefing
### IPv4 slows down growth. IPv6 enables it.

---
![bg right:40%](https://picsum.photos/800?image=1)

# What We Will Cover

**The core message:** IPv4 slows down growth. IPv6 enables it.

- Why IPv4 is a barrier — not just a cost
- The global transition already underway
- What the Pacific stands to gain
- What your organisation needs to decide

> **20 minutes. No jargon. Clear decisions.**

---

# Section 1: The Internet's Address Crisis

---
![bg right:30%](https://picsum.photos/800?image=10)

## The Internet Has Run Out of Addresses

<style scoped>
li, blockquote { font-size: 0.76em; }
</style>

- The Internet runs on numbered addresses (like phone numbers)
- **IPv4** supports ~4.3 billion addresses — now all allocated
- Global pool (IANA) exhausted: **February 2011**
- Asia Pacific (APNIC): **April 2011**
- Europe (RIPE NCC): **September 2012**
- Latin America (LACNIC): **June 2014**
- North America (ARIN): **September 2015**
- Workarounds exist — they add expense, complexity, and operational risk

> **This is not a future problem. It is a present one.**

---

## From Scarcity to Abundance

<!-- _class: lead -->
<style scoped>
table { font-size: 0.85em; }
</style>

| | IPv4 | IPv6 |
|---|---|---|
| **Address space** | 4.3 billion | 340 undecillion |
| **Per person** | Less than 1 | Billions |
| **Cost trend** | Peaked 2022; now declining | Standard deployment |
| **Workarounds needed?** | Yes — CGNAT, NAT | No |
| **End-to-end connectivity** | Compromised | Restored |
| **Impact on growth** | **Slows it down** | **Enables it** |

> IPv6 was designed to solve this problem and has been production-ready for over a decade.

---
![bg right:30%](https://picsum.photos/800?image=6)

## What Your Organisation Is Probably Already Doing

- Using **CGNAT** — sharing one address with thousands of others
- Paying a **premium** for IPv4 addresses on secondary markets
- Running **dual-stack** infrastructure without a plan
- Relying on vendors to "handle it" — without governance oversight

> **These are operational costs and risks already on your books.**

---

# Section 2: Strategic Risk & Business Case

---

## The Cost of Inaction — Operations

- IPv4 address prices: **$60+ (2022 peak) → ~$20 (2025)** — and still falling
- All major vendors (Cisco, Juniper, Arista, Dell) have shipped IPv6-capable hardware as standard since the mid-2010s — **no additional licensing cost**
- CGNAT infrastructure costs, complexity, and helpdesk burden remain regardless
- Continuing to lease IPv4 is a **"laziness tax"** — paying a premium for inertia

> The transition cost is now organisational, not technical. Leadership is the bottleneck.

<small>_RFC 9386 (IETF, 2023): new equipment and most operating systems have supported IPv6 for many years. The barrier is no longer hardware._</small>

---

## The Cost of Inaction — Strategy

- **IPv4 actively constrains growth** — IoT, 5G, and cloud-native services need address space that IPv4 cannot provide
- Reduced performance for customers already on IPv6-only networks
- Policy direction is moving toward **IPv6 mandatory, IPv4 optional** — organisations that wait face mandates, not choices
- Vendor lock-in to legacy workarounds

> Every year on IPv4 is a year your infrastructure cannot grow at full speed.

---

## The IPv4 Market Is Closing

<style scoped>
li, blockquote, p { font-size: 0.9em; }
</style>

- **$60+ (2022) → ~$20 (2025) → below $10 (2026–27) → economically worthless (2028)**
- Bid-ask spread is now unbridgeable — sellers expect $50+, buyers offer $20
- IPv4 addresses are *technical debt*, not assets — their value was always artificial scarcity, not inherent utility
- Once substitution costs reach zero, the asset doesn't gradually depreciate — it **crashes to scrap value**
- Dual-stack operational costs will exceed IPv4 utility by **2028**

> This is not a cyclical correction. The IPv4 market has a known end date — and it is close.

<small>_Source: [IPv4 Address Sale Price Trends](https://medium.com/@terrysweetser_90287/ipv4-address-sale-price-trends-abf45620d34f) — Terry Sweetser, IEISI_</small>

---

## Global Adoption Is Already Underway

- Global: **~43%** IPv6-capable (APNIC Labs) / **~47%** of Google traffic over IPv6
- India: **~78%** — the world's largest IPv6 deployment, driven by Reliance Jio
- France: **~86%**; Germany: **~74%** — European leaders
- USA: **~59%** IPv6-capable across all traffic
- Australia: **~44%**; New Zealand: **~30%** — both with room to grow
- Pacific Islands: early stage — a **first-mover opportunity**
- Without policy intervention, universal adoption is projected for the **mid-2040s**

> Waiting for the market to force the transition means waiting two decades.

<small>_Source: APNIC Labs, 2 March – 31 March 2026 (926.8M samples). Last updated: April 2026._</small>

---

## IPv4 Scarcity Is Not Neutral

- Early-adopting regions (North America, Europe) hold **vast legacy allocations**
- Late-adopting regions (Pacific, Africa, South Asia) face scarcity-driven costs
- IPv4 leasing markets extract **economic rents from developing economies**
- Scarce capital is diverted from infrastructure into address fees
- IPv6 eliminates regional inequity — **abundant address space, no legacy advantage**

> IPv4 slows down growth for the Pacific. IPv6 levels the playing field.

---

## Competitive and Strategic Upside

![bg 65% opacity:0.15](https://www.un.org/sites/un2.un.org/files/2020/06/sdg9-en.png)

**Operational efficiency**
- Simplified network architecture — remove NAT layers
- Lower long-term address costs

**Growth enablement**
- IoT, smart infrastructure, and 5G need vast address space

**Reputational positioning**
- Demonstrates digital maturity to partners and regulators
- Aligns with SDG 9 (Industry, Innovation, Infrastructure)

> IPv6 is infrastructure for the next 30 years.

---

# Section 3: Security — Myth vs. Reality

---

## "But Isn't IPv6 Less Secure?"

**The myth:** NAT provides security
**The reality:** NAT is an address workaround, not a security control

**What does not change with IPv6:**
- Firewalls are still required — and still work
- Encryption standards (TLS, IPsec) are unchanged
- Access control policy remains your organisation's responsibility

> Security posture is determined by policy and architecture — not protocol version.

---

# NAT Is Not Security

- NAT hides internal addresses — it does **not** inspect, filter, or block threats
- Malware, phishing, and insider threats all operate freely behind NAT
- NAT breaks end-to-end connectivity — it does not protect it
- A firewall with no NAT is more secure than NAT with no firewall
- **Every serious security framework — NIST, ISO 27001, CIS — requires firewalls, not NAT**

> If your security strategy depends on NAT, you do not have a security strategy.

---
![bg right:25%](https://picsum.photos/800?image=60)

## Governance Implication: You Need a Policy

<style scoped>
li, p, blockquote { font-size: 0.8em; }
</style>

Organisations without an IPv6 policy face:
- Unmanaged IPv6 traffic (it is already on most networks)
- Shadow addressing — devices self-assigning addresses
- Security tools that only monitor IPv4

**Board-level question:**
> Does our security policy explicitly cover IPv6?

If the answer is "we don't know" — that is the first action item.

---

# Section 4: Where You Stand & What to Decide

---

## A Simple Maturity Model

<style scoped>
table { font-size: 0.85em; }
</style>

| Stage | Description | Typical Organisations |
|---|---|---|
| **Unaware** | IPv6 not on the radar | Small/legacy operators |
| **Aware** | Knows it's needed, no plan | Most organisations today |
| **Planning** | Strategy and roadmap in development | Proactive leaders |
| **Deploying** | Active dual-stack rollout | Progressive operators |
| **IPv6-first** | IPv6 default, IPv4 legacy | Major ISPs, hyperscalers |

> **Where are you? Where do you need to be?**

---

## Typical Deployment Pathway

<style scoped>
li, strong, blockquote, p { font-size: 0.72em; }
</style>

**Months 1–3 — Foundation**
- Audit IPv4 costs; obtain IPv6 allocation; develop policy

**Months 6–12 — Dual-Stack**
- Enable IPv6 on external services; roll out internally; train teams

**Year 2 — IPv6-First**
- All new services deploy IPv6-first; IPv4 maintained for compatibility only

**Year 3+ — IPv6-Mostly**
- IPv4 dependencies progressively retired; IPv4 becomes the exception

> Dual-stack is a transition, not a destination — plan your exit from the start.
> By 2028, IPv4 operational costs exceed utility. Organisations not yet on this pathway will be managing a crisis, not a project.

---

## Questions to Ask Your Technical Team

1. What percentage of our traffic is currently over IPv6?
2. Do we have an IPv6 address allocation from our ISP or RIR?
3. Does our security policy explicitly cover IPv6?
4. What is our annual spend on IPv4 addresses?
5. Which of our vendors and cloud providers support IPv6?
6. Do we have a target date for dual-stack deployment?
7. **What is our plan to move beyond dual-stack to IPv6-first?**

> Dual-stack is a transition, not a destination. Planning beyond it needs to start now.

---

# Section 5: The Governance Framework

---
![bg right:25%](https://picsum.photos/800?image=48)

## Who Runs the Internet?

- **IANA / ICANN** — coordinates global address policy
- **Regional Internet Registries (RIRs)** — regional allocation
  - APNIC covers Asia Pacific
- **IETF** — develops technical standards (including IPv6)
- **Your ISP** — your direct relationship for address allocation
- **Your organisation** — responsible for your own deployment

> IPv6 addresses are allocated, not purchased.

---

## APNIC: Your Regional Resource

![bg contain opacity:0.2](images/apnic_ipv6.png)

**What APNIC provides:**
- IPv6 address allocation and policy
- Training and capacity building
- Open adoption data (APNIC Labs)
- Participation in Internet governance forums

**Relevance to your board:**
- Membership is low-cost relative to IPv4 market prices
- Training available for both technical and leadership staff
- Your adoption contributes to national and regional readiness

---

# Section 6: Recommendations & Next Steps

---

## Board-Level Recommendations

<style scoped>
li, strong { font-size: 0.82em; }
.columns { display: grid; grid-template-columns: 1fr 1fr 1fr; gap: 1.5em; margin-top: 0.5em; }
</style>

<div class="columns">
<div>

**Immediate (within 90 days)**
- Direct ICT to produce an IPv6 readiness report
- Include IPv6 in the next ICT strategy review
- Confirm IPv6 coverage in the security policy

</div>
<div>

**Medium-term (within 12 months)**
- Approve a deployment roadmap with milestones and budget
- Include IPv6 KPIs in ICT reporting to the board
- Engage APNIC or your ISP on address allocation

</div>
<div>

**Ongoing**
- Monitor APNIC Labs adoption benchmarks
- Make IPv6 a mandatory procurement criterion

</div>
</div>

---

## The One-Slide Summary

<style scoped>
table { font-size: 0.9em; }
blockquote { font-size: 0.85em; }
</style>

| | |
|---|---|
| **The message** | IPv4 slows down growth. IPv6 enables it. |
| **The problem** | IPv4 is exhausted — workarounds cap your potential |
| **The solution** | IPv6 — abundant, global, production-ready |
| **The risk** | Inaction means constrained growth and rising costs |
| **Your role** | Commission the plan, approve the roadmap |

> IPv6 is not a technical project. It is a growth decision.

---
# Thank You

### Questions & Discussion

<style scoped>
li, p { font-size: 0.85em; }
</style>

**Further resources:**
- APNIC Academy: academy.apnic.net
- APNIC Labs adoption data: labs.apnic.net
- [IPv4 is Technical Debt](https://medium.com/@terrysweetser_90287/ipv4-is-technical-debt-fa6449dc06d4)
- [IPv4 Address Sale Price Trends](https://medium.com/@terrysweetser_90287/ipv4-address-sale-price-trends-abf45620d34f)
- [IPv6 Mandatory, IPv4 Optional](https://medium.com/@terrysweetser_90287/ipv6-mandatory-ipv4-optional-rethinking-address-policy-for-equity-and-sustainability-e698d4973459)
- IPv6 for Leaders workshop (full day): [www.ieisi.org/training](https://www.ieisi.org/training)

**Contact:**
tcs@ieisi.org | www.ieisi.org
