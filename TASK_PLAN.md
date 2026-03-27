# TASK_PLAN.md — Claude Code Step-by-Step Plan
# Personal Website: Bhaskar Bhaumik — GitHub Pages (Jekyll)
# Target URL: https://bhaskarbhaumik.github.io (or https://bhaskar.bhaumik.org)

---

## 🎯 Goal
Build a **world-class personal website** for Bhaskar Bhaumik — AI Innovation Leader & Data Architect —
hosted on GitHub Pages using Jekyll. The site must:
- Reflect a senior executive / thought leader personal brand
- Feature a standalone, shareable `/resume` page (PDF embed + HTML version)
- Be fully responsive, SEO-optimized, and accessibility-compliant (WCAG AA)
- Deploy automatically via GitHub Actions on every `git push`

---

## ⚠️ Pre-conditions
Before executing any step, verify:
1. Working directory is the cloned repo root: `bhaskarbhaumik.github.io/`
2. Ruby ≥ 3.1 and Bundler are installed (`ruby -v && bundler -v`)
3. Git is configured with the correct remote (`git remote -v`)
4. GitHub PAT is set in the shell: `export GITHUB_TOKEN=<your_pat>`
5. All assets from `TODO.md` are staged in their expected paths

---

## PHASE 1 — Project Scaffold & Tooling

### Step 1.1 — Initialize Jekyll with Minimal Mistakes Theme
```bash
# From the repo root
gem install jekyll bundler
jekyll new . --force
```

Create `Gemfile` with:
```ruby
source "https://rubygems.org"
gem "github-pages", group: :jekyll_plugins
gem "jekyll-remote-theme"
gem "minimal-mistakes-jekyll"
gem "jekyll-seo-tag"
gem "jekyll-sitemap"
gem "jekyll-paginate-v2"
gem "jekyll-include-cache"
```

```bash
bundle install
```

**Verification**: `bundle exec jekyll serve --livereload` opens at `http://localhost:4000` without errors.

---

### Step 1.2 — Core `_config.yml`
Create `_config.yml` with the following key settings (replace placeholders):

```yaml
title: "Bhaskar Bhaumik"
subtitle: "AI Innovation Leader · Data & Analytics Architect"
description: "Bhaskar Bhaumik — AI & Data consulting leader, Rapid Build Camp innovator, and enterprise architect based in Atlanta."
url: "https://bhaskarbhaumik.github.io"
baseurl: ""
repository: "bhaskarbhaumik/bhaskarbhaumik.github.io"

remote_theme: mmistakes/minimal-mistakes@4.26.2
minimal_mistakes_skin: "dark"   # options: default, air, aqua, contrast, dark, dirt, neon, mint, plum, sunrise

# Author info
author:
  name: "Bhaskar Bhaumik"
  avatar: "/assets/img/headshot.jpg"
  bio: "AI Innovation Leader at TCS. Builder of AI Rapid Build Camps. Enterprise Data & Analytics Architect."
  location: "Atlanta, Georgia, USA"
  links:
    - label: "LinkedIn"
      icon: "fab fa-fw fa-linkedin"
      url: "https://www.linkedin.com/in/bhaskarbhaumik"
    - label: "GitHub"
      icon: "fab fa-fw fa-github"
      url: "https://github.com/bhaskarbhaumik"
    - label: "Hugging Face"
      icon: "fas fa-fw fa-robot"
      url: "https://huggingface.co/bbhaskar2025"

# Plugins
plugins:
  - jekyll-remote-theme
  - jekyll-seo-tag
  - jekyll-sitemap
  - jekyll-paginate-v2
  - jekyll-include-cache

# SEO
twitter:
  username: ""
social:
  name: "Bhaskar Bhaumik"
  links:
    - "https://www.linkedin.com/in/bhaskarbhaumik"
    - "https://github.com/bhaskarbhaumik"

# Analytics (uncomment and fill in when ready)
# analytics:
#   provider: "google-gtag"
#   google:
#     tracking_id: "G-XXXXXXXXXX"

# Collections
collections:
  projects:
    output: true
    permalink: /what-i-build/:name/

# Defaults
defaults:
  - scope:
      path: ""
      type: posts
    values:
      layout: single
      author_profile: true
      read_time: true
      show_date: true
  - scope:
      path: ""
      type: projects
    values:
      layout: single
      author_profile: false
```

