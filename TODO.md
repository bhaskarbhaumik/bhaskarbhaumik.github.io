# TODO.md — Assets & Prep Checklist Before Running Claude Code
> Complete **all items** in this checklist before handing `TASK_PLAN.md` to Claude Code.
> Items marked 🔴 are **blockers** — Claude Code cannot proceed without them.
> Items marked 🟡 are **strongly recommended** for a world-class result.
> Items marked 🟢 are **optional** enhancements.

---

## 1. 🔴 GitHub Repository

- [ ] **GitHub account confirmed**: `https://github.com/bhaskarbhaumik`
- [ ] **Create (or confirm) the repo**: `bhaskarbhaumik.github.io`
  - Must be a **public** repository named exactly `<username>.github.io`
  - Enable **GitHub Pages** → Settings → Pages → Source: `Deploy from branch` → `main` / `root`
- [ ] **Generate a Personal Access Token (PAT)** with `repo` + `workflow` scopes
  - Save it securely; you'll pass it to Claude Code as an env var or secret
  - *(Token itself must NEVER appear inside the repo)*
- [ ] **Clone the repo locally** on the machine where Claude Code will run:
  ```bash
  git clone https://github.com/bhaskarbhaumik/bhaskarbhaumik.github.io
  cd bhaskarbhaumik.github.io
  ```

---

## 2. 🔴 Content: Your Identity & Copy

Collect the following text snippets (plain text or Markdown is fine):

| Item | Status | Notes |
|------|--------|-------|
| **Hero tagline** (≤ 15 words) | ☐ | e.g. *"AI Innovation Leader · Data & Analytics Architect · Builder of Futures"* |
| **Short bio** (2–3 sentences) | ☐ | Use or adapt `bb-context.md → short_bio_website_ready` |
| **Long bio** (paragraph) | ☐ | Use or adapt `bb-context.md → long_bio_website_ready` |
| **Mission statement** (public-safe version) | ☐ | Adapt *"Help build the #1 AI-led transformation practice"* |
| **Approved list of 4–6 focus areas** | ☐ | e.g. AI-led Services Transformation, Agentic AI, Rapid Build Camps, Data Lakehouse, Responsible AI |
| **Career timeline** (roles + dates) | ☐ | Merge LinkedIn timeline + bb-context roles; see Section 5 below |
| **3–5 achievement bullet points** | ☐ | Plain prose; adapt from `bb-context.md → selected_achievements_and_artifacts` |
| **Education** | ☐ | MBA, Georgia Institute of Technology (2021); M.Stat + B.Stat, Indian Statistical Institute, 1999/1997 |

---

## 3. 🔴 Content: Resume / Web CV Page

Decide on **one** of the following options (check your choice):

- [ ] **Option A — Embed PDF**: Export your most current resume as a PDF (filename: `bhaskar-bhaumik-resume.pdf`). Claude Code will embed it in an `/resume` page as a viewer + download link.
- [ ] **Option B — HTML Resume**: Provide a final, approved Markdown or DOCX version of your resume. Claude Code will render it as a styled, printable HTML page at `/resume`.
- [ ] **Option C — Both**: PDF download + rendered HTML page.

> **Recommended**: Option C — gives the best SEO and accessibility.

**Deliverable needed**: Place your final resume file in the project folder as:
```
assets/docs/bhaskar-bhaumik-resume.pdf
```

---

## 4. 🟡 Visual Assets

| Asset | Format | Notes |
|-------|--------|-------|
| **Professional headshot** | JPG/PNG, ≥ 400×400 px | Place as `assets/img/headshot.jpg` |
| **Hero background or abstract image** | JPG/PNG, ≥ 1920×600 px | Optional; can use a gradient fallback |
| **Favicon** | PNG 512×512 or ICO | Initials "BB" on a dark background works great |
| **Open Graph / social preview image** | JPG 1200×630 px | Used when links are shared on LinkedIn, etc. |

