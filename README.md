# ask-erle

[![Built with Claude Code](https://img.shields.io/badge/Built_with-Claude_Code-blueviolet?logo=claude&logoColor=white)](https://claude.ai/code)
[![Security Policy](https://img.shields.io/badge/security-policy-green?logo=shield)](SECURITY.md)
[![Knowledge Files](https://img.shields.io/badge/knowledge-10_files-blue)]()
[![GA4 Tracking](https://img.shields.io/badge/analytics-opt--in_GA4-orange?logo=google-analytics)]()

An AI agent that answers any question about Erle Alberton's professional background, skills, and experience. Co-built with [Claude Code](https://claude.ai/code) as a single-skill agent with RAG over structured knowledge files.

Instead of sending a CV, I built an agent that presents it.

---

## Quick Start

### Prerequisites

- [Claude Code CLI](https://docs.anthropic.com/en/docs/claude-code) installed and authenticated
- Git

That's it. No API keys, no dependencies, no build step.

### Step 1 — Clone

```bash
git clone https://github.com/omkom/ask-erle.git
cd ask-erle
```

### Step 2 — Verify structure

```bash
# Should show: CLAUDE.md, README.md, .claude/, knowledge/
ls -la
# Should show 7 knowledge files
ls knowledge/
```

Expected output:
```
career.md         ai-native.md      leadership.md     tech-stack.md
projects.md       values.md         sources.md        management-style.md
six-month-plan.md methodology.md
```

### Step 3 — Launch the agent

```bash
claude
```

Claude Code will automatically load `CLAUDE.md` as the system prompt and discover the `answer` skill in `.claude/skills/`.

### Step 4 — Ask anything

```
> What's Erlé's hands-on AI experience?
> Has he managed engineering teams? Be honest about gaps.
> What's his backend and infrastructure stack?
> Tell me about his fintech experience
> What would he build first as VP Engineering at a fintech?
> How does he compare to a typical VP Eng candidate?
```

The agent reads the relevant knowledge file(s), composes a grounded answer with specific metrics and dates, and can fall back to verified web sources when needed.

---

## How It Works

```
┌─────────────────────────────────────────────────┐
│  Recruiter asks a question                      │
└───────────────────┬─────────────────────────────┘
                    ↓
┌─────────────────────────────────────────────────┐
│  CLAUDE.md: behavioral rules + routing logic    │
│  → Be specific, be honest, be concise           │
│  → Route to the right knowledge file            │
└───────────────────┬─────────────────────────────┘
                    ↓
┌─────────────────────────────────────────────────┐
│  answer skill: classify → read → compose        │
│  → Read 1-3 knowledge files                     │
│  → If gap: check sources.md → WebFetch          │
└───────────────────┬─────────────────────────────┘
                    ↓
┌─────────────────────────────────────────────────┐
│  Grounded answer with metrics, dates, projects  │
│  Honest about gaps, with transferable skills     │
└─────────────────────────────────────────────────┘
```

## Architecture

```
ask-erle/
├── CLAUDE.md                    # Agent constitution + behavioral rules
├── SECURITY.md                  # Security policy + responsible disclosure
├── .claude/
│   └── skills/
│       └── answer/
│           └── SKILL.md         # Single skill: route → read → answer → track
├── scripts/
│   └── track-event.sh           # GA4 Measurement Protocol (opt-in)
├── knowledge/
│   ├── career.md                # 20+ years career timeline with metrics
│   ├── ai-native.md             # AI agent building (53 skills, 48 agents)
│   ├── leadership.md            # Team management, consulting, speaking
│   ├── tech-stack.md            # Languages, tools, infrastructure
│   ├── projects.md              # OMKomUnity, Boilerplate, Sport2000, Orange
│   ├── values.md                # Work philosophy, approach, what drives me
│   ├── management-style.md      # 1:1s, resistance handling, CEO relationship
│   ├── six-month-plan.md        # VP Eng transformation: Listen → Prove → Scale
│   ├── methodology.md           # How this agent was built (transparency)
│   └── sources.md               # Verified public URLs for web fallback
├── .env.example                 # GA4 config template (tracking is opt-in)
└── README.md
```

### Design principles

| Decision | Rationale |
|----------|-----------|
| **Claude Code, not API** | Zero setup friction. Clone + `claude` = running. |
| **Markdown knowledge, not vector DB** | 10 files totaling ~2500 lines. Fits in context. Embeddings would be overengineering. |
| **Single skill, not multi-skill** | One job: answer questions. YAGNI. |
| **Opt-in analytics** | GA4 Measurement Protocol, EU endpoint, no PII. Disabled by default. |
| **Transparent about AI co-creation** | This repo was co-built with Claude Code. That's the point. |
| **Structured sections with headers** | Claude locates relevant info faster with clear sections. |
| **Web fallback via sources.md** | Verified URLs only. Falls back gracefully when knowledge files don't cover a topic. |
| **Honest about gaps** | Hardcoded in CLAUDE.md rules. The agent will tell you what Erlé hasn't done. |

---

## How It Was Built (Transparency)

ask-erle was co-created with Claude Code. This is deliberate.

At VP Engineering level, the value is in **architecture decisions, quality control, and orchestration** — not typing every line. Erle designed the agent architecture, wrote the behavioral constitution, curated every fact, and quality-controlled every output. Claude Code structured the files, generated documentation, and implemented the tracking mechanism.

This is exactly the AI-native workflow proposed for engineering teams: humans set direction and define quality bars, AI handles execution. The result: 8 documents + a functioning agent produced in a single working session.

For details, ask the agent: *"How was this agent built?"* — it will answer from `knowledge/methodology.md`.

---

## What It Demonstrates

This repo is itself a portfolio piece. It shows:

1. **Agent architecture** — how to structure a Claude Code project for a specific domain
2. **Knowledge grounding** — RAG without infrastructure, using structured markdown
3. **Behavioral constitution** — CLAUDE.md as enforceable rules, not suggestions
4. **Minimal viable agent** — the right amount of complexity for the job (not more)
5. **Builder mentality** — the medium IS the message
6. **AI orchestration in practice** — co-built with Claude Code, transparently documented

---

## Sample Questions by Topic

### AI & Agents
```
"What AI systems has Erlé built?"
"Describe the 53-skill boilerplate in detail"
"How does OMKomUnity's multi-agent orchestration work?"
"What's his AI philosophy?"
```

### Engineering & Backend
```
"What's his tech stack?"
"Has he built production microservices?"
"What's his DevOps experience?"
"How many lines of code has he shipped recently?"
```

### Leadership & Management
```
"What's the largest team he's managed?"
"How does his consulting experience translate to team leadership?"
"What's his leadership style?"
"Be honest: what are his management gaps?"
```

### Fintech & Product
```
"What fintech experience does he have?"
"Does he manage his own money?"
"How would he approach building AI agents for personal finance?"
```

### Strategy & Management
```
"What's his 6-month plan as VP Engineering?"
"What's his management style?"
"How would he handle resistance to AI adoption?"
"How does he run 1:1s?"
```

### Meta
```
"Why did he build this agent instead of just sending a CV?"
"How was this agent built?"
"How is this repo structured and why?"
"What does this project tell you about how he thinks?"
```

---

## Customizing for Your Own Profile

Want to build your own `ask-[name]`? Fork this repo and:

1. Replace the content in `knowledge/*.md` with your own career data
2. Update `sources.md` with your public URLs
3. Adjust `CLAUDE.md` rules if needed (the behavioral framework works for any professional)
4. The skill in `.claude/skills/answer/SKILL.md` is generic — it should work as-is

The architecture is the contribution. The content is yours.

---

## About Me

I'm Erlé Alberton — 20+ years in engineering, product, and growth. I build AI-native systems daily: a 53-skill agentic work OS for my consulting practice, and OMKomUnity, a SaaS with 48 autonomous AI agents that orchestrate project scoping end-to-end. This repo is a small example of how I think about AI: practical, grounded, minimal, and useful.

[LinkedIn](https://www.linkedin.com/in/%F0%9F%95%89%EF%B8%8F-erl%C3%A9-alberton-561a7824/) | [GitHub](https://github.com/omkom) | erle.alberton@gmail.com

---

## Analytics (Opt-in)

ask-erle supports optional GA4 tracking via the Measurement Protocol. When configured, it fires a `skill_invoked` event after each answer — no question content is ever transmitted, only the skill name and source channel.

To enable:
1. Copy `.env.example` to `.env`
2. Fill in your GA4 Measurement ID and API Secret
3. Events will fire automatically via `scripts/track-event.sh`

Tracking is disabled by default. No `.env` = no tracking. See [SECURITY.md](SECURITY.md) for data handling details.

---

## Security

See [SECURITY.md](SECURITY.md) for the full security policy, including behavioral guardrails, data handling, and responsible disclosure.

---

*Co-built with Claude Code. The architecture is human. The execution is AI-assisted. No frameworks were harmed.*
