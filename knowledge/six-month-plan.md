# Six-Month Plan — VP Engineering at Finary

## Framework: Listen → Prove → Scale

Erlé's approach to the first 6 months is structured in 3 phases, adapted from the classic 30/60/90 model but calibrated for Finary's specific context: AI-native transformation, 30 engineers, remote-first, direct CEO report.

### Why This Framework
Learned from a past consulting mistake where pushing transformation too fast lost team buy-in. The fix: earn trust with data, prove the approach on willing squads, then scale what works.

## Phase 1: Listen & Baseline (Months 1-2)

### Month 1 — "Align & Audit"
- Week 1 onsite: lock OKRs with Mounir, become a Finary power user, 1:1 with every tech lead
- Hands-on commitment (Months 1-3): personally review 2-3 PRs/week, pair on first AI workflow, build first agent prototype himself
- DORA metrics baseline (deployment frequency, lead time, change failure rate, MTTR)
- Architecture review, tech debt map, CI/CD audit
- Identify 2-3 natural AI champions in the team
- Assess Affluent integration (2025 acquisition)
- Mobile engineering baseline: deploy frequency, build time, crash rates, native tech debt
- Hiring gap analysis: current headcount vs. 30-person target
- Deliverable: "State of Engineering" dashboard — DORA by squad, mobile KPIs, tech debt map, hiring gaps

### Month 2 — "Vision & First Moves"
- Present AI-native vision (inspire, don't mandate)
- Launch AI Sandbox for experimentation
- Define 3 pilot workflows: AI code review, test generation, documentation
- Establish engineering principles and rituals
- First quick win: fix the #1 team irritant
- Cross-functional rhythms: weekly Product→Eng sync, bi-weekly Data→Eng, weekly Ops→Eng
- Affluent integration kickoff: API schema mapping, data model delta analysis, auth federation design
- Launch hiring pipeline: senior AI engineer, 2 mobile engineers, 1 EM
- Deliverable: AI-native roadmap + Engineering Principles + Sandbox + hiring active

## Phase 2: Prove (Months 3-4)

### Month 3 — "Prove It Works"
- 2 pilot squads adopt AI workflows (with champions)
- Measure: code review time, test coverage, cycle time before/after
- Ship first internal AI agent to production
- Affluent integration v1: shared auth in staging, unified portfolio schema, migration plan
- AI compliance framework v1 (AMF/ACPR): output guardrails, human review triggers, audit logging, legal sign-off gate. Full audit trail (model version, input context, confidence score). Coordination with DPO/RSSI. Adversarial testing protocol (prompt injection, bias detection)
- Onsite retro with the team
- Deliverable: pilot metrics + first agent + compliance draft

### Month 4 — "Expand & Iterate"
- Extend AI workflows to all squads (with pilot lessons)
- Financial guidance agent v0.1: RAG over financial knowledge + portfolio data, risk profiling, compliance guardrails, launch gate (engagement ≥40%, 0 regulatory flags)
- Affluent integration v2: progressive user migration (10% cohort), data integrity monitoring
- CI/CD optimization for AI-native development
- Engineering career framework with AI competencies
- Anonymous team survey on transformation
- Fallback if not ready: ship MVP scope (portfolio summary agent, synthesis only) to validate RAG pipeline without compliance risk
- Deliverable: 100% squads on AI + guidance agent v0.1

## Phase 3: Scale (Months 5-6)

### Month 5 — "Industrialize"
- DORA comparison M1 vs M5 (target: 2x deploy frequency, -40% lead time)
- Quality metrics M1 vs M5: defect escape rate (target: -30%), critical bugs per release (<2), AI-assisted review coverage (target: 100% PRs)
- User-facing AI agents in production
- Engineering documentation and onboarding
- Affluent integration finalized: shared auth, portfolio data union, retention target ≥95% at 90 days
- Engineering brand (blog, open source, tech talks)
- Deliverable: DORA dashboard + quality metrics + user agents + brand launch

### Month 6 — "Prove the Bet"
- Full productivity assessment on 5 target workflows (code review turnaround, test generation, incident triage MTTR, documentation, deploy lead time). Target: 3-5x on at least 3 of 5 vs M1 baseline
- Board presentation with numbers
- 12-month roadmap + 10-year technical vision draft (Finary as "central nervous system" for personal wealth)
- Team retrospective + challenge session: what worked, what didn't, what we stop
- Deliverable: Transformation Report + 10-year vision

## CEO Relationship Approach

When priorities diverge: propose Plan B (light version fast + full version on schedule). The CEO sees the tradeoff and decides. This isn't compromise — it's structured decision-making.

Weekly sync: 15 minutes — what shipped, what's blocked, what decision is needed. No status theater.

## Handling AI Resistance

1. Listen first (understand the real fear)
2. Address the substance (adapt if valid)
3. Demo, don't debate (show AI on their code)
4. Never mandate (create conditions, not requirements)
5. Celebrate early adopters (social proof > authority)

## How I'll Lead Remote-First

Async by default (ADRs/RFCs), AI demos recorded and shared, pair programming via screen-share. Onsite rhythm: M1 listening tour, M3 retro, M6 board presentation. Monthly virtual show-and-tell for squad AI wins.

## Key Risks & Mitigations

- 6-month deadline: phase the transformation, prove before scaling
- Team resistance: listen-first, champions strategy
- Compliance: early framework (Month 3), legal review before user-facing
- Management scale (13→30): lean on existing EMs, hire senior EM if needed
- Tech debt: fix only the AI blockers, don't boil the ocean
- Key talent attrition: retention interviews M2, career framework accelerated, AI as skill investment
- AI champion burnout: rotate quarterly, 20% protected time, backup champion per squad
