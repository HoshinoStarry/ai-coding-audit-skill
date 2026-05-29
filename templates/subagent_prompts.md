# Generic Subagent Prompts for AI Coding Audit

Use these prompts as real subagent tasks when supported. If actual subagents are unavailable, simulate the roles and state that clearly.

## Subagent 0: Context Inventory Agent

Task:

Read all accessible AI coding context from the current repository and relevant local tool folders.

Do not use private assistant memory or unstated chat history.

Check for:

- AGENTS.md
- CLAUDE.md
- GEMINI.md
- .cursor/
- .cursor/rules/
- .cursorrules
- .windsurf/
- .windsurfrules
- .clinerules
- .roo/
- .roomodes
- .continue/
- .aider*
- .vscode/
- .github/copilot-instructions.md
- .claude/
- .codex/
- ~/.claude/
- ~/.codex/
- ~/.cursor/
- ~/.continue/
- ~/.cline/
- ~/.roo/
- ~/.aider*
- ~/.windsurf/
- ~/.gemini/
- ~/.qwen/

Output:

- Checked paths
- Found paths
- Not found paths
- No-permission paths
- Cloud-only/unavailable contexts
- Long-term rules discovered
- Workflow evidence
- Security-sensitive files, redacted
- Tool-rule conflicts

Restrictions:

- Read-only only
- Do not output secrets
- Do not modify files
- Do not claim unread files were read

## Subagent 1: Requirement and Constraint Agent

Task:

Extract requirements and constraints from provided evidence.

Classify:

- Must do
- Must not do
- Optional
- Unknown
- Requires verification

Output:

- Requirement map
- Constraint map
- Missing constraints
- Drift risks
- Evidence references

## Subagent 2: Workflow Timeline Agent

Task:

Reconstruct the workflow from available evidence.

Look for:

- Read-only exploration before edits
- Plan mode usage
- Subagent usage
- Plan rejection/approval
- Direct execution moments
- Build/test loops
- Review/verification steps

Output:

- Timeline
- Evidence
- Repeated patterns
- Weak points
- Vibe-like behaviors

## Subagent 3: Old-Function Protection Agent

Task:

Evaluate whether existing behavior is protected from agent overreach.

Look for:

- Do-not-change rules
- No unrelated refactor rules
- Existing command protection
- UI/API/config compatibility
- Permission logic preservation
- Regression risks

Output:

- Protected areas
- Unprotected areas
- Likely regression risks
- Suggested patch boundaries
- Regression checklist

## Subagent 4: Security / Config / Permission Agent

Task:

Audit security posture.

Look for:

- Approval mode
- Sandbox mode
- Danger/yolo flags
- Secrets in rules/history
- Password/token/deviceId/cookie exposure
- Admin command boundaries
- Config write-back behavior
- Background task risks

Output:

- Security evidence
- Sensitive-field inventory
- Permission risks
- Immediate fixes
- Long-term policy suggestions

## Subagent 5: External API / Field Semantics Agent

Task:

Evaluate handling of external APIs, HAR data, logs, DTOs, field names, and runtime assumptions.

Look for:

- API evidence
- Field assumptions
- Unverified semantics
- DTO compatibility
- Retry and failure behavior
- Rate limits / side effects
- Auto-trigger risks

Output:

- API evidence
- Field assumptions
- Must-test fields
- Runtime verification plan
- Safer DTO / error-handling suggestions

## Subagent 6: Verification / Test / Rollback Agent

Task:

Evaluate whether completion is proven.

Look for:

- Build commands
- Typecheck
- Lint
- Unit tests
- Integration tests
- Manual verification
- Failure-path tests
- Concurrency tests
- Security leak checks
- Rollback plan
- Diff review

Output:

- Verification evidence
- Missing verification gates
- Required commands
- Manual test checklist
- Rollback checklist
- Final delivery gate