**Verification**: `bundle exec jekyll build` completes with no errors.

---

### Step 1.3 — Custom CSS / Design Tokens
Create `assets/css/custom.scss`:

```scss
---
---
// Import theme
@import "minimal-mistakes/skins/{{ site.minimal_mistakes_skin | default: 'default' }}";
@import "minimal-mistakes";

// ── Design tokens ──────────────────────────────────────
:root {
  --bb-navy:    #0D1B2A;
  --bb-teal:    #00C9A7;
  --bb-accent:  #E63946;
  --bb-light:   #F4F6F8;
  --bb-text:    #CDD6F4;
  --font-sans:  'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
  --font-mono:  'JetBrains Mono', 'Fira Code', monospace;
}

// ── Hero section ───────────────────────────────────────
.hero-banner {
  background: linear-gradient(135deg, var(--bb-navy) 0%, #1a2a4a 100%);
  padding: 5rem 2rem;
  text-align: center;
  
  h1 {
    font-family: var(--font-sans);
    font-size: clamp(2rem, 5vw, 3.5rem);
    font-weight: 800;
    color: #ffffff;
    margin-bottom: 0.5rem;
  }
  
  .hero-tagline {
    font-size: clamp(1rem, 2.5vw, 1.4rem);
    color: var(--bb-teal);
    letter-spacing: 0.02em;
    margin-bottom: 2rem;
  }
  
  .hero-cta {
    display: inline-flex;
    gap: 1rem;
    flex-wrap: wrap;
    justify-content: center;
    
    a {
      padding: 0.75rem 1.75rem;
      border-radius: 2rem;
      font-weight: 600;
      text-decoration: none;
      transition: transform 0.2s, box-shadow 0.2s;
      
      &.primary {
        background: var(--bb-teal);
        color: var(--bb-navy);
        &:hover { transform: translateY(-2px); box-shadow: 0 4px 20px rgba(0,201,167,0.4); }
      }
      &.secondary {
        border: 2px solid var(--bb-teal);
        color: var(--bb-teal);
        &:hover { background: rgba(0,201,167,0.1); }
      }
    }
  }
}

// ── Focus area cards ───────────────────────────────────
.focus-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
  gap: 1.5rem;
  margin: 2rem 0;
  
  .focus-card {
    background: rgba(255,255,255,0.04);
    border: 1px solid rgba(0,201,167,0.2);
    border-radius: 12px;
    padding: 1.5rem;
    transition: border-color 0.2s, transform 0.2s;
    
    &:hover {
      border-color: var(--bb-teal);
      transform: translateY(-3px);
    }
    
    .icon { font-size: 2rem; margin-bottom: 0.75rem; }
    h3 { color: var(--bb-teal); margin: 0 0 0.5rem; font-size: 1rem; font-weight: 700; }
    p  { color: var(--bb-text); font-size: 0.9rem; margin: 0; }
  }
}

// ── Timeline ───────────────────────────────────────────
.timeline {
  position: relative;
  padding-left: 2rem;
  
  &::before {
    content: '';
    position: absolute;
    left: 0.5rem;
    top: 0;
    bottom: 0;
    width: 2px;
    background: linear-gradient(to bottom, var(--bb-teal), transparent);
  }
  
  .timeline-item {
    position: relative;
    margin-bottom: 2rem;
    
    &::before {
      content: '';
      position: absolute;
      left: -1.6rem;
      top: 0.4rem;
      width: 10px;
      height: 10px;
      border-radius: 50%;
      background: var(--bb-teal);
      box-shadow: 0 0 8px var(--bb-teal);
    }
    
    .dates { color: var(--bb-teal); font-size: 0.85rem; font-weight: 600; margin-bottom: 0.25rem; }
    h3 { margin: 0 0 0.25rem; font-size: 1.05rem; }
    .org { color: #8899aa; font-size: 0.9rem; margin-bottom: 0.5rem; }
    p { font-size: 0.92rem; }
  }
}

// ── Resume page ────────────────────────────────────────
.resume-wrapper {
  .resume-actions {
    display: flex;
    gap: 1rem;
    margin-bottom: 2rem;
    flex-wrap: wrap;
    
    a {
      padding: 0.6rem 1.4rem;
      border-radius: 2rem;
      font-weight: 600;
      text-decoration: none;
      transition: all 0.2s;
    }
    .btn-download { background: var(--bb-teal); color: var(--bb-navy); }
    .btn-print { border: 2px solid var(--bb-teal); color: var(--bb-teal); }
  }
  
  .pdf-embed {
    width: 100%;
    height: 85vh;
    border: 1px solid rgba(0,201,167,0.2);
    border-radius: 8px;
  }
}
```

