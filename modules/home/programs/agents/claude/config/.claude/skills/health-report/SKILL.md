---
name: health-report
description: >
  Parallel repository health audit using arbiter, dungeon-master, rules-lawyer, and
  ward-keeper. Produces a structured report with an executive summary covering code
  quality, architecture, risk, and security.
---

Spawn all four agents **in a single message** (parallel). Do not wait between spawns.

## Agents to spawn

**arbiter** — Code quality
> Audit the full codebase for code quality issues across all source files. Do not limit to the latest diff. Find: logic defects, error handling gaps, anti-patterns, SOLID violations, duplicated logic, unclear names. Rate each finding CRITICAL/HIGH/MEDIUM/LOW with confidence LOW/MEDIUM/HIGH. Return findings only — no intro, no sign-off.

**dungeon-master** — Architecture & design
> Survey the full repository. Map project structure and dependencies. Assess separation of concerns, coupling, cohesion, and architectural debt. Cite every finding with file:line. Return findings only — no intro, no sign-off.

**rules-lawyer** — Risk & gaps
> Adversarially review the full codebase for fragile assumptions, unhandled failure modes, missing edge cases, missing tests, and documentation gaps. Verify every technical claim against the actual source. Return findings only — no intro, no sign-off.

**ward-keeper** — Security
> Audit the full codebase for secrets, OWASP Top 10 violations, input validation gaps, dependency vulnerabilities, and misconfigurations. Run available dependency audit tools. Return findings only — no intro, no sign-off.

## Report template

After all four agents return, produce this report exactly:

---

# Repository Health Report

**Date:** {today}
**Repository:** {repo name}
**Branch:** {current branch}
**Commit:** {short HEAD SHA}

---

## Executive Summary

**Overall Health:** {CRITICAL | POOR | FAIR | GOOD | EXCELLENT}

| Dimension        | Agent          | Result                               |
|------------------|----------------|--------------------------------------|
| Code Quality     | Arbiter        | {N critical, N high, N medium, N low} |
| Architecture     | Dungeon Master | {N findings}                         |
| Risk & Gaps      | Rules Lawyer   | {REJECT / REVISE / ACCEPT-WITH-RESERVATIONS / ACCEPT} |
| Security         | Ward Keeper    | {N critical, N high, N medium, N low} |

**Top actions (cross-agent, highest priority first):**
- {finding 1}
- {finding 2}
- {finding 3}

---

## Code Quality

**Verdict:** {arbiter verdict — APPROVE / REQUEST CHANGES / COMMENT}

### Critical & High
- {finding — file:line — why it matters}

### Medium & Low
- {finding — file:line}

### Strengths
- {what was done well}

---

## Architecture & Design

**Assessment:** {1-sentence overall assessment}

### Findings
- {finding — file:line}

### Recommendations
- {action — effort/impact note}

---

## Risk & Gaps

**Verdict:** {REJECT / REVISE / ACCEPT-WITH-RESERVATIONS / ACCEPT}

### Critical Findings
- {finding — evidence}

### Major Findings
- {finding — evidence}

### What's Missing
- {gap or unhandled case}

---

## Security

**Risk Level:** {CRITICAL | HIGH | MEDIUM | LOW}

### Findings
- {[SEVERITY] title — OWASP category — file:line — exploitability — remediation note}

### Checklist
- Secrets: {PASS / FAIL}
- Input validation: {PASS / FAIL}
- Injection: {PASS / FAIL}
- Authn/authz: {PASS / FAIL}
- Dependencies: {PASS / FAIL / N/A}

---

Rules:
- Prefer bullet points over paragraphs throughout the report.
- Keep sentences short.
- Omit sections that have no findings (e.g., if security has zero issues, collapse it to one line under the heading).
- Do NOT include an Appendix or raw agent output unless the user explicitly asks.
