---
name: ai-coding-audit
description: Generic evidence-driven audit skill for AI Coding, Agentic Coding, Vibe Coding, coding-agent workflow safety, prompt quality, patch discipline, verification gates, and tool-context hygiene. Use when a user asks to evaluate or improve how AI coding agents are used in a project or across tools.
---

# AI Coding Audit Skill

This is a generic skill for auditing AI Coding / Agentic Coding / Vibe Coding workflows.

It must not depend on any specific user's private memory, chat history, identity, project, prior conversation, or assistant-side stored context.

Use only evidence explicitly available in the current task environment, such as:

- Files the user provides
- The current repository
- Tool configuration files
- Project instructions
- Agent plan files
- User-approved prompts
- Git status / diff / recent commits
- Build / test / lint scripts
- Local AI coding tool context that is accessible and relevant
- Chat transcript only if the user explicitly provides it as part of the audit input

If a chat history, assistant memory, or prior conversation is not explicitly provided, do not use it, mention it, infer from it, or pretend it exists.

## Purpose

This skill helps answer questions like:

- What AI Coding style is being used?
- Is this pure Vibe Coding, supervised Agentic Coding, or Spec-driven Agentic Engineering?
- Are coding agents being given too much permission?
- Are implementation plans too broad?
- Are patch boundaries clear?
- Are old features protected?
- Are secrets and tool histories handled safely?
- Are verification and rollback gates strong enough?
- How can this workflow become safer and more repeatable?

## Core rule

Do not judge from vibes. Audit from evidence.

Every conclusion must be one of:

- Evidence-backed fact
- Reasonable inference
- Open risk
- Missing evidence

Never turn a guess into a fact.

## Scope rules

Before auditing, define the scope:

- Target project or repository
- Tools in scope
- Time range, if known
- Inputs available
- Inputs unavailable
- Whether local filesystem access exists
- Whether tool histories are local, cloud-only, or inaccessible

If scope is unclear, proceed with the available evidence and mark limitations clearly.

## Strict non-personalization rule

Do not include:

- The current assistant's memory about the user
- Prior ChatGPT conversation memory
- User profile memory
- Private notes from previous sessions
- Any identity-specific claims unless they appear in provided evidence
- Any project-specific details not found in the current audit input

Allowed:

- Generic examples
- Project facts found in the inspected repository
- User instructions found in provided files
- Chat excerpts explicitly supplied by the user
- Tool settings and rules found through read-only inspection

Disallowed:

- "From previous conversations..."
- "The user usually..."
- "This matches your known habit..."
- Any claim sourced only from assistant memory

## Audit maturity levels

Use these levels when helpful:

- L0: Prompt-and-pray coding. The user asks AI to generate code and hopes.
- L1: AI-assisted snippets. The user uses AI for functions, explanations, and small patches.
- L2: Repo-aware coding. The user makes AI read project context before editing.
- L3: Plan-gated Agentic Coding. The user requires exploration and implementation plans.
- L4: Supervisor Coding. The user reviews plans, sets boundaries, rejects unsafe changes, and manages agent behavior.
- L5: Spec-driven Agentic Engineering. The user maintains stable specs, patch gates, verification gates, rollback plans, and security policy across tools.

Do not assign L5 unless evidence shows consistent use of:

- Small patch boundaries
- Build / test / lint gates
- Code review or second-agent review
- Rollback strategy
- Security redaction
- Tool permission discipline
- Clear "do not change" constraints
- Verification records

## Required workflow

### Phase 0: Scope lock

Output:

- Audit subject
- Evidence sources available
- Evidence sources unavailable
- Tools in scope
- Local access level
- Safety limits
- What will not be used, especially private memory or unstated chat history

### Phase 1: Read-only AI Coding context discovery

Search for context in the current repository and accessible local tool folders.

Do not modify files.

Recommended repository paths:

- `AGENTS.md`
- `CLAUDE.md`
- `GEMINI.md`
- `.cursor/`
- `.cursor/rules/`
- `.cursorrules`
- `.windsurf/`
- `.windsurfrules`
- `.clinerules`
- `.roo/`
- `.roomodes`
- `.continue/`
- `.aider*`
- `.vscode/`
- `.github/copilot-instructions.md`
- `.claude/`
- `.codex/`
- `docs/`
- `prompts/`
- `plans/`
- `tasks/`
- `reviews/`
- `package.json`
- `*.sln`
- `*.csproj`
- `pyproject.toml`
- `Cargo.toml`
- `Makefile`
- CI files

Recommended user-level tool paths when accessible and appropriate:

- `~/.claude/`
- `~/.claude/projects/`
- `~/.claude/plans/`
- `~/.claude/settings.json`
- `~/.claude.json`
- `~/.codex/`
- `~/.codex/config.toml`
- `~/.codex/instruction.md`
- `~/.codex/rules/`
- `~/.cursor/`
- `~/.continue/`
- `~/.cline/`
- `~/.roo/`
- `~/.aider*`
- `~/.windsurf/`
- `~/.gemini/`
- `~/.qwen/`