---

## PHASE 2 — Page Content

### Step 2.1 — Home Page (`index.md`)
Create `index.md`:

```markdown
---
layout: home
author_profile: true
header:
  overlay_color: "#0D1B2A"
  overlay_filter: "0.7"
  overlay_image: /assets/img/hero-bg.jpg
  actions:
    - label: "View Resume"
      url: "/resume"
    - label: "What I Build"
      url: "/what-i-build"
excerpt: "AI Innovation Leader · Enterprise Data & Analytics Architect · Builder of Futures"
---

{% include hero-section.html %}
{% include focus-areas.html %}
{% include featured-achievements.html %}
```

---

### Step 2.2 — About Page (`_pages/about.md`)
Create `_pages/about.md`:

```markdown
---
layout: single
title: "About Bhaskar"
permalink: /about/
author_profile: true
toc: true
toc_label: "On this page"
---

## Who I Am

Bhaskar Bhaumik is a seasoned Data & AI consulting leader with 25+ years of enterprise experience spanning strategy, architecture, and execution. Based in Atlanta and holding an MBA from Georgia Tech, he brings the rare combination of deep technical depth — data lakehouse, Agentic AI, GenAI, cloud-native analytics — with the business and financial acumen to operate at CXO level.

His career spans leadership across Retail, Telecom, Travel & Hospitality, and CPG — with signature client work including The Home Depot, Macy's, Advance Auto Parts, Genuine Parts Company, and British Telecommunications plc.

## Mission

To be a human change agent — building the practices, people, and platforms that make AI-led transformation
real and sustainable for enterprise organizations.

## Focus Areas

{% include focus-areas.html %}

## Leadership Philosophy

- **Always Current**: Life-long learner who makes time for reading and stays ahead of the AI/Data curve
- **Purpose Driven**: Committed to building a workforce that operates 10–20× more productively through AI
- **Democratize Knowledge**: Break down silos; make tools, playbooks, and assets accessible across teams

## Education

**Master of Business Administration** — Georgia Institute of Technology, Atlanta (2021)

**Master of Statistics** — Indian Statistical Institute, Kolkata (1999)  
*Specialization: Statistical Quality Control & Operations Research*

**Bachelor of Statistics (Honors)** — Indian Statistical Institute, Kolkata (1997)
```

---

### Step 2.3 — Experience / Timeline Page (`_pages/experience.md`)
Create `_pages/experience.md`:

```markdown
---
layout: single
title: "Experience"
permalink: /experience/
author_profile: true
---

25+ years of progressive leadership in data, analytics, and AI — from systems engineer to AI Innovation Director.

{% include timeline.html %}
```

Create `_data/career.yml` with the approved timeline data from `TODO.md` Section 5:

