# ask-erle

An AI agent that answers any question about Erlé Alberton's professional background, skills, and experience. Built with [Claude Code](https://claude.ai/code) as a single-skill agent with RAG over structured knowledge files.

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
career.md    ai-native.md    leadership.md    tech-stack.md
projects.md  values.md       sources.md
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
├── .claude/
│   └── skills/
│       └── answer/
│           └── SKILL.md         # Single skill: route → read → answer
├── knowledge/
│   ├── career.md                # 20+ years career timeline with metrics
│   ├── ai-native.md             # AI agent building (53 skills, 48 agents)
│   ├── leadership.md            # Team management, consulting, speaking
│   ├── tech-stack.md            # Languages, tools, infrastructure
│   ├── projects.md              # OMKomUnity, Boilerplate, Sport2000, Orange
│   ├── values.md                # Work philosophy, approach, what drives me
│   └── sources.md               # Verified public URLs for web fallback
└── README.md
```

### Design principles

| Decision | Rationale |
|----------|-----------|
| **Claude Code, not API** | Zero setup friction. Clone + `claude` = running. |
| **Markdown knowledge, not vector DB** | 7 files totaling ~1500 lines. Fits in context. Embeddings would be overengineering. |
| **Single skill, not multi-skill** | One job: answer questions. YAGNI. |
| **Structured sections with headers** | Claude locates relevant info faster with clear sections. |
| **Web fallback via sources.md** | Verified URLs only. Falls back gracefully when knowledge files don't cover a topic. |
| **Honest about gaps** | Hardcoded in CLAUDE.md rules. The agent will tell you what Erlé hasn't done. |

---

## What It Demonstrates

This repo is itself a portfolio piece. It shows:

1. **Agent architecture** — how to structure a Claude Code project for a specific domain
2. **Knowledge grounding** — RAG without infrastructure, using structured markdown
3. **Behavioral constitution** — CLAUDE.md as enforceable rules, not suggestions
4. **Minimal viable agent** — the right amount of complexity for the job (not more)
5. **Builder mentality** — the medium IS the message

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

### Meta
```
"Why did he build this agent instead of just sending a CV?"
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

*Built with Claude Code. No frameworks were harmed in the making of this agent.*