> **Tip**: If you don't have these ready, note it and Claude Code will generate placeholder SVGs and a gradient hero with initials.

---

## 5. 🟡 Career Timeline Data

Create a file `_data/career.yml` — or just supply the following info as plain text for Claude Code to convert:

```
- title: Director, AI Solutions & Rapid Build Camps
  org: Tata Consultancy Services — AI & Services Transformation, Americas
  start: 2025-04
  end: Present
  summary: "Leading billable AI Innovation Camps and Rapid Build practices across the Americas. Building composable accelerators, delivery playbooks, and reusable codebases targeting 50%+ velocity improvement in AI MVP delivery."

- title: Head, AI Innovation Americas / Head, AI & Data (Retail Americas)
  org: Tata Consultancy Services
  start: 2022
  end: 2025
  summary: "P&L ~$25M; grew portfolio 50%+ in 3 years. Led 200+ member team transformation to AI-first model. Agentic AI and GenAI pursuits across healthcare, engineering, and technology sectors."

- title: Consulting Director, Data & Analytics
  org: Tata Consultancy Services
  start: 2019
  end: 2022
  location: Atlanta, Georgia, USA
  summary: "D&A strategy consulting at CXO/ELT level. Led D&A transformation at Macy's, Advance Auto Parts, and Genuine Parts Company. GCP AI/ML platform delivery. Non-CIO space D&A initiatives at The Home Depot and HD Supply."

- title: Consulting Director, Data & Analytics
  org: Tata Consultancy Services
  start: 2015
  end: 2019
  location: Atlanta, Georgia, USA
  summary: "Enterprise-scale D&A solutions architecture, cloud migration, self-serve BI platform design. Architected modern data lakehouse and advanced analytics platforms."

- title: Technical Architect & Program Manager
  org: Tata Consultancy Services
  start: 2005
  end: 2015
  location: Atlanta, Georgia, USA
  summary: "Architected enterprise EDW, data integration, and BI systems. Established the D&A COE and services delivery team at The Home Depot. Managed EDW, Global Supply Chain, and e-commerce portfolios."

- title: Systems Engineer → Technical Lead
  org: Tata Consultancy Services
  start: 1999
  end: 2005
  location: Cardiff, Wales, UK & Chennai, India
  summary: "Developer, designer, and tester on enterprise data warehouse and billing systems for British Telecommunications plc."
```
- [ ] **Review and approve** the timeline above (edit dates/summaries as needed)

---

## 6. 🟡 Links & Social Presence

Confirm and provide the following links:

| Platform | URL | Status |
|----------|-----|--------|
| LinkedIn | `https://www.linkedin.com/in/bhaskarbhaumik` | ☐ Confirmed |
| GitHub | `https://github.com/bhaskarbhaumik` | ☐ Confirmed |
| Hugging Face | `https://huggingface.co/bbhaskar2025` | ☐ Confirmed |
| Personal domain (optional) | `https://bhaskar.bhaumik.org` | ☐ Configure CNAME if using custom domain |
| Public email for contact form | *(choose one to display publicly)* | ☐ Provided |

---

## 7. 🟡 "What I Build" Section (Featured Work / Projects)

Provide 3–5 **public-safe** project or capability cards. Each card needs:
- **Title** (e.g., "Agentic AI Reference Architecture")
- **One-line description** (public-safe; no client names without approval)
- **Optional link** (GitHub repo, blog post, demo, etc.)

> Examples from your context (sanitized):
> - *AI Rapid Build Camps* — Reusable playbooks & composable accelerators for rapid AI MVP delivery
> - *Lakehouse & Analytics Modernization* — On-prem EDW to GCP; early large-scale case study for Google & TCS
> - *Composable Agentic AI Platform* — Logical + technical reference architecture across AWS, Azure, GCP
> - *Enterprise D&A COE* — Built and scaled a 200+ member Center of Excellence at a leading US retailer
> - *Self-Serve BI Platform* — Designed and delivered modern self-serve analytics ecosystem
> - *Enterprise Data Governance Frameworks* — Built for healthcare-scale ecosystems

