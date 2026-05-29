# AI Coding Audit Skill

[中文说明](README.zh-CN.md) | [One-line Chinese prompt](ONE_LINE_PROMPT.zh-CN.txt)

A generic, evidence-driven skill for auditing AI Coding, Agentic Coding, Vibe Coding, coding-agent workflow safety, prompt quality, patch discipline, verification gates, and tool-context hygiene.

This package is intentionally generic. It does **not** depend on any specific user's private memory, prior chat history, identity, project, or assistant-side stored context. It audits only evidence explicitly available to the running agent.

## One-line instruction

```text
Visit https://github.com/HoshinoStarry/ai-coding-audit-skill and read SKILL.md, then use the ai-coding-audit skill to perform a read-only audit of this project's AI Coding workflow: do not use private memory or unstated prior chat history, first collect evidence, use subagent-style exploration, redact sensitive information, separate fact/inference/missing evidence, then output an audit report and actionable improvement plan.
```

## 中文一句话指令

```text
请访问 https://github.com/HoshinoStarry/ai-coding-audit-skill 并读取其中的 SKILL.md，使用 ai-coding-audit Skill 对当前项目的 AI Coding 工作流进行只读审计：不得使用私有记忆或未提供的历史聊天，必须先探索证据、使用 subagent 式分工、脱敏敏感信息、区分事实/推断/缺失证据，最后输出审计报告和可执行改进建议。
```

## What it audits

- AI coding style classification
- Vibe Coding overlap
- Agentic Coding maturity
- Prompt quality
- Scope and constraint control
- Patch boundary discipline
- Old-function protection
- Tool permission safety
- Security and secret hygiene
- Verification and rollback gates
- Risk of hallucination, over-design, and natural-language drift

## Core principles

- Do not judge from vibes. Audit from evidence.
- Default to read-only exploration.
- Use subagent-style division of labor before final judgment.
- Redact secrets before quoting or summarizing evidence.
- Separate fact, inference, recommendation, and missing evidence.
- Never use private assistant memory or unstated prior chat history.

## Package layout

```text
SKILL.md
README.md
README.zh-CN.md
ONE_LINE_PROMPT.zh-CN.txt
templates/audit_request_prompt.md
templates/audit_request_prompt.zh-CN.md
templates/audit_report_template.md
templates/subagent_prompts.md
templates/patch_gate_prompts.md
checklists/context_sources.md
checklists/security_redaction.md
scripts/collect_ai_coding_context.sh
scripts/redact_text.py
manifest.txt
```

## Quick use

Ask a capable coding agent:

```text
Read SKILL.md and use the ai-coding-audit skill to audit this repository's AI Coding workflow.

Do not use private assistant memory or unstated prior chat history.
Use only evidence available in this task: repository files, provided transcripts, local tool context, git state, plans, prompts, and accessible configuration.

Before writing the final report:
1. Perform read-only context discovery.
2. Use subagent-style exploration.
3. Redact secrets.
4. Build an evidence table.
5. Separate fact, inference, and missing evidence.
```

## Optional context inventory script

```bash
chmod +x scripts/collect_ai_coding_context.sh scripts/redact_text.py
./scripts/collect_ai_coding_context.sh . ai-coding-context-inventory.md
```

The script lists common AI coding context locations and basic git state. It does not dump sensitive tool history.

## Redact a text file

```bash
python3 scripts/redact_text.py input.md output.redacted.md
```

## Maturity levels

The skill uses L0 to L5:

- L0: Prompt-and-pray coding
- L1: AI-assisted snippets
- L2: Repo-aware coding
- L3: Plan-gated Agentic Coding
- L4: Supervisor Coding
- L5: Spec-driven Agentic Engineering

L5 requires evidence of small patch boundaries, verification gates, rollback strategy, security redaction, tool permission discipline, and stable specs. No free medals, because software already has enough imaginary achievements.

## Security note

Do not publish raw agent history, shell history, tool settings, or transcript exports without reviewing secrets first. The package includes redaction helpers, but humans still need to supervise. Apparently this remains necessary.