```yaml
- title: "Director, AI Solutions & Rapid Build Camps"
  org: "Tata Consultancy Services — AI & Services Transformation, Americas"
  start: "Apr 2025"
  end: "Present"
  summary: "Leading billable AI Innovation Camps and Rapid Build practices across the Americas. Building composable accelerators, delivery playbooks, and reusable codebases targeting 50%+ velocity improvement in AI MVP delivery."

- title: "Head, AI Innovation Americas / Head, AI & Data (Retail Americas)"
  org: "Tata Consultancy Services"
  start: "2022"
  end: "2025"
  summary: "P&L ownership ~$25M; grew portfolio 50%+ in 3 years. Led 200+ member team transformation to AI-first model. Drove Agentic AI and GenAI pursuits across healthcare, engineering, and technology sectors."

- title: "Consulting Director, Data & Analytics"
  org: "Tata Consultancy Services"
  start: "2019"
  end: "2022"
  location: "Atlanta, Georgia, USA"
  summary: "D&A strategy consulting at CXO/ELT level. Led transformations at Macy's, Advance Auto Parts, and Genuine Parts Company. GCP AI/ML platform delivery. Non-CIO D&A initiatives at The Home Depot and HD Supply."

- title: "Consulting Director, Data & Analytics"
  org: "Tata Consultancy Services"
  start: "2015"
  end: "2019"
  location: "Atlanta, Georgia, USA"
  summary: "Enterprise-scale D&A solutions architecture, cloud migration, and self-serve BI platform design. Architected modern data lakehouse and advanced analytics platforms."

- title: "Technical Architect & Program Manager"
  org: "Tata Consultancy Services"
  start: "2005"
  end: "2015"
  location: "Atlanta, Georgia, USA"
  summary: "Architected enterprise EDW, data integration, and BI systems. Established the D&A COE and services delivery team at The Home Depot."

- title: "Systems Engineer → Technical Lead"
  org: "Tata Consultancy Services"
  start: "1999"
  end: "2005"
  location: "Cardiff, Wales, UK & Chennai, India"
  summary: "Developer, designer, and tester on enterprise data warehouse and billing systems for British Telecommunications plc."
```

Create `_includes/timeline.html`:
```html
<div class="timeline">
  {% for item in site.data.career %}
  <div class="timeline-item">
    <div class="dates">{{ item.start }} – {{ item.end }}</div>
    <h3>{{ item.title }}</h3>
    <div class="org">{{ item.org }}</div>
    <p>{{ item.summary }}</p>
  </div>
  {% endfor %}
</div>
```

---

### Step 2.4 — What I Build Page (`_pages/what-i-build.md`)
Create `_pages/what-i-build.md`:

```markdown
---
layout: collection
title: "What I Build"
permalink: /what-i-build/
collection: projects
entries_layout: grid
author_profile: true
---

Reusable accelerators, reference architectures, and rapid-delivery systems that help enterprises 
move from AI ambition to production outcomes — fast.
```

Create individual project files in `_projects/` for each approved card from `TODO.md` Section 7.

Also create `_data/industries.yml`:
```yaml
- name: Retail
  icon: "🛒"
  clients_note: "The Home Depot, HD Supply, Macy's, Advance Auto Parts, Genuine Parts Company"
- name: Telecom
  icon: "📡"
  clients_note: "British Telecommunications plc"
- name: Healthcare & Life Sciences
  icon: "🏥"
  clients_note: "Enterprise-scale governance and Responsible AI"
- name: Travel & Hospitality
  icon: "✈️"
  clients_note: "D&A strategy and modernization"
- name: CPG & Manufacturing
  icon: "🏭"
  clients_note: "Analytics transformation"
- name: Engineering & EPC
  icon: "⚙️"
  clients_note: "AI workshop and Agentic AI architecture"
```

And add an industry strip include `_includes/industries.html`:
```html
<section class="industries-section">
  <h2>Industries Served</h2>
  <div class="industries-grid">
    {% for industry in site.data.industries %}
    <div class="industry-chip">
      <span class="icon">{{ industry.icon }}</span>
      <span class="label">{{ industry.name }}</span>
    </div>
    {% endfor %}
  </div>
</section>
```

Example: `_projects/agentic-ai-platform.md`:
```markdown
---
title: "Composable Agentic AI Platform"
excerpt: "Logical and technical reference architecture for enterprise-grade Agentic AI across AWS, Azure, and GCP."
header:
  teaser: /assets/img/projects/agentic-ai.svg
tags: [Agentic AI, Architecture, Cloud]
---

A multi-cloud reference architecture for composable Agentic AI systems — designed for 
enterprise scale, governance, and rapid MVP delivery.

**Key capabilities:**
- Multi-cloud deployment patterns (AWS Bedrock, Azure AI Studio, GCP Vertex AI)
- Composable agent orchestration layer
- Responsible AI guardrails and governance hooks
- Reusable accelerator components for 50%+ velocity improvement
```