- [ ] **Provide 3–5 approved, public-safe project cards**

---

## 8A. 🟡 Industry Verticals (New Section)

The TCS BIO confirms your cross-industry footprint. Decide which to feature on the site:

| Vertical | Confirmed Clients/Context | Include? |
|----------|--------------------------|---------|
| Retail | The Home Depot, HD Supply, Macy's, Advance Auto Parts, Genuine Parts Company | ☐ Yes / No |
| Telecom | British Telecommunications plc | ☐ Yes / No |
| Travel & Hospitality | *(listed in BIO — add specific context if cleared)* | ☐ Yes / No |
| CPG & Manufacturing | *(listed in BIO — add specific context if cleared)* | ☐ Yes / No |
| Healthcare | Elevance, UnitedHealthcare, Cigna/Evernorth — RFP/pursuit work | ☐ Yes / No |
| Engineering & EPC | Fluor Corporation — AI workshop & pursuits | ☐ Yes / No |

> **Note**: Retail is your deepest vertical and should be prominently featured.

---

## 8. 🟢 Blog / Thought Leadership (Optional)

- [ ] Decide: Do you want a **Blog / Insights** section?
  - If yes, provide 1–3 seed posts (Markdown files) OR just placeholder titles
  - Suggested topics from your expertise: *AI Innovation Camps*, *Agentic AI in Enterprise*, *Data Lakehouse Patterns*
- [ ] If no blog for now, Claude Code will add a stubbed `/blog` page with a "coming soon" message

---

## 9. 🟢 Site Configuration Decisions

Answer these before Claude Code starts:

| Decision | Your Answer |
|----------|-------------|
| **Jekyll theme base** | Recommend: `minimal-mistakes` (rich, responsive, well-documented) OR `al-folio` (academic/professional) |
| **Color palette** | Suggest: Deep navy (`#0D1B2A`) + electric teal (`#00C9A7`) + white — or specify your own |
| **Font preference** | Suggest: Inter (sans-serif, modern) + JetBrains Mono (for code snippets) |
| **Dark mode support** | Yes / No |
| **Analytics** | Google Analytics 4 Measurement ID (optional) |
| **Custom domain** | `bhaskar.bhaumik.org` — add CNAME record in DNS pointing to `bhaskarbhaumik.github.io` |
| **Contact form** | Formspree (free tier) — provide your email for form routing |
| **Resume page URL** | `/resume` |

---

## 10. 🟢 SEO & Metadata

- [ ] Confirm the **page title**: e.g., *"Bhaskar Bhaumik | AI Innovation Leader & Data Architect"*
- [ ] Write a **meta description** (≤ 160 chars): e.g., *"Bhaskar Bhaumik — AI & Data consulting leader, Rapid Build Camp innovator, and enterprise architect based in Atlanta."*
- [ ] Provide **5–10 keywords**: AI transformation, Agentic AI, data architecture, GenAI, TCS, Atlanta, enterprise analytics, etc.

---

## ✅ Pre-Flight Summary Checklist

Before saying "go" to Claude Code, confirm:

- [ ] GitHub repo `bhaskarbhaumik.github.io` exists and is public
- [ ] GitHub PAT is available in your shell environment
- [ ] Resume PDF is ready at `assets/docs/bhaskar-bhaumik-resume.pdf`
- [ ] Headshot is ready at `assets/img/headshot.jpg`
- [ ] Career timeline reviewed and approved
- [ ] At least 3 public-safe project cards written
- [ ] Site color/font preferences decided
- [ ] Custom domain decision made

---

*Once all 🔴 blockers are resolved and 🟡 items are ready, proceed to `TASK_PLAN.md`.*
