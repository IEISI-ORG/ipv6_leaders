
CHROMIUM = chromium 2>/dev/null \
	--disable-gpu \
	--headless \
	--window-size=1920,1080 \
	--hide-scrollbars \
	--run-all-compositor-stages-before-draw \
	--virtual-time-budget=10000

CAPTURES = captures

.PHONY: all clean clean-images images briefing workshop

# ── Default target ────────────────────────────────────────────────────────────

all: briefing workshop

# ── Board Briefing ────────────────────────────────────────────────────────────

briefing: ipv6-board-briefing.html ipv6-board-briefing.pdf

ipv6-board-briefing.html: ipv6-board-briefing.md academic.css
	marp --allow-local-files --html ipv6-board-briefing.md

ipv6-board-briefing.pdf: ipv6-board-briefing.md academic.css
	marp --allow-local-files --pdf ipv6-board-briefing.md

# ── Workshop Deck ─────────────────────────────────────────────────────────────
# Run `make images` separately to refresh screenshots into captures/

workshop: ipv6-marp-slide-deck.html ipv6-marp-slide-deck.pdf

ipv6-marp-slide-deck.html: ipv6-marp-slide-deck.md academic.css
	marp --allow-local-files --html ipv6-marp-slide-deck.md

ipv6-marp-slide-deck.pdf: ipv6-marp-slide-deck.md academic.css
	marp --allow-local-files --pdf ipv6-marp-slide-deck.md

# ── Screenshot refresh (run manually, requires Chromium + network) ─────────────

images:
	mkdir -p $(CAPTURES)
	$(CHROMIUM) --screenshot="$(CAPTURES)/apnic_labs_ipv6_oceania.png" https://stats.labs.apnic.net/ipv6/XF
	$(CHROMIUM) --screenshot="$(CAPTURES)/apnic_labs_ipv6_india.png" https://stats.labs.apnic.net/ipv6/IN
	$(CHROMIUM) --screenshot="$(CAPTURES)/apnic_labs_ipv6_world.png" https://stats.labs.apnic.net/ipv6/XA
	$(CHROMIUM) --screenshot="$(CAPTURES)/apnic_labs.png" https://labs.apnic.net/measurements/
	$(CHROMIUM) --screenshot="$(CAPTURES)/apnic_labs_ipv6_heatmap.png" https://stats.labs.apnic.net/ipv6
	$(CHROMIUM) --screenshot="$(CAPTURES)/apnic_labs_reliance_jio.png" 'https://stats.labs.apnic.net/ipv6/AS55836?a=55836&c=IN&x=0&s=0&p=01&w=90'
	$(CHROMIUM) --screenshot="$(CAPTURES)/apnic_labs_ipv6_polynesia.png" 'https://stats.labs.apnic.net/ipv6/QS?o=cXAw30x1r1'
	$(CHROMIUM) --screenshot="$(CAPTURES)/apnic_ipv6_city.png" https://blog.apnic.net/2024/10/29/the-realities-of-building-an-ipv6-only-city/
	$(CHROMIUM) --screenshot="$(CAPTURES)/apnic_ipv6_rural.png" 'https://www.mdpi.com/2571-5577/3/1/4?type=check_update&version=1'
	$(CHROMIUM) --screenshot="$(CAPTURES)/rfc7381.png" https://datatracker.ietf.org/doc/html/rfc7381
	$(CHROMIUM) --screenshot="$(CAPTURES)/having_a_plan.png" https://blogs.infoblox.com/ipv6-coe/the-first-steps-in-ipv6-adoption-having-a-plan/
	$(CHROMIUM) --screenshot="$(CAPTURES)/google.png" https://www.google.com/intl/en/ipv6/statistics.html
	$(CHROMIUM) --screenshot="$(CAPTURES)/google2.png" 'https://www.google.com/intl/en/ipv6/statistics.html#tab=per-country-ipv6-adoption'
	convert $(CAPTURES)/apnic_labs_ipv6_polynesia.png -crop 1025x575 $(CAPTURES)/apnic_labs_ipv6_polynesia.jpg
	convert $(CAPTURES)/apnic_labs_ipv6_world.png -crop 1025x575 $(CAPTURES)/apnic_labs_ipv6_world.jpg

# ── Clean ─────────────────────────────────────────────────────────────────────

clean:
	rm -f ipv6-board-briefing.html ipv6-board-briefing.pdf
	rm -f ipv6-marp-slide-deck.html ipv6-marp-slide-deck.pdf

clean-images:
	rm -rf $(CAPTURES)
