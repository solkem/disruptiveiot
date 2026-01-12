# DisruptiveIoT Ghost Site

> **CLAUDE.md** - Context file for Claude Code integration

## Project Overview

DisruptiveIoT (disruptiveiot.org) is a technical blog exploring the convergence of blockchain, AI, and edge computing—termed "baeIoT"—with a focus on agricultural IoT for smallholder farmers in Zimbabwe.

**Philosophy:** "Infinite Ubuntu" — I win by helping you win, forever.

**Platform:** Ghost CMS (self-hosted on DigitalOcean $6/month droplet)

**Owner:** Solomon Kembo (Software Engineering Instructor, Severn School, Maryland)

---

## The baeIoT Ecosystem

Four interconnected pillars displayed on the homepage:

| Pillar | Description | Tag |
|--------|-------------|-----|
| **EdgeChain** | Privacy-preserving agricultural data marketplace for Zimbabwean farmers | `/tag/edgechain/` |
| **Msingi** | Midnight Network smart contracts for IoT economic autonomy | `/tag/msingi/` |
| **Ndani** | Trustless hardware architecture for edge AI computation | `/tag/ndani/` |
| **Dura** | Research simplification app bridging scientific papers to ecosystem projects | `/tag/dura/` |

### Technical Stack (EdgeChain/Msingi)
- ESP32-S3 microcontrollers with ATECC608B secure elements
- Raspberry Pi 5 proof servers
- LoRa communication for rural connectivity
- Midnight blockchain (Cardano partner chain)
- Zero-knowledge proofs for privacy

---

## File Structure

```
disruptiveiot-ghost/
├── CLAUDE.md                    # This file - project context
├── code-injection/
│   ├── site-header.html         # All CSS styles (paste into Ghost Admin)
│   └── site-footer.html         # Footer scripts (if any)
├── theme/
│   └── casper/                  # Ghost Casper theme (customized)
│       ├── assets/
│       │   ├── css/
│       │   └── js/
│       ├── partials/
│       └── *.hbs                # Handlebars templates
├── routes.yaml                  # Custom Ghost routing
├── scripts/
│   └── deploy.sh                # Deployment script
└── .github/
    └── workflows/
        └── deploy.yml           # GitHub Actions workflow
```

---

## Design System

### Design Inspiration
- **Cosmos Network** (cosmos.network) — Dark theme, professional blockchain aesthetic
- **Trust Machines** (trustmachines.co) — Minimalist product cards, clean typography

### Color Palette

```css
:root {
  /* Backgrounds */
  --bg-primary: #0a0a0a;         /* Deep black - main canvas */
  --bg-secondary: #111111;        /* Section backgrounds */
  --bg-card: #161616;             /* Card surfaces */
  --bg-card-hover: #1a1a1a;       /* Card hover state */
  
  /* Gold Accent */
  --gold: #FBBF24;                /* Primary accent - CTAs, highlights */
  --gold-dim: #D4A017;            /* Hover state */
  --gold-glow: rgba(251, 191, 36, 0.12);   /* Subtle backgrounds */
  --gold-border: rgba(251, 191, 36, 0.3);  /* Border accents */
  
  /* Text */
  --text-primary: #FFFFFF;        /* Headlines */
  --text-secondary: #B0B0B0;      /* Body text */
  --text-muted: #707070;          /* Captions, meta */
  
  /* Borders */
  --border: rgba(255, 255, 255, 0.08);
  --border-hover: rgba(255, 255, 255, 0.15);
}
```

### Typography

| Element | Font | Weight |
|---------|------|--------|
| Headlines | Playfair Display | 600-700 |
| Body | Inter | 400-500 |
| Code | JetBrains Mono | 400 |

```css
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Playfair+Display:wght@600;700&display=swap');
```

### Key UI Components

**Pillar Cards:** Dark cards with gold hover accent, 16px border-radius, -4px lift on hover