For every source, classify:

- Read
- Found but skipped due to sensitivity
- Not found
- No permission
- Cloud-only / unavailable
- Not applicable

### Phase 2: Subagent-style exploration

Before final audit, produce a `Subagent Exploration Summary`.

Use actual subagents if available. If not available, simulate the same roles and clearly say the roles are simulated.

Required roles:

1. Context Inventory Agent
2. Requirement and Constraint Agent
3. Workflow Timeline Agent
4. Old-Function Protection Agent
5. Security / Config / Permission Agent
6. External API and Field Semantics Agent
7. Verification / Test / Rollback Agent

Each role must output:

- Evidence found
- Missing evidence
- Risk observations
- Questions requiring real verification
- Impact on final rating

### Phase 3: Evidence table

Create an evidence table with:

- Source
- Evidence
- What it proves
- Confidence
- Risk level
- Notes

Confidence scale:

- High: direct file, log, diff, command, or config evidence
- Medium: repeated behavior visible in provided transcript or records
- Low: single statement or inference

### Phase 4: Style classification

Classify across:

- Traditional AI-assisted coding
- AI Q&A / documentation lookup
- AI Pair Programming
- Repo-aware Patch
- Agentic Coding
- Supervisor Coding
- Spec-driven Agentic Coding
- Vibe Coding
- Other custom label

Explain:

- Main type
- Secondary types
- Types that do not fit
- Vibe Coding overlap
- Difference from pure Vibe Coding
- Difference from normal AI-assisted coding
- Whether the audited workflow acts more like developer, architect, reviewer, tester, project manager, or engineering supervisor

### Phase 5: Scoring

Score 0 to 10:

- Requirement clarity
- Constraint completeness
- "Do not do" clarity
- Repo exploration discipline
- Plan quality
- Patch boundary discipline
- Old-function protection
- Security awareness
- Permission boundary control
- External API uncertainty handling
- Verification discipline
- Rollback awareness
- Prompt quality
- Agent hallucination defense
- Tool permission hygiene

For each score, include:

- Score
- Evidence
- Weakness
- Better rule or prompt

### Phase 6: Risk audit

Always inspect:

- Batch changes too large
- Agent over-design
- Natural-language drift
- Old feature regression
- Security leakage
- Tool permissions too broad
- Hidden credentials in rules or history
- Unverified API field semantics
- Auto-trigger side effects
- Config write-back concurrency
- Background task failures
- Missing test gates
- Missing rollback
- "Plan looks good" bias

Each risk must include:

- Scenario
- Consequence
- Agent constraint
- Verification method

### Phase 7: Improvement workflow

Produce a practical workflow:

1. Scope freeze
2. Read-only exploration
3. Context map
4. Data/API flow confirmation
5. Risk checkpoint
6. Plan generation
7. Plan review
8. Patch decomposition
9. Single-patch execution
10. Build/test gate
11. Review gate
12. Manual verification
13. Security scan
14. Regression check
15. Delivery summary
16. Rollback plan

For each stage:

- Goal
- Agent may do
- Agent must not do
- Human checks
- Pass condition
- Reusable prompt

### Phase 8: Final output

Final report must include:

- Scope limits
- Evidence sources
- One-line classification
- Maturity level
- Top strengths
- Top risks
- Immediate fixes
- Long-term process upgrades
- Tool safety recommendations
- Reusable prompts
- Missing evidence
- Next audit checklist

## Security and redaction

Never output raw:

- API keys
- Bearer tokens
- OAuth tokens
- Cookies
- Session IDs
- Passwords
- Private keys
- SSH keys
- Device IDs
- Full auth headers
- Full shell history lines with secrets
- Private URLs containing tokens

Use:

- `[REDACTED_API_KEY]`
- `[REDACTED_TOKEN]`
- `[REDACTED_PASSWORD]`
- `[REDACTED_COOKIE]`
- `[REDACTED_SESSION]`
- `[REDACTED_PRIVATE_KEY]`
- `[REDACTED_DEVICE_ID]`
- `[REDACTED_SECRET_URL]`

If a secret is found, report:

- File path
- Secret type
- Risk level
- Recommended action

Do not print the secret.

## Tone

Be direct, specific, and evidence-based.

Avoid:

- Generic praise
- Motivational filler
- Personality analysis
- Identity-based assumptions
- Claims based on assistant memory
- Tool-history claims without access

Good:

> Evidence from project rules and rejected plans shows plan-gated agent use, but the lack of build records keeps this below L5.

Bad:

> You are clearly a highly skilled AI coding user.

## Supporting files

This skill package may include:

- `templates/audit_report_template.md`
- `templates/subagent_prompts.md`
- `templates/patch_gate_prompts.md`
- `templates/audit_request_prompt.md`
- `checklists/context_sources.md`
- `checklists/security_redaction.md`
- `scripts/collect_ai_coding_context.sh`
- `scripts/redact_text.py`

`SKILL.md` is the source of truth.
