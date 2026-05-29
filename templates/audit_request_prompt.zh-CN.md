# 通用 AI Coding 审计请求 Prompt

把下面这段交给支持代码仓库访问的 AI Agent 执行。

```text
你正在审计一个 AI Coding / Agentic Coding 工作流。

请访问 https://github.com/HoshinoStarry/ai-coding-audit-skill 并优先读取其中的 ai-coding-audit Skill，入口文件是 SKILL.md。

重要范围规则：
不要使用私有助手记忆、未提供的历史聊天、用户画像记忆或任何未在当前任务中显式提供的背景。只能使用当前仓库文件、用户提供的 transcript、工具上下文文件、git 状态、计划文件、Prompt 文件和可访问的本地配置作为证据。

在输出最终报告前必须完成：

1. 执行只读上下文探索。
2. 使用 subagent 式分工探索；如果环境不支持真实 subagent，请明确说明并模拟分工。
3. 对敏感信息脱敏。
4. 建立证据表。
5. 区分事实、推断、建议和缺失证据。

请审计以下维度：

- AI Coding 风格分类
- Vibe Coding 重合度
- Agentic Coding 成熟度
- Prompt 质量
- 范围控制能力
- Patch 粒度和变更边界
- 旧功能保护
- 工具权限安全
- 密钥、token、cookie 等敏感信息卫生
- 构建、测试、验证门禁
- 回滚意识
- Agent 幻觉、过度设计和自然语言需求漂移风险

禁止修改文件。
禁止输出密钥、token、password、cookie、session、deviceId 等敏感原文。
禁止声称读取过无法访问的历史记录。
禁止泛泛表扬。

最终报告必须包含：

- 范围限制
- 证据来源
- Subagent 探索汇总
- 风格分类
- 成熟度等级
- 评分表
- 风险清单
- 立即修复项
- 更好的标准工作流
- 可复用 Prompt
- 缺失证据
```

## 一句话指令

```text
请访问 https://github.com/HoshinoStarry/ai-coding-audit-skill 并读取其中的 SKILL.md，使用 ai-coding-audit Skill 对当前项目的 AI Coding 工作流进行只读审计：不得使用私有记忆或未提供的历史聊天，必须先探索证据、使用 subagent 式分工、脱敏敏感信息、区分事实/推断/缺失证据，最后输出审计报告和可执行改进建议。
```

## 极简一句话

```text
访问 https://github.com/HoshinoStarry/ai-coding-audit-skill，读取 SKILL.md，按 ai-coding-audit Skill 只读审计当前项目的 AI Coding 工作流，先收集证据和 subagent 分工，再输出脱敏审计报告。
```