---

### Step 2.5 — Resume Page (`_pages/resume.md`)
Create `_pages/resume.md`:

```markdown
---
layout: single
title: "Resume"
permalink: /resume/
author_profile: true
toc: false
---

<div class="resume-wrapper">
  <div class="resume-actions">
    <a href="/assets/docs/bhaskar-bhaumik-resume.pdf" download class="btn-download">
      ⬇ Download PDF
    </a>
    <a href="javascript:window.print()" class="btn-print">
      🖨 Print
    </a>
    <a href="https://www.linkedin.com/in/bhaskarbhaumik" target="_blank" class="btn-linkedin">
      LinkedIn Profile →
    </a>
  </div>

  <!-- PDF Viewer (desktop) -->
  <object class="pdf-embed" data="/assets/docs/bhaskar-bhaumik-resume.pdf" type="application/pdf">
    <p>Your browser doesn't support inline PDF viewing. 
    <a href="/assets/docs/bhaskar-bhaumik-resume.pdf">Download the resume PDF</a> instead.</p>
  </object>
</div>

---

## Career Summary

> 25+ years building Data & AI capabilities for enterprise organizations across Retail, Telecom, Healthcare, Travel & Hospitality, and CPG.  
> Managing Consultant, AI & ST — Tata Consultancy Services, Atlanta, Georgia.

### Current Role
**Director, AI Solutions & Rapid Build Camps** *(Apr 2025 – Present)*  
AI & Services Transformation — Tata Consultancy Services, Americas

Leading billable AI Innovation Camps and Rapid Build practices. Composable accelerators targeting 50%+ improvement in AI MVP delivery velocity.

### Education
- **MBA** — Georgia Institute of Technology (2021)
- **M.Stat** — Indian Statistical Institute, Kolkata (1999) · *Statistical Quality Control & Operations Research*
- **B.Stat (Honors)** — Indian Statistical Institute, Kolkata (1997)

[... additional HTML resume content rendered from approved career timeline data ...]
```

---

### Step 2.6 — Contact Page (`_pages/contact.md`)
Create `_pages/contact.md`:

```markdown
---
layout: single
title: "Get in Touch"
permalink: /contact/
author_profile: true
---

Whether you want to discuss an AI transformation challenge, a Rapid Build Camp engagement, 
or just connect — I'd love to hear from you.

<form action="https://formspree.io/f/YOUR_FORM_ID" method="POST">
  <div class="form-group">
    <label for="name">Name</label>
    <input type="text" id="name" name="name" required>
  </div>
  <div class="form-group">
    <label for="email">Email</label>
    <input type="email" id="email" name="_replyto" required>
  </div>
  <div class="form-group">
    <label for="subject">Subject</label>
    <input type="text" id="subject" name="subject">
  </div>
  <div class="form-group">
    <label for="message">Message</label>
    <textarea id="message" name="message" rows="6" required></textarea>
  </div>
  <button type="submit" class="btn-primary">Send Message</button>
</form>

### Or find me on:
- 💼 [LinkedIn](https://www.linkedin.com/in/bhaskarbhaumik)
- 💻 [GitHub](https://github.com/bhaskarbhaumik)
- 🤗 [Hugging Face](https://huggingface.co/bbhaskar2025)
```

---

## PHASE 3 — Navigation & Includes

### Step 3.1 — Navigation (`_data/navigation.yml`)
```yaml
main:
  - title: "Home"
    url: /
  - title: "About"
    url: /about/
  - title: "Experience"
    url: /experience/
  - title: "What I Build"
    url: /what-i-build/
  - title: "Resume"
    url: /resume/
  - title: "Blog"
    url: /blog/
  - title: "Contact"
    url: /contact/
```

---

### Step 3.2 — Hero Include (`_includes/hero-section.html`)
```html
<section class="hero-banner">
  <h1>Bhaskar Bhaumik</h1>
  <p class="hero-tagline">AI Innovation Leader · Data & Analytics Architect · Builder of Futures</p>
  <div class="hero-cta">
    <a href="/resume" class="primary">View Resume</a>
    <a href="/what-i-build" class="secondary">What I Build</a>
    <a href="/contact" class="secondary">Let's Connect</a>
  </div>
</section>
```

