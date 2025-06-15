
CHROMIUM = chromium 2>/dev/null --disable-gpu --headless --window-size=1920,1080 --hide-scrollbars--run-all-compositor-stages-before-draw  --virtual-time-budget=10000

images: apnic_labs_ipv6_oceania.png apnic_labs_ipv6_india.png apnic_labs_ipv6_world.png apnic_labs.png
	$(CHROMIUM) --screenshot="apnic_labs_ipv6_oceania.png" https://stats.labs.apnic.net/ipv6/XF
	$(CHROMIUM) --screenshot="apnic_labs_ipv6_india.png" https://stats.labs.apnic.net/ipv6/IN
	$(CHROMIUM) --screenshot="apnic_labs_ipv6_world.png" https://stats.labs.apnic.net/ipv6/XA
	$(CHROMIUM) --screenshot="apnic_labs.png" https://labs.apnic.net/measurements/
	$(CHROMIUM) --screenshot="apnic_labs_ipv6_heatmap.png" https://stats.labs.apnic.net/ipv6
	$(CHROMIUM) --screenshot="apnic_labs_reliance_jio.png" 'https://stats.labs.apnic.net/ipv6/AS55836?a=55836&c=IN&x=0&s=0&p=01&w=90'
	$(CHROMIUM) --screenshot="apnic_labs_ipv6_polynesia.png" 'https://stats.labs.apnic.net/ipv6/QS?o=cXAw30x1r1'
	$(CHROMIUM) --screenshot="apnic_ipv6_city.png" https://blog.apnic.net/2024/10/29/the-realities-of-building-an-ipv6-only-city/
	$(CHROMIUM) --screenshot="apnic_ipv6_rural.png" 'https://www.mdpi.com/2571-5577/3/1/4?type=check_update&version=1'
	$(CHROMIUM) --screenshot="rfc7381.png" https://datatracker.ietf.org/doc/html/rfc7381
	$(CHROMIUM) --screenshot="having_a_plan.png" https://blogs.infoblox.com/ipv6-coe/the-first-steps-in-ipv6-adoption-having-a-plan/
	$(CHROMIUM) --screenshot="google.png" https://www.google.com/intl/en/ipv6/statistics.html
	$(CHROMIUM) --screenshot="google2.png" 'https://www.google.com/intl/en/ipv6/statistics.html#tab=per-country-ipv6-adoption'

apnic_labs_ipv6_polynesia-0.jpg apnic_labs_ipv6_polynesia-1.jpg: apnic_labs_ipv6_polynesia.png
	convert apnic_labs_ipv6_polynesia.png -crop 1025x575 apnic_labs_ipv6_polynesia.jpg

apnic_labs_ipv6_world-0.jpg apnic_labs_ipv6_world-1.jpg: apnic_labs_ipv6_world.png
	convert apnic_labs_ipv6_world.png -crop 1025x575 apnic_labs_ipv6_world.jpg

ipv6-marp-slide-deck.html: ipv6-marp-slide-deck.md images
	marp --allow-local-files --html ipv6-marp-slide-deck.md

ipv6-marp-slide-deck.pptx: ipv6-marp-slide-deck.md images
	marp --allow-local-files --pptx ipv6-marp-slide-deck.md

ipv6-marp-slide-deck.pdf: ipv6-marp-slide-deck.md images
	marp --allow-local-files --pdf ipv6-marp-slide-deck.md

all: ipv6-marp-slide-deck.pptx ipv6-marp-slide-deck.pdf ipv6-marp-slide-deck.html

