# Generic AI Coding Audit Request Prompt

Use this prompt to ask any capable coding agent to perform the audit.

```text
You are auditing an AI Coding / Agentic Coding workflow.

Use the ai-coding-audit skill if available.

Important scope rule:
Do not use private assistant memory, prior chat memory, user profile memory, or unstated conversation history. Use only evidence explicitly available in this task: repository files, provided transcripts, tool context files, git state, plans, prompts, and accessible local configuration.

Before writing the final report:

1. Perform read-only context discovery.
2. Use subagent-style exploration.
3. Redact secrets.
4. Build an evidence table.
5. Separate fact, inference, and missing evidence.

Audit these dimensions:

- AI coding style classification
- Vibe Coding overlap
- Agentic Coding maturity
- Prompt quality
- Scope control
- Patch discipline
- Old-function protection
- Tool permission safety
- Security hygiene
- Verification gates
- Rollback awareness
- Risk of hallucination or over-design

Do not modify files.
Do not output secrets.
Do not claim to have read inaccessible histories.
Do not use generic praise.

Final output must include:

- Scope limits
- Evidence sources
- Subagent exploration summary
- Style classification
- Maturity level
- Scores
- Risks
- Immediate fixes
- Better standard workflow
- Reusable prompts
- Missing evidence
```