---

### Step 3.3 — Focus Areas Include (`_includes/focus-areas.html`)
```html
<div class="focus-grid">
  <div class="focus-card">
    <div class="icon">🤖</div>
    <h3>AI-Led Services Transformation</h3>
    <p>Building reusable AI transformation playbooks and composable accelerators for enterprise-scale adoption and measurable ROI.</p>
  </div>
  <div class="focus-card">
    <div class="icon">⚡</div>
    <h3>Rapid Build Camps</h3>
    <p>Structured innovation sprints delivering AI MVPs in weeks, not months — with reusable codebases cutting delivery velocity by 50%+.</p>
  </div>
  <div class="focus-card">
    <div class="icon">🧠</div>
    <h3>Agentic & Generative AI</h3>
    <p>Designing multi-agent AI architectures across AWS Bedrock, Azure AI Studio, and GCP Vertex AI for enterprise-grade deployments.</p>
  </div>
  <div class="focus-card">
    <div class="icon">🏗️</div>
    <h3>Data Lakehouse & Cloud Migration</h3>
    <p>Low/no-touch lakehouse platforms architected for performance and scalability — including on-prem EDW to GCP migrations at retail scale.</p>
  </div>
  <div class="focus-card">
    <div class="icon">📊</div>
    <h3>Self-Serve BI & Advanced Analytics</h3>
    <p>Modern self-serve data prep, BI/reporting, OLAP, and AI/ML platforms that put insight in the hands of business users.</p>
  </div>
  <div class="focus-card">
    <div class="icon">🛡️</div>
    <h3>Data Governance & Responsible AI</h3>
    <p>Data catalog, metadata management, DLP/security, privacy, and responsible AI frameworks at enterprise and healthcare scale.</p>
  </div>
</div>
```

---

## PHASE 4 — SEO, Sitemap & Social

### Step 4.1 — robots.txt
Create `robots.txt`:
```
User-agent: *
Allow: /
Sitemap: https://bhaskarbhaumik.github.io/sitemap.xml
```

### Step 4.2 — Open Graph image
Place `assets/img/og-image.jpg` (1200×630px) and reference in `_config.yml`:
```yaml
og_image: /assets/img/og-image.jpg
```

### Step 4.3 — Schema.org structured data
Add to `_includes/head/custom.html`:
```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Person",
  "name": "Bhaskar Bhaumik",
  "jobTitle": "Director, AI Solutions & Rapid Build Camps",
  "worksFor": { "@type": "Organization", "name": "Tata Consultancy Services" },
  "url": "https://bhaskarbhaumik.github.io",
  "alumniOf": [
    { "@type": "CollegeOrUniversity", "name": "Georgia Institute of Technology", "award": "MBA, 2021" },
    { "@type": "CollegeOrUniversity", "name": "Indian Statistical Institute", "award": "Master of Statistics, 1999" }
  ],
  "knowsAbout": ["Artificial Intelligence", "Agentic AI", "Generative AI", "Data Architecture", "Enterprise Analytics", "Rapid Prototyping", "Data Lakehouse"],
  "sameAs": [
    "https://www.linkedin.com/in/bhaskarbhaumik",
    "https://github.com/bhaskarbhaumik"
  ],
  "address": { "@type": "PostalAddress", "addressLocality": "Atlanta", "addressRegion": "GA", "addressCountry": "US" }
}
</script>
```

---

## PHASE 5 — GitHub Actions CI/CD

### Step 5.1 — Deploy Workflow
Create `.github/workflows/deploy.yml`:
```yaml
name: Build and Deploy Jekyll Site

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

permissions:
  contents: read
  pages: write
  id-token: write

concurrency:
  group: "pages"
  cancel-in-progress: false

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Setup Ruby
        uses: ruby/setup-ruby@v1
        with:
          ruby-version: '3.2'
          bundler-cache: true

      - name: Setup Pages
        uses: actions/configure-pages@v5

      - name: Build Jekyll
        run: bundle exec jekyll build --baseurl ""
        env:
          JEKYLL_ENV: production

      - name: Upload artifact
        uses: actions/upload-pages-artifact@v3

  deploy:
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    needs: build
    steps:
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4
```

