# 🔐 ThreatForge — AI Security Architecture Review Platform

**By BCyberaware · Vikas Pandita**

> Paste your HLD + LLD → Get a full STRIDE, PASTA, Attack Surface & Compliance Gap report in seconds.

🌐 **Live:** [bcyberawareby vikaspandita.netlify.app](https://bcyberawarebyvikaspandita.netlify.app)

---

## What is ThreatForge?

ThreatForge is a browser-based security architecture review tool built for Security Architects, DevSecOps teams, and startups who need fast, structured threat modeling without expensive consultants.

You paste your **High-Level Design (HLD)** and **Low-Level Design (LLD)** documents — ThreatForge runs a full rule-based security analysis and generates a professional report covering:

- **STRIDE Threat Model** — all 6 categories with findings & mitigations
- **PASTA Analysis** — 7-stage risk-centric framework
- **Vulnerability Registry** — CVSS-scored, filterable by severity
- **Attack Surface Mapping** — entry points, trust boundaries, data flows
- **Security Architecture Review** — 8 domain scorecard
- **Compliance Gap Analysis** — OWASP Top 10, NIST CSF, ISO 27001, PCI-DSS
- **Remediation Roadmap** — 4-phase prioritised action plan

---

## Features

| Feature | Free Plan | Pro Plan |
|---|---|---|
| Security reviews per month | 3 | Unlimited |
| STRIDE + PASTA analysis | ✅ | ✅ |
| Vulnerability registry | ✅ | ✅ |
| Compliance gap mapping | ✅ | ✅ |
| Save & revisit reports | ✅ | ✅ |
| PDF export | ❌ | ✅ |
| Team workspace | ❌ | ✅ |
| API access | ❌ | ✅ |

---

## Tech Stack

| Layer | Technology |
|---|---|
| Frontend | Pure HTML + CSS + Vanilla JS |
| Auth & Database | Supabase (PostgreSQL + Auth) |
| Hosting | Netlify |
| Payments (Phase 3) | Stripe |
| Analysis Engine | Rule-based (24 security rules, no AI API needed) |

**Zero backend server. Zero cost to start. Deploys in 30 seconds.**

---

## Project Structure

```
threatforge-bcyberaware/
├── index.html           ← Full app (auth + analyzer + report + dashboard)
├── netlify.toml         ← Netlify deploy config
├── supabase-setup.sql   ← Run once in Supabase SQL Editor
└── README.md            ← This file
```

---

## Local Setup

1. Clone the repo
```bash
git clone https://github.com/YOUR_USERNAME/threatforge-bcyberaware.git
cd threatforge-bcyberaware
```

2. Open `index.html` directly in your browser — no npm, no build step needed.

---

## Deploying to Netlify via GitHub

1. Push this repo to GitHub
2. Go to [netlify.com](https://netlify.com) → **Add new site → Import from Git**
3. Select this repo → click **Deploy**
4. Every push to `main` auto-deploys in ~30 seconds ✅

---

## Supabase Database Setup

1. Create a free project at [supabase.com](https://supabase.com)
2. Go to **SQL Editor → New Query**
3. Paste contents of `supabase-setup.sql` and run
4. Copy your **Project URL** and **anon key** from **Settings → API**
5. Replace lines 17–18 in `index.html` with your credentials

---

## Roadmap

- [x] Phase 1 — Static tool (no login, no server)
- [x] Phase 2 — Auth + saved reports (Supabase)
- [ ] Phase 3 — Stripe billing (Free / Pro / Enterprise)
- [ ] Phase 4 — PDF export with BCyberaware branding
- [ ] Phase 5 — Team workspaces + API access
- [ ] Phase 6 — CI/CD integration (GitHub Actions plugin)

---

## About BCyberaware

**BCyberaware by Vikas Pandita** is a cybersecurity education and tooling company focused on making enterprise-grade security practices accessible to every development team.

🌐 [bcyberawarebyvikaspandita.netlify.app](https://bcyberawarebyvikaspandita.netlify.app)

---

## License

© 2025 BCyberaware by Vikas Pandita. All rights reserved.
