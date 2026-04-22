# IPv6 in the Boardroom

---

You already know IPv6 is overdue. You've known for years. You've probably sat in a meeting where you laid out the case — address exhaustion, rising costs, growth constraints — and watched leadership nod politely before approving the budget for another batch of leased IPv4 addresses.

This post isn't about the protocol. It's about why that keeps happening, and how to have a different conversation.

---

## Why the standard pitch doesn't work

When technical people brief executives on IPv6, we almost always lead with how it works. It's a reflex — we know the material, we find it interesting, we figure that once leadership understands the problem they'll see why it matters.

But here's the uncomfortable truth: research across 147 meta-analyses of behavioural interventions found that knowledge-based approaches have negligible effect on behaviour change. Organisations don't stall on IPv6 because they don't understand the case. Most of them understand it just fine. They stall because IPv6 deployment isn't the path of least resistance — it requires deliberate effort, budget, cross-team coordination, and someone senior enough to absorb the political cost of change. If leadership hasn't explicitly made it a priority, every competing demand wins by default.

So if your IPv6 advocacy has mostly consisted of explaining why IPv6 is needed, you've been optimising for the wrong thing. The problem isn't knowledge. It's framing — and the frame that actually moves things in a boardroom is GRC: Governance, Risk, and Compliance.

---

## Speak GRC and the board listens

GRC is the native language of boards and senior leadership. Risk registers, audit findings, compliance obligations, governance gaps — these trigger different organisational responses than "infrastructure upgrade." Here's how IPv6 maps onto each:

**Governance:** IPv6 is already on your network. Modern operating systems enable it by default. Devices self-assign IPv6 addresses the moment they connect. If IPv6 isn't explicitly in your governance framework, you're not preventing it — you're just not managing it. That's a governance gap, and it's board-level accountability.

**Risk:** The risk register should carry at least three IPv6-related entries. First: unmanaged IPv6 traffic is a security blind spot — most monitoring tools default to IPv4, which means threats moving over IPv6 may not be visible. Second: continuing dependence on IPv4 workarounds is operational risk — CGNAT adds complexity, latency, and helpdesk load, and the vendors selling those workarounds are quietly winding them down. Third: the IPv4 secondary market is in terminal decline (more on this below) — organisations holding IPv4 allocations as assets are holding technical debt with a known expiry.

**Compliance:** This one is moving fast. The US federal government has mandated IPv6-only for new infrastructure. Regulatory direction across the Asia Pacific is tracking the same trajectory. Security frameworks — NIST, ISO 27001, CIS — require organisations to govern what's on their network. If your security policy doesn't explicitly cover IPv6, you have a compliance gap that an auditor can find today. That sentence alone tends to get the Boardroom's attention.

---

## Three arguments worth having

Once you're in the GRC frame, these are the arguments that land:

**The IPv4 market is collapsing — and that's a financial risk.** Secondary market prices peaked at around USD $60 per address in 2022. By early 2026 they're below $20, with no floor in sight. The bid-ask spread has become almost unbridgeable — sellers are still anchored to peak prices, buyers know substitution is coming. When that substitution cost reaches zero, IPv4 address holdings don't gradually depreciate. They crash to scrap value. Any organisation treating IPv4 allocations as assets needs to hear this framed as a financial risk, not a technical observation.

**IPv4 is a constraint on growth, not just a cost.** This is the reframe that matters most. It's not "we should upgrade our infrastructure." It's "our current infrastructure is actively limiting what we can build." IoT, 5G, smart infrastructure, cloud-native services — these are being designed for IPv6. Every year on IPv4 is a year your organisation can't move at full speed. For leadership, that's a strategic risk, not an IT matter.

**For the Pacific, this is also an equity issue.** The current scarcity isn't technical — it's historical. Early-adopting regions locked in vast IPv4 allocations before exhaustion hit. Pacific Island nations and much of South and Southeast Asia arrived to find the pool empty. The result is scarce capital flowing out as IPv4 leasing fees to address holders in other regions — an ongoing transfer of economic value that's entirely artificial. IPv6 eliminates this: abundant address space, globally available, no legacy advantage. That's not just a more efficient protocol. It's a structural correction. When you're in front of a Pacific boardroom, don't skip this part.

---

## The four questions that make the gap visible

When I run IPv6 for Leaders workshops, I ask participants to answer four questions about their own organisations — not technical questions, governance questions:

- What percentage of our traffic is currently over IPv6?
- Does our security policy explicitly cover IPv6?
- What is our annual spend on IPv4 addresses?
- Do we have a deployment roadmap, and a plan for what comes after dual-stack?

Most can't answer any of them. And that's exactly the point. If your organisation can't answer these questions, IPv6 isn't being governed — it's being ignored. These are worth putting directly in front of your ICT leadership or your board. They make the gap visible in a way that "we should move to IPv6" simply doesn't.

---

## What you're actually asking them to do

Here's the other thing we often get wrong: we ask leadership to understand the technology, when what we actually need them to do is make a decision.

The decision is straightforward. Commission an IPv6 readiness assessment. Add IPv6 to the risk register. Confirm that the security policy covers it. Approve a deployment roadmap. Make IPv6 a mandatory criterion in new procurement. None of that requires understanding how prefix delegation works — it requires treating IPv6 as a governance matter rather than a technical one.

The technical team can run the implementation. What leadership needs to do is remove the organisational friction that makes doing nothing easier than doing something. Budget, prioritisation, clear mandate.

APNIC data shows that without active intervention, universal IPv6 adoption is still two decades away. That's twenty more years of organisations paying the IPv4 laziness tax, capping their own growth, and — for Pacific organisations — subsidising address holders in other regions.

The technology is ready. The training exists. The narrative is here. Now it needs someone to take it into the Boardroom.

---

*The Internet Society's analysis of IPv6 adoption stalls is worth reading in full: [Why IPv6 Adoption Is Stalled — The Behavioral Science Behind Internet Infrastructure Change](https://pulse.internetsociety.org/en/blog/2025/09/why-ipv6-adoption-is-stalled-the-behavioral-science-behind-internet-infrastructure-change/)*
