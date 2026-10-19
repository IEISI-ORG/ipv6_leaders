# Claude Code Instructions

## Standing Orders

### Do not generate PPTX files
Never run `marp --pptx` or generate `.pptx` outputs for any deck in this project.
HTML and PDF are the required output formats. PPTX is not used.

### Build commands
When asked to build or update a deck, use:
```bash
marp --allow-local-files --theme-set ieisi.css --html <file>.md
marp --allow-local-files --theme-set ieisi.css --pdf <file>.md
```

### Theme
Both decks use the IEISI theme in `ieisi.css` (navy #0f2c59, blue #1a5b8f, red accent #d94838, Roboto Flex), built from the look of www.ieisi.org. Title slides use `<!-- _class: title -->`, section dividers `<!-- _class: section -->`. The theme is loaded with `--theme-set ieisi.css`; do not reintroduce other themes.

### Contact and branding
- Facilitator: Terry Sweetser, IEISI
- Email: terry@ieisi.org
- Web: www.ieisi.org
- Training: www.ieisi.org/training
- Copyright footer: `© 2026 IEISI: CC BY-NC-SA 4.0 | terry@ieisi.org | ieisi.org/training`

### Analogies
Do not use Western-centric analogies (e.g. taxi medallions, Uber/ridesharing) — these do not resonate with Pacific Island audiences. Use analogies with universal or regional relevance.

### Core message
The primary framing for all IPv6 content aimed at Pacific audiences:
> **IPv4 slows down growth. IPv6 enables it.**