**Buttons:**
- Primary: Gold fill (#FBBF24), dark text
- Secondary: Transparent with border

**Animation:** Orbital floating particles (8s ease-in-out), gold glow pulse

---

## Homepage Structure

The homepage has a custom hero with orbital animation showing the four pillars:

```
┌─────────────────────────────────────────────┐
│  NAVIGATION BAR                             │
├─────────────────────────────────────────────┤
│                                             │
│  HERO SECTION                               │
│  - Badge: "Where Joyous Hacking..."         │
│  - Tagline: "I win by helping you win"      │
│  - Description                              │
│  - CTAs: Explore Ecosystem / Read Insights  │
│  - Orbital Animation (4 pillars + core)     │
│                                             │
├─────────────────────────────────────────────┤
│  BAE CONCEPT CARDS                          │
│  Blockchain | AI | Edge | IoT               │
│  (Should link to respective tag pages)      │
├─────────────────────────────────────────────┤
│  NEWSLETTER / CONTENT SECTIONS              │
├─────────────────────────────────────────────┤
│  FOOTER                                     │
└─────────────────────────────────────────────┘
```

### BAE Cards (Need Links)

These four cards should link to their tag pages:

| Card | Label | Link |
|------|-------|------|
| Blockchain | Economic Agency | `/tag/blockchain/` |
| AI | Cognitive Agency | `/tag/ai/` |
| Edge | Operational Agency | `/tag/edge/` |
| IoT | Physical Reality | `/tag/iot/` |

---

## Deployment

### Server Details
- **Host:** DigitalOcean Droplet
- **IP:** 143.110.131.196
- **OS:** Ubuntu 24.04
- **Ghost Path:** `/var/www/ghost`
- **Domain:** disruptiveiot.org (via GoDaddy)

### Manual Deployment

```bash
# Sync theme
scp -r theme/casper/ root@143.110.131.196:/var/www/ghost/content/themes/casper/

# Sync routes
scp routes.yaml root@143.110.131.196:/var/www/ghost/content/settings/routes.yaml

# Restart Ghost (SSH into server first)
ssh root@143.110.131.196
cd /var/www/ghost && ghost restart
```

### Code Injection Deployment
Code Injection is stored in Ghost's database, not files. After editing `code-injection/site-header.html`:
1. Copy the file contents
2. Go to Ghost Admin → Settings → Code injection → Site Header
3. Paste and Save

---

## Content Series

### EdgeChain Insights (8 articles)
1. Intelligence at the Edge: Introducing baeIoT
2. Data-Centrism VS Model-Centrism
3. The Unlikely Connection of Data, Makerspace and AI
4. From Mbare's Mesh Network to Farmer-Owned Infrastructure
5. From Ubuntu Freedom to Blockchain Privacy
6. The Helicopter That Zimbabwe Laughed At
7. When the Fields Speak in Proof, Not Fear (Top 16 Midnight Hackathon)
8. [Final article pending]

Tags: `edgechain`, `insights`, `blockchain`, `privacy`, `midnight`, `innovation`

---

## Common Tasks

### Edit Homepage Styles
1. Edit `code-injection/site-header.html`
2. Copy contents to Ghost Admin → Settings → Code injection → Site Header
3. Save

### Make Cards Clickable
Wrap card `<div>` elements in `<a href="/tag/tagname/">` tags

### Change Colors
Update CSS custom properties in `code-injection/site-header.html`

### Edit Theme Templates
1. Edit files in `theme/casper/`
2. `scp -r theme/casper/ root@143.110.131.196:/var/www/ghost/content/themes/casper/`
3. `ssh root@143.110.131.196 "cd /var/www/ghost && ghost restart"`

### Add New Routes
1. Edit `routes.yaml`
2. `scp routes.yaml root@143.110.131.196:/var/www/ghost/content/settings/routes.yaml`
3. Restart Ghost

---

## Key Principles

When making changes, remember:

1. **Dark theme is non-negotiable** — #0a0a0a background, gold accents
2. **Preserve the orbital animation** — It's working well, don't replace
3. **Mobile-first** — Many users on limited bandwidth
4. **Accessibility** — Maintain AAA contrast ratios
5. **Ubuntu philosophy** — Welcoming, not exclusionary

---

## Credentials & Access

- **Ghost Admin:** https://disruptiveiot.org/ghost/
- **DigitalOcean Console:** Access via DO dashboard if SSH fails
- **Backup Admin Email:** admin@disruptiveiot.org

### Password Reset (Emergency)
If locked out, use MySQL:
```bash
cd /var/www/ghost
mysql -u root ghost_production
# See GHOST-PASSWORD-RESET-EMERGENCY.md for commands
```

---

## Related Resources

- **Design Spec:** See `DESIGN-SPEC.md` for full design rationale
- **Midnight Network:** https://midnight.network/
- **Cardano:** https://cardano.org/
- **Ghost Docs:** https://ghost.org/docs/

---

*Last updated: January 2026*
