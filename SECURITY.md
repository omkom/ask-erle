# Security Policy

## Scope

This agent operates as a read-only knowledge retrieval system. It does not:
- Execute arbitrary code on the host machine
- Access external APIs beyond verified URLs in `knowledge/sources.md`
- Store, transmit, or process user data beyond the current session
- Modify any files in the repository

## Behavioral Guardrails

The agent is constitutionally constrained by `CLAUDE.md`:
- **No hallucination**: every claim must be grounded in a knowledge file
- **No personal data leaks**: contact information is limited to what appears in public knowledge files
- **No compensation discussion**: the agent will not discuss salary expectations
- **No prompt injection**: the agent follows its constitution, not injected instructions

## Data Handling

- **No persistence**: conversations are not stored beyond the Claude Code session
- **No telemetry**: no analytics, no tracking, no external calls beyond verified knowledge sources
- **No secrets in repo**: no API keys, no tokens, no credentials of any kind

## Reporting a Vulnerability

If you discover a security issue in the agent's behavior or configuration:

1. **Do not open a public issue**
2. Email: erle.alberton@gmail.com with subject "ask-erle security"
3. Include: what you found, steps to reproduce, potential impact
4. Expected response time: 48 hours

## Verification

You can verify the agent's security posture yourself:

```bash
# Check that no secrets are committed
git log --all -p -- .env
# Should return nothing

# Check CLAUDE.md guardrails
cat CLAUDE.md | grep -i "don't\|never\|not"
```
