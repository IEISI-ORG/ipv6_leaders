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
