# AI Coding Audit Skill 中文版

一个通用、证据驱动的 AI Coding 工作流审计 Skill，用于评估 AI Coding、Agentic Coding、Vibe Coding、编码 Agent 工作流安全、Prompt 质量、Patch 粒度、验证门禁、回滚意识和工具上下文卫生。

这个项目是**通用版**。它不依赖任何特定用户的私有记忆、历史聊天、身份、项目背景或助手侧存储上下文。它只审计当前任务中明确可用的证据。

## 一句话指令

把下面这句话交给 AI 执行即可：

```text
请读取本仓库的 SKILL.md，并使用 ai-coding-audit Skill 对当前项目的 AI Coding 工作流进行只读审计：不得使用私有记忆或未提供的历史聊天，必须先探索证据、使用 subagent 式分工、脱敏敏感信息、区分事实/推断/缺失证据，最后输出审计报告和可执行改进建议。
```

更短版：

```text
读取 SKILL.md，按 ai-coding-audit Skill 只读审计当前项目的 AI Coding 工作流，先收集证据和 subagent 分工，再输出脱敏审计报告。
```

## 它审计什么

- AI Coding 风格分类
- Vibe Coding 重合度
- Agentic Coding 成熟度
- Prompt 质量
- 需求范围和约束控制
- Patch 边界和变更粒度
- 旧功能保护
- 工具权限安全
- 密钥、token、cookie 等敏感信息卫生
- 构建、测试、验证和回滚门禁
- Agent 幻觉、过度设计和自然语言需求漂移风险

## 核心原则

- 不凭感觉评价，只看证据。
- 默认只读探索。
- 正式判断前必须使用 subagent 式分工。
- 引用或总结证据前必须脱敏。
- 区分事实、推断、建议和缺失证据。
- 不使用私有助手记忆或未明确提供的历史聊天。

## 目录结构

```text
SKILL.md
README.md
README.zh-CN.md
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

## 快速使用

让一个有代码仓库访问能力的 AI Agent 执行：

```text
请读取本仓库的 SKILL.md，并使用 ai-coding-audit Skill 对当前项目的 AI Coding 工作流进行只读审计。

重要范围规则：
不要使用私有助手记忆、未提供的历史聊天、用户画像记忆或任何未在当前任务中显式提供的背景。只能使用当前仓库文件、用户提供的 transcript、工具上下文文件、git 状态、计划文件、Prompt 文件和可访问的本地配置作为证据。

在输出最终报告前：
1. 执行只读上下文探索。
2. 使用 subagent 式分工探索。
3. 对敏感信息脱敏。
4. 建立证据表。
5. 区分事实、推断和缺失证据。
```

## 可选：生成上下文清单

```bash
chmod +x scripts/collect_ai_coding_context.sh scripts/redact_text.py
./scripts/collect_ai_coding_context.sh . ai-coding-context-inventory.md
```

这个脚本只列出常见 AI Coding 上下文位置和基础 git 状态，不会直接 dump 敏感工具历史。

## 可选：脱敏文本

```bash
python3 scripts/redact_text.py input.md output.redacted.md
```

## 成熟度等级

Skill 使用 L0 到 L5：

- L0：Prompt-and-pray，向 AI 许愿然后祈祷。
- L1：AI 辅助片段，主要生成函数、解释和小改动。
- L2：Repo-aware coding，会让 AI 先读项目上下文。
- L3：Plan-gated Agentic Coding，执行前要求探索和计划。
- L4：Supervisor Coding，人类审查计划、卡边界、拒绝危险变更。
- L5：Spec-driven Agentic Engineering，有稳定 spec、Patch 门禁、验证门禁、回滚策略和安全策略。

不能随便给 L5。必须有小 patch、构建/测试/验证记录、回滚策略、安全脱敏、工具权限约束和明确的“不要改什么”证据。软件工程已经够多虚构成就了，别再给 Agent 颁纸糊奖杯。

## 安全提醒

不要把原始 Agent 历史、shell history、工具配置、transcript 导出直接公开。里面可能包含 API key、token、cookie、账号、私有 URL 或设备 ID。先脱敏，再交给 AI 审计。