**Verification**: Push to `main` → GitHub Actions tab shows green deploy → site is live at `https://bhaskarbhaumik.github.io`.

---

## PHASE 6 — Custom Domain (Optional)

### Step 6.1 — CNAME File
If using `bhaskar.bhaumik.org`:
```bash
echo "bhaskar.bhaumik.org" > CNAME
```

### Step 6.2 — DNS Configuration
Add these records in your DNS provider:
```
Type   Host    Value
A      @       185.199.108.153
A      @       185.199.109.153
A      @       185.199.110.153
A      @       185.199.111.153
CNAME  bhaskar bhaskarbhaumik.github.io
```

### Step 6.3 — Enable HTTPS
- In GitHub repo → Settings → Pages → check **Enforce HTTPS** (after DNS propagates ~24h)
- Update `url` in `_config.yml` to `https://bhaskar.bhaumik.org`

---

## PHASE 7 — Final QA Checklist

Run the following checks before considering the site "done":

```bash
# Local build check
bundle exec jekyll build --strict_front_matter

# Check for broken links
gem install html-proofer
bundle exec htmlproofer ./_site --disable-external --allow-hash-href
```

| Check | Tool | Pass? |
|-------|------|-------|
| Mobile responsive (320px, 768px, 1440px) | Browser DevTools | ☐ |
| Lighthouse Score ≥ 90 (Performance, SEO, Accessibility) | Chrome Lighthouse | ☐ |
| Resume PDF downloads correctly | Browser | ☐ |
| All nav links resolve | Browser | ☐ |
| Open Graph preview (LinkedIn share) | [opengraph.xyz](https://www.opengraph.xyz) | ☐ |
| Schema.org validation | [schema.org/validator](https://validator.schema.org) | ☐ |
| Sitemap accessible at `/sitemap.xml` | Browser | ☐ |
| Contact form delivers email | Formspree test | ☐ |
| Dark mode readable | Browser | ☐ |
| GitHub Actions deploy succeeds | GitHub Actions tab | ☐ |

---

## PHASE 8 — Launch Sequence

```bash
# Final commit and push
git add -A
git commit -m "feat: initial world-class personal site launch"
git push origin main
```

Post-launch tasks:
1. Share the URL on LinkedIn with a brief post about the site
2. Submit sitemap to Google Search Console: `https://search.google.com/search-console`
3. Add the site URL to your LinkedIn profile
4. Update your GitHub profile README to link to the site

---

## 📁 Final File Tree

```
bhaskarbhaumik.github.io/
├── .github/
│   └── workflows/
│       └── deploy.yml
├── _data/
│   ├── career.yml
│   ├── industries.yml
│   └── navigation.yml
├── _includes/
│   ├── hero-section.html
│   ├── focus-areas.html
│   ├── industries.html
│   ├── timeline.html
│   ├── featured-achievements.html
│   └── head/
│       └── custom.html
├── _pages/
│   ├── about.md
│   ├── blog.md
│   ├── contact.md
│   ├── experience.md
│   ├── resume.md
│   └── what-i-build.md
├── _projects/
│   ├── agentic-ai-platform.md
│   ├── rapid-build-camps.md
│   ├── data-lakehouse-gcp.md
│   ├── enterprise-da-coe.md
│   └── [other approved projects]
├── _posts/
│   └── [seed blog posts if applicable]
├── assets/
│   ├── css/
│   │   └── custom.scss
│   ├── docs/
│   │   └── bhaskar-bhaumik-resume.pdf   ← 🔴 REQUIRED
│   └── img/
│       ├── headshot.jpg                  ← 🔴 REQUIRED
│       ├── hero-bg.jpg                   ← 🟡 recommended
│       ├── og-image.jpg                  ← 🟡 recommended
│       └── projects/
│           └── [project teaser images]
├── _config.yml
├── Gemfile
├── Gemfile.lock
├── index.md
├── CNAME                                 ← only if using custom domain
└── robots.txt
```

---

*Built with Jekyll + Minimal Mistakes · Deployed via GitHub Actions · Designed for Bhaskar Bhaumik*
